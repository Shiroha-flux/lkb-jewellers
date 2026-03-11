// migrate-images-v2.mjs
// Scrapes Cullen CDN image URLs from HTML, downloads, uploads to Supabase Storage
// Run: bun scripts/migrate-images-v2.mjs
// Supports --resume to skip already-migrated rings

import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://ttiwmcrfahbczzehmyds.supabase.co'
const ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0aXdtY3JmYWhiY3p6ZWhteWRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE1NzE2ODQsImV4cCI6MjA4NzE0NzY4NH0.dpS222gT1P9jG-8qylWh24ymUyAjjZvvI_7v7C6ZuM0'
const BUCKET = 'engagement-rings'

const supabase = createClient(SUPABASE_URL, ANON_KEY, { auth: { persistSession: false } })

const COLORS = [
  { key: 'yellow', urlParam: '18k-yellow-gold' },
  { key: 'white',  urlParam: '18k-white-gold' },
  { key: 'rose',   urlParam: '18k-rose-gold' },
]

const HEADERS = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
  'Accept': 'text/html,application/xhtml+xml',
  'Accept-Language': 'en-US,en;q=0.9',
}

function extractFirstImageUrl(html, ringName, color) {
  // Match full-size renders (no -preview suffix, not width=100)
  const pattern = new RegExp(
    `media\\.cullenjewellery\\.com/cdn-cgi/image/width=\\d+[^"'\\s]*/products/rings/${ringName}/renders/[^"'\\s]*/${color}/([^"'\\s]+)`,
    'gi'
  )
  const matches = []
  let m
  while ((m = pattern.exec(html)) !== null) {
    const url = 'https://' + m[0]
    // Prefer full-size (width=800) and non-preview
    if (!url.includes('-preview') && url.includes('width=800')) {
      matches.unshift(url)
    } else if (!url.includes('-preview')) {
      matches.push(url)
    }
  }
  // Also try without cdn-cgi prefix (direct URL)
  if (matches.length === 0) {
    const directPattern = new RegExp(
      `media\\.cullenjewellery\\.com/products/rings/${ringName}/renders/[^"'\\s]*/${color}/([^"'\\s]+)`,
      'gi'
    )
    while ((m = directPattern.exec(html)) !== null) {
      const url = 'https://' + m[0]
      if (!url.includes('-preview')) matches.push(url)
    }
  }
  return matches[0] || null
}

async function fetchWithRetry(url, opts = {}, retries = 3) {
  for (let i = 0; i < retries; i++) {
    try {
      const res = await fetch(url, { ...opts, signal: AbortSignal.timeout(15000) })
      if (res.ok) return res
      if (res.status === 429) {
        await new Promise(r => setTimeout(r, 2000 * (i + 1)))
        continue
      }
      return res
    } catch (e) {
      if (i === retries - 1) throw e
      await new Promise(r => setTimeout(r, 1000))
    }
  }
}

