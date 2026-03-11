// Script upload hover images baru ke Supabase Storage
// Jalankan: node scripts/upload-hover-images.mjs

import { createClient } from '@supabase/supabase-js'
import { readFileSync, readdirSync, statSync } from 'fs'
import { join, extname, basename } from 'path'

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL ?? 'https://ttiwmcrfahbczzehmyds.supabase.co'
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SECRET_KEY ?? ''

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY)

// Ring yang perlu diupload (skip adina karena itu hanya reference)
const RINGS_TO_UPLOAD = [
  'adelyn',
  'arlo',
  'ayla',
  'chantelle',
  'daya',
  'ella',
  'penelope',
  'poppy',
  'shai',
]

// File yang merupakan hasil generate baru (bukan reference lama dari Supabase)
// Format: { ringname: ['filename', ...] }
const NEW_FILES = {
  adelyn:    ['yellow_2.png'],
  arlo:      ['rose_2.png'],
  ayla:      ['rose_2.png'],
  chantelle: ['white_1.png'],
  daya:      ['white_2.jpg'],
  ella:      ['white_2.jpg'],
  penelope:  ['yellow_2.jpg'],
  poppy:     ['white_2.jpg'],
  shai:      ['white_2.jpg'],
}

async function uploadFile(localPath, storagePath, contentType) {
  const fileBuffer = readFileSync(localPath)

  const { error } = await supabase.storage
    .from('engagement-rings')
    .upload(storagePath, fileBuffer, {
      contentType,
      upsert: true, // overwrite jika sudah ada
    })

  if (error) {
    throw new Error(error.message)
  }
}

function getContentType(filename) {
  const ext = extname(filename).toLowerCase()
  if (ext === '.png') return 'image/png'
  if (ext === '.jpg' || ext === '.jpeg') return 'image/jpeg'
  return 'image/jpeg'
}

async function main() {
  console.log('🚀 Mulai upload hover images ke Supabase...\n')

  let success = 0
  let fail = 0
  const errors = []

  for (const ring of RINGS_TO_UPLOAD) {
    const files = NEW_FILES[ring]
    if (!files || files.length === 0) continue

    for (const filename of files) {
      const localPath = join('new-resource', 'openart-reference', ring, filename)
      
      // Upload dengan ekstensi asli dulu, tapi simpan sebagai .jpg di Supabase
      // Karena URL di ring-hover-box-map.json pakai .jpg
      const targetFilename = filename.replace('.png', '.jpg')
      const storagePath = `rings/${ring}/${targetFilename}`
      const contentType = getContentType(filename)

      try {
        await uploadFile(localPath, storagePath, contentType)
        console.log(`✅ ${storagePath}`)
        success++
      } catch (err) {
        console.log(`❌ ${storagePath} — ${err.message}`)
        errors.push({ path: storagePath, error: err.message })
        fail++
      }
    }
  }

  console.log(`\n📊 Hasil: ${success} berhasil, ${fail} gagal`)

  if (errors.length > 0) {
    console.log('\n❌ Error detail:')
    errors.forEach(e => console.log(`  - ${e.path}: ${e.error}`))
  }

  if (success > 0) {
    console.log('\n✨ Upload selesai! Langkah selanjutnya:')
    console.log('   Update ring-hover-box-map.json dengan URL baru')
  }
}

main().catch(console.error)
