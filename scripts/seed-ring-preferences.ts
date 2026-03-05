/**
 * Seed script: populate ring_image_preferences dari ring-hover-box-map.json
 *
 * Jalankan dengan:
 *   npx tsx scripts/seed-ring-preferences.ts
 *
 * Script ini membaca hover URLs dari ring-hover-box-map.json dan MANUAL_HOVER_OVERRIDES,
 * lalu menyimpannya ke tabel ring_image_preferences sebagai hover_url.
 * thumbnail_url dibiarkan null (admin bisa set manual via dashboard).
 *
 * Aman dijalankan berkali-kali (upsert, tidak duplikat).
 */

import { createClient } from '@supabase/supabase-js'
import hoverBoxMapRaw from '../src/data/ring-hover-box-map.json'

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY ?? process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

if (!SUPABASE_URL || !SUPABASE_KEY) {
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY')
  process.exit(1)
}

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY)

type ColorKey = 'yellow' | 'white' | 'rose'
type HoverBoxMap = Record<string, Partial<Record<ColorKey, string>>>

const hoverBoxMap = hoverBoxMapRaw as HoverBoxMap

// Manual overrides (sama seperti di ring-card.tsx)
const MANUAL_HOVER_OVERRIDES: Partial<Record<string, Partial<Record<ColorKey, string>>>> = {
  'ring-allison': {
    yellow: 'https://ttiwmcrfahbczzehmyds.supabase.co/storage/v1/object/public/engagement-rings/rings/allison/yellow_2.jpg',
    white: 'https://ttiwmcrfahbczzehmyds.supabase.co/storage/v1/object/public/engagement-rings/rings/allison/white_2.jpg',
    rose: 'https://ttiwmcrfahbczzehmyds.supabase.co/storage/v1/object/public/engagement-rings/rings/allison/rose_2.jpg',
  },
  'ring-alexia': {
    yellow: 'https://ttiwmcrfahbczzehmyds.supabase.co/storage/v1/object/public/engagement-rings/rings/alexia/yellow_5.jpg',
    white: 'https://ttiwmcrfahbczzehmyds.supabase.co/storage/v1/object/public/engagement-rings/rings/alexia/white_5.jpg',
    rose: 'https://ttiwmcrfahbczzehmyds.supabase.co/storage/v1/object/public/engagement-rings/rings/alexia/rose_5.jpg',
  },
}

async function main() {
  // Merge: manual overrides take priority over JSON map
  const merged: HoverBoxMap = { ...hoverBoxMap }
  for (const [slug, colors] of Object.entries(MANUAL_HOVER_OVERRIDES)) {
    merged[slug] = { ...(merged[slug] ?? {}), ...colors }
  }

  const rows: { ring_slug: string; color: string; thumbnail_url: null; hover_url: string }[] = []

  for (const [slug, colorMap] of Object.entries(merged)) {
    for (const [color, hoverUrl] of Object.entries(colorMap)) {
      if (!hoverUrl) continue
      rows.push({
        ring_slug: slug,
        color,
        thumbnail_url: null,
        hover_url: hoverUrl,
      })
    }
  }

  console.log(`Seeding ${rows.length} preferences...`)

  // Upsert in batches of 50
  const BATCH = 50
  let inserted = 0
  for (let i = 0; i < rows.length; i += BATCH) {
    const batch = rows.slice(i, i + BATCH)
    const { error } = await supabase
      .from('ring_image_preferences')
      .upsert(batch, { onConflict: 'ring_slug,color', ignoreDuplicates: false })

    if (error) {
      console.error(`Batch ${i / BATCH + 1} error:`, error.message)
    } else {
      inserted += batch.length
      console.log(`  ✓ ${inserted}/${rows.length}`)
    }
  }

  console.log(`Done! ${inserted} preferences seeded.`)
}

main().catch(err => {
  console.error(err)
  process.exit(1)
})