async function processRing(slug) {
  const ringName = slug.replace('ring-', '')
  const results = []

  for (const { key, urlParam } of COLORS) {
    const pageUrl = `https://cullenjewellery.com/engagement-rings/${slug}/melee-stones:lab-diamond+metal-type:${urlParam}`
    
    // Fetch page HTML
    let html
    try {
      const res = await fetchWithRetry(pageUrl, { headers: HEADERS })
      if (!res.ok) {
        results.push({ color: key, status: `page_fail_${res.status}` })
        continue
      }
      html = await res.text()
    } catch (e) {
      results.push({ color: key, status: `page_error: ${e.message}` })
      continue
    }

    // Extract image URL (title-case color: Yellow, White, Rose)
    const colorTitle = key.charAt(0).toUpperCase() + key.slice(1)
    const imgUrl = extractFirstImageUrl(html, ringName, colorTitle)
    if (!imgUrl) {
      results.push({ color: key, status: 'no_url_found' })
      continue
    }

    // Download image (use width=800 for best quality)
    const downloadUrl = imgUrl.replace(/width=\d+,height=\d+/, 'width=800,height=800')
    let imgBuffer
    try {
      const imgRes = await fetchWithRetry(downloadUrl, { headers: HEADERS })
      if (!imgRes.ok) {
        results.push({ color: key, status: `img_fail_${imgRes.status}` })
        continue
      }
      imgBuffer = await imgRes.arrayBuffer()
    } catch (e) {
      results.push({ color: key, status: `img_error: ${e.message}` })
      continue
    }

    // Upload to Storage
    const storagePath = `rings/${ringName}/${key}.jpg`
    const { error: upErr } = await supabase.storage
      .from(BUCKET)
      .upload(storagePath, imgBuffer, { contentType: 'image/jpeg', upsert: true })

    if (upErr) {
      results.push({ color: key, status: `upload_fail: ${upErr.message}` })
      continue
    }

    const storageUrl = `${SUPABASE_URL}/storage/v1/object/public/${BUCKET}/${storagePath}`
    results.push({ color: key, status: 'ok', url: storageUrl })

    // Small delay to be respectful
    await new Promise(r => setTimeout(r, 200))
  }

  return results
}

async function updateRingImages(slug, colorResults) {
  // Get ring ID
  const { data: ring } = await supabase
    .from('engagement_rings')
    .select('id')
    .eq('slug', slug)
    .single()
  if (!ring) return

  // Delete old images
  await supabase.from('engagement_ring_images').delete().eq('_parent_id', ring.id)

  // Insert new images (only successful ones)
  const successfulColors = colorResults.filter(r => r.status === 'ok')
  for (let i = 0; i < successfulColors.length; i++) {
    const { color, url } = successfulColors[i]
    await supabase.from('engagement_ring_images').insert({
      id: `${slug}-img-${color}`,
      _order: i + 1,
      _parent_id: ring.id,
      image_url: url,
      thumbnail_url: url,
    })
  }
}

async function main() {
  const resume = process.argv.includes('--resume')
  
  // Get all ring slugs
  const { data: rings } = await supabase
    .from('engagement_rings')
    .select('slug')
    .order('slug')

  if (!rings) { console.error('Failed to fetch rings'); process.exit(1) }

  // If resume, skip rings that already have supabase storage images
  let toProcess = rings
  if (resume) {
    const { data: migratedImages } = await supabase
      .from('engagement_ring_images')
      .select('_parent_id, image_url')
      .like('image_url', '%supabase%')
    const migratedRingIds = new Set((migratedImages || []).map(i => i._parent_id))
    const { data: allRings } = await supabase
      .from('engagement_rings')
      .select('id, slug')
    toProcess = (allRings || []).filter(r => !migratedRingIds.has(r.id))
    console.log(`Resuming: ${toProcess.length} rings remaining`)
  }

  console.log(`Processing ${toProcess.length} rings...`)
  let ok = 0, failed = 0

  for (let i = 0; i < toProcess.length; i++) {
    const { slug } = toProcess[i]
    process.stdout.write(`[${i+1}/${toProcess.length}] ${slug}... `)
    
    try {
      const results = await processRing(slug)
      const successCount = results.filter(r => r.status === 'ok').length
      const failCount = results.filter(r => r.status !== 'ok').length
      
      if (successCount > 0) {
        await updateRingImages(slug, results)
        ok++
        process.stdout.write(`✓ (${successCount} imgs)`)
      } else {
        failed++
        process.stdout.write(`✗ ${results.map(r => r.status).join(', ')}`)
      }

      // Log failures for debugging
      results.filter(r => r.status !== 'ok').forEach(r => {
        process.stdout.write(` [${r.color}:${r.status}]`)
      })
    } catch (e) {
      failed++
      process.stdout.write(`ERROR: ${e.message}`)
    }
    process.stdout.write('\n')
  }

  console.log(`\nDone: ${ok} ok, ${failed} failed`)
}

main().catch(console.error)
