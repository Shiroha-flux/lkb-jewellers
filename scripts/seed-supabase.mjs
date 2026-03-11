// Supabase seeder — reads static TypeScript data and populates engagement_rings tables
// Run: bun scripts/seed-supabase.mjs
// This script does NOT modify any source files.

import { engagementRings } from '../src/data/engagement-rings.ts'
import { recommendedGemstones } from '../src/data/gemstone-options.ts'

const SUPABASE_URL = 'https://ttiwmcrfahbczzehmyds.supabase.co'
const ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0aXdtY3JmYWhiY3p6ZWhteWRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE1NzE2ODQsImV4cCI6MjA4NzE0NzY4NH0.dpS222gT1P9jG-8qylWh24ymUyAjjZvvI_7v7C6ZuM0'

const headers = {
  'apikey': ANON_KEY,
  'Authorization': `Bearer ${ANON_KEY}`,
  'Content-Type': 'application/json',
  'Prefer': 'return=representation',
}

async function post(table, data) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}`, {
    method: 'POST',
    headers,
    body: JSON.stringify(data),
  })
  if (!res.ok) {
    const err = await res.text()
    // 409 = conflict (duplicate), skip silently
    if (res.status === 409) return null
    throw new Error(`POST /${table} failed ${res.status}: ${err}`)
  }
  const json = await res.json()
  return Array.isArray(json) ? json[0] : json
}

async function seedRing(ring) {
  // Insert main ring record
  const ringRecord = await post('engagement_rings', {
    slug: ring.slug,
    name: ring.name,
    title: ring.title,
    description: ring.description || '',
    base_price_usd: ring.basePrice || 0,
    currency: 'USD',
    shape: ring.shape || null,
    setting_style: ring.settingStyle || null,
    band_type: ring.bandType || null,
    setting_profile: ring.settingProfile || null,
    is_active: true,
  })

  if (!ringRecord) return // conflict — already exists, skip children
  const ringId = ringRecord.id

  // Images
  const images = ring.images || []
  const thumbs = ring.thumbnails || []
  for (let i = 0; i < images.length; i++) {
    await post('engagement_ring_images', {
      id: `${ring.slug}-img-${i}`,
      _order: i + 1,
      _parent_id: ringId,
      image_url: images[i],
      thumbnail_url: thumbs[i] || thumbs[0] || null,
    })
  }

  // Metal options
  for (let i = 0; i < (ring.metalOptions || []).length; i++) {
    await post('engagement_ring_metal_options', {
      id: `${ring.slug}-metal-${i}`,
      _order: i + 1,
      _parent_id: ringId,
      value: ring.metalOptions[i],
      label: ring.metalOptions[i],
    })
  }

  // Setting options
  for (let i = 0; i < (ring.settingOptions || []).length; i++) {
    await post('engagement_ring_setting_options', {
      id: `${ring.slug}-setting-${i}`,
      _order: i + 1,
      _parent_id: ringId,
      value: ring.settingOptions[i],
      label: ring.settingOptions[i],
    })
  }

  // Side stone options
  for (let i = 0; i < (ring.sideStonesOptions || []).length; i++) {
    await post('engagement_ring_side_stone_options', {
      id: `${ring.slug}-stone-${i}`,
      _order: i + 1,
      _parent_id: ringId,
      value: ring.sideStonesOptions[i],
      label: ring.sideStonesOptions[i],
    })
  }

  // Ring sizes
  for (let i = 0; i < (ring.ringSizes || []).length; i++) {
    await post('engagement_ring_sizes', {
      id: `${ring.slug}-size-${i}`,
      _order: i + 1,
      _parent_id: ringId,
      size: ring.ringSizes[i],
    })
  }

  // Specs
  const specs = ring.specs || {}
  await post('engagement_ring_specs', {
    id: `${ring.slug}-specs`,
    ring_id: ringId,
    band_width: specs.bandWidth || null,
    avg_side_stones: specs.avgSideStones || null,
    center_stone_size: specs.centerStoneSize || null,
    claw_count: specs.clawCount || null,
    estimated_weight: specs.estimatedWeight || null,
    resizable: true,
  })
}

async function seedGemstones() {
  console.log(`Seeding ${recommendedGemstones.length} gemstones...`)
  for (const gem of recommendedGemstones) {
    await post('gemstones', {
      stone_type: gem.type,
      carat: gem.carat,
      clarity: gem.clarity,
      colour: gem.colour,
      dimensions: gem.dimensions || null,
      price_usd: gem.price || 0,
      image_url: gem.imageUrl || null,
      is_active: true,
    })
  }
  console.log('Gemstones seeded.')
}

async function main() {
  console.log(`Starting seed: ${engagementRings.length} engagement rings`)
  console.log(`Supabase: ${SUPABASE_URL}`)
  console.log()

  let success = 0
  let skipped = 0
  let errors = 0

  for (let i = 0; i < engagementRings.length; i++) {
    const ring = engagementRings[i]
    process.stdout.write(`[${i + 1}/${engagementRings.length}] ${ring.name}... `)
    try {
      await seedRing(ring)
      success++
      process.stdout.write('✓\n')
    } catch (err) {
      if (err.message.includes('conflict') || err.message.includes('409')) {
        skipped++
        process.stdout.write('skip\n')
      } else {
        errors++
        process.stdout.write(`ERROR: ${err.message}\n`)
      }
    }
  }

  console.log()
  console.log(`Rings: ${success} inserted, ${skipped} skipped, ${errors} errors`)
  console.log()

  await seedGemstones()
  console.log('\nSeeding complete!')
}

main().catch(console.error)
