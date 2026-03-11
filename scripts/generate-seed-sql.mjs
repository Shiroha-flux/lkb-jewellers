// Temporary seeder script — generates SQL for all 225 engagement rings
// Run: bun scripts/generate-seed-sql.mjs
// This script does NOT modify any source files.
import { engagementRings } from '../src/data/engagement-rings.ts'
import { recommendedGemstones } from '../src/data/gemstone-options.ts'
import { writeFileSync, mkdirSync } from 'fs'
import { join } from 'path'

const esc = (str) => (str || '').replace(/'/g, "''")

const VALID_SHAPES = ['round','oval','emerald','radiant','pear','cushion','elongated_cushion','elongated_hexagon','marquise','princess','asscher','heart']
const VALID_STYLES = ['solitaire','halo','trilogy','toi_et_moi','bezel','east_west']
const VALID_BAND_TYPES = ['plain','pave','accents']
const VALID_PROFILES = ['high_set','low_set']

function castEnum(val, valid, enumName) {
  if (!val || !valid.includes(val)) return 'NULL'
  return `'${val}'::${enumName}`
}

function generateRingSQL(ring) {
  const slug = ring.slug
  const name = esc(ring.name)
  const title = esc(ring.title)
  const desc = esc(ring.description || '')
  const price = ring.basePrice || 0
  const shape = castEnum(ring.shape, VALID_SHAPES, 'enum_ring_shape')
  const style = castEnum(ring.settingStyle, VALID_STYLES, 'enum_ring_setting_style')
  const band = castEnum(ring.bandType, VALID_BAND_TYPES, 'enum_ring_band_type')
  const profile = castEnum(ring.settingProfile, VALID_PROFILES, 'enum_ring_setting_profile')

  const images = ring.images || []
  const thumbnails = ring.thumbnails || []
  const metals = ring.metalOptions || []
  const settings = ring.settingOptions || []
  const sideStones = ring.sideStonesOptions || []
  const sizes = ring.ringSizes || []
  const specs = ring.specs || {}

  let sql = `
-- Ring: ${ring.name} (${slug})
DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES ('${esc(slug)}', '${name}', '${title}', '${desc}', ${price}, 'USD', ${shape}, ${style}, ${band}, ${profile})
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NOT NULL THEN`

  // Images
  if (images.length > 0) {
    const imgRows = images.map((img, i) => {
      const thumb = thumbnails[i] || thumbnails[0] || null
      return `    ('${slug}-img-${i}', ${i + 1}, v_id, '${esc(img)}', ${thumb ? `'${esc(thumb)}'` : 'NULL'})`
    }).join(',\n')
    sql += `
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
${imgRows};`
  }

  // Metal options
  if (metals.length > 0) {
    const metalRows = metals.map((m, i) =>
      `    ('${slug}-metal-${i}', ${i + 1}, v_id, '${esc(m)}', '${esc(m)}')`
    ).join(',\n')
    sql += `
    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
${metalRows};`
  }

  // Setting options
  if (settings.length > 0) {
    const settingRows = settings.map((s, i) =>
      `    ('${slug}-setting-${i}', ${i + 1}, v_id, '${esc(s)}', '${esc(s)}')`
    ).join(',\n')
    sql += `
    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
${settingRows};`
  }

  // Side stone options
  if (sideStones.length > 0) {
    const stoneRows = sideStones.map((s, i) =>
      `    ('${slug}-stone-${i}', ${i + 1}, v_id, '${esc(s)}', '${esc(s)}')`
    ).join(',\n')
    sql += `
    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
${stoneRows};`
  }

  // Ring sizes
  if (sizes.length > 0) {
    const sizeRows = sizes.map((s, i) =>
      `    ('${slug}-size-${i}', ${i + 1}, v_id, '${esc(s)}')`
    ).join(',\n')
    sql += `
    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
${sizeRows};`
  }

  // Specs
  const hasSpecs = specs && Object.values(specs).some(v => v)
  const bw = hasSpecs && specs.bandWidth ? `'${esc(specs.bandWidth)}'` : 'NULL'
  const avg = hasSpecs && specs.avgSideStones ? `'${esc(specs.avgSideStones)}'` : 'NULL'
  const cs = hasSpecs && specs.centerStoneSize ? `'${esc(specs.centerStoneSize)}'` : 'NULL'
  const cc = hasSpecs && specs.clawCount ? `'${esc(specs.clawCount)}'` : 'NULL'
  const ew = hasSpecs && specs.estimatedWeight ? `'${esc(specs.estimatedWeight)}'` : 'NULL'
  const resizable = specs.resizing ? 'true' : 'true'

  sql += `
    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES ('${slug}-specs', v_id, ${bw}, ${avg}, ${cs}, ${cc}, ${ew}, ${resizable});`

  sql += `
  END IF;
END $$;`

  return sql
}

// Generate ring SQL in batches of 25
const BATCH_SIZE = 25
const outputDir = '/tmp/ring-seed-sql'
mkdirSync(outputDir, { recursive: true })

const totalBatches = Math.ceil(engagementRings.length / BATCH_SIZE)
console.log(`Generating SQL for ${engagementRings.length} rings in ${totalBatches} batches of ${BATCH_SIZE}...`)

for (let b = 0; b < totalBatches; b++) {
  const batch = engagementRings.slice(b * BATCH_SIZE, (b + 1) * BATCH_SIZE)
  const sql = batch.map(generateRingSQL).join('\n')
  const filename = join(outputDir, `batch-${String(b + 1).padStart(2, '0')}.sql`)
  writeFileSync(filename, sql, 'utf8')
  console.log(`Batch ${b + 1}/${totalBatches}: ${batch.length} rings → ${filename}`)
}

// Generate gemstone SQL
const VALID_STONE_TYPES = ['lab_grown_diamond','natural_diamond','moissanite','lab_grown_sapphire']
const VALID_CLARITY = ['VS1','VS2','VVS1','VVS2','IF']
const VALID_COLOUR = ['D','E','F','G','H']

const gemRows = recommendedGemstones
  .filter(g => VALID_STONE_TYPES.includes(g.type) && VALID_CLARITY.includes(g.clarity) && VALID_COLOUR.includes(g.colour))
  .map(g => `  ('${g.type}'::enum_gemstone_stone_type, ${g.carat}, '${g.clarity}'::enum_gemstone_clarity, '${g.colour}'::enum_gemstone_colour, '${esc(g.dimensions || '')}', ${g.price || 0}, '${esc(g.imageUrl || '')}', true)`)
  .join(',\n')

const gemstoneSql = `INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
VALUES
${gemRows}
ON CONFLICT DO NOTHING;`

const gemFile = join(outputDir, 'gemstones.sql')
writeFileSync(gemFile, gemstoneSql, 'utf8')
console.log(`Gemstones SQL → ${gemFile}`)

console.log('\nDone! SQL files generated in /tmp/ring-seed-sql/')
console.log('Files:')
for (let b = 1; b <= totalBatches; b++) {
  console.log(`  batch-${String(b).padStart(2, '0')}.sql`)
}
console.log('  gemstones.sql')
