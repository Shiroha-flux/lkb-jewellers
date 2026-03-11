import { readFileSync, writeFileSync } from 'node:fs'

const rings = JSON.parse(readFileSync('.sisyphus/evidence/rings.json', 'utf8'))

const shapeSet = new Set([
  'round',
  'oval',
  'emerald',
  'radiant',
  'pear',
  'cushion',
  'elongated_cushion',
  'elongated_hexagon',
  'marquise',
  'princess',
  'asscher',
  'heart',
])

const settingStyleSet = new Set(['solitaire', 'halo', 'trilogy', 'toi_et_moi', 'bezel', 'east_west'])
const bandTypeSet = new Set(['plain', 'pave', 'accents'])
const settingProfileSet = new Set(['high_set', 'low_set'])

const q = (value) => `'${String(value).replace(/'/g, "''")}'`
const txt = (value) => (value === undefined || value === null || value === '' ? 'NULL' : q(value))
const num = (value) => (value === undefined || value === null || Number.isNaN(Number(value)) ? 'NULL' : String(Number(value)))
const enumOrNull = (value, type, set) => (set.has(value) ? `${q(value)}::${type}` : 'NULL')

const toResizable = (value) => {
  if (value === undefined || value === null || value === '') return 'NULL'
  const normalized = String(value).toLowerCase()

  if (normalized.includes('not') || normalized.includes('no')) return 'false'
  if (
    normalized.includes('complimentary') ||
    normalized.includes('yes') ||
    normalized.includes('true') ||
    normalized.includes('resiz')
  ) {
    return 'true'
  }

  return 'NULL'
}

const buildValues = (rows) => rows.map((row) => `(${row.join(', ')})`).join(',\n      ')

const buildRingBlock = (ring) => {
  const slug = txt(ring.slug)
  const thumbnail = Array.isArray(ring.thumbnails) && ring.thumbnails.length > 0 ? txt(ring.thumbnails[0]) : 'NULL'
  const specs = ring.specs || {}

  let sql = `DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    ${slug},
    ${txt(ring.name)},
    ${txt(ring.title)},
    ${txt(ring.description)},
    ${num(ring.basePrice)},
    ${txt(ring.currency)},
    ${enumOrNull(ring.shape, 'enum_ring_shape', shapeSet)},
    ${enumOrNull(ring.settingStyle, 'enum_ring_setting_style', settingStyleSet)},
    ${enumOrNull(ring.bandType, 'enum_ring_band_type', bandTypeSet)},
    ${enumOrNull(ring.settingProfile, 'enum_ring_setting_profile', settingProfileSet)}
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = ${slug};
  END IF;

  IF v_id IS NOT NULL THEN
`

  const images = Array.isArray(ring.images) ? ring.images : []
  if (images.length > 0) {
    const rows = images.map((image, index) => [
      txt(`${ring.slug}-img-${index}`),
      String(index + 1),
      'v_id',
      txt(image),
      thumbnail,
    ])
    sql += `    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ${buildValues(rows)}
    ON CONFLICT (id) DO NOTHING;

`
  }

  const metalOptions = Array.isArray(ring.metalOptions) ? ring.metalOptions : []
  if (metalOptions.length > 0) {
    const rows = metalOptions.map((value, index) => [
      txt(`${ring.slug}-metal-${index}`),
      String(index + 1),
      'v_id',
      txt(value),
      txt(value),
    ])
    sql += `    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ${buildValues(rows)}
    ON CONFLICT (id) DO NOTHING;

`
  }

  const settingOptions = Array.isArray(ring.settingOptions) ? ring.settingOptions : []
  if (settingOptions.length > 0) {
    const rows = settingOptions.map((value, index) => [
      txt(`${ring.slug}-setting-${index}`),
      String(index + 1),
      'v_id',
      txt(value),
      txt(value),
    ])
    sql += `    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ${buildValues(rows)}
    ON CONFLICT (id) DO NOTHING;

`
  }

  const sideStoneOptions = Array.isArray(ring.sideStonesOptions) ? ring.sideStonesOptions : []
  if (sideStoneOptions.length > 0) {
    const rows = sideStoneOptions.map((value, index) => [
      txt(`${ring.slug}-stone-${index}`),
      String(index + 1),
      'v_id',
      txt(value),
      txt(value),
    ])
    sql += `    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ${buildValues(rows)}
    ON CONFLICT (id) DO NOTHING;

`
  }

  const ringSizes = Array.isArray(ring.ringSizes) ? ring.ringSizes : []
  if (ringSizes.length > 0) {
    const rows = ringSizes.map((value, index) => [
      txt(`${ring.slug}-size-${index}`),
      String(index + 1),
      'v_id',
      txt(value),
    ])
    sql += `    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ${buildValues(rows)}
    ON CONFLICT (id) DO NOTHING;

`
  }

  sql += `    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      ${txt(`${ring.slug}-specs`)},
      v_id,
      ${txt(specs.bandWidth)},
      ${txt(specs.avgSideStones)},
      ${txt(specs.centerStoneSize)},
      ${txt(specs.clawCount)},
      ${txt(specs.estimatedWeight)},
      ${toResizable(specs.resizing)}
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;`

  return sql
}

const chunkSize = 5
const batches = []

for (let i = 0; i < rings.length; i += chunkSize) {
  batches.push(rings.slice(i, i + chunkSize))
}

batches.forEach((group, index) => {
  const sql = group.map(buildRingBlock).join('\n\n')
  writeFileSync(`.sisyphus/evidence/rings-batch-${index + 1}.sql`, sql)
})

let imagesCount = 0
let metalsCount = 0
let settingsCount = 0
let sideStonesCount = 0
let sizesCount = 0

for (const ring of rings) {
  imagesCount += Array.isArray(ring.images) ? ring.images.length : 0
  metalsCount += Array.isArray(ring.metalOptions) ? ring.metalOptions.length : 0
  settingsCount += Array.isArray(ring.settingOptions) ? ring.settingOptions.length : 0
  sideStonesCount += Array.isArray(ring.sideStonesOptions) ? ring.sideStonesOptions.length : 0
  sizesCount += Array.isArray(ring.ringSizes) ? ring.ringSizes.length : 0
}

writeFileSync(
  '.sisyphus/evidence/rings-seed-summary.json',
  JSON.stringify(
    {
      ringCount: rings.length,
      batchCount: batches.length,
      imagesCount,
      metalsCount,
      settingsCount,
      sideStonesCount,
      sizesCount,
      specsCount: rings.length,
    },
    null,
    2,
  ),
)
