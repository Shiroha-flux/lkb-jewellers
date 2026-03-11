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

const rowSql = (ring) => `(
  ${txt(ring.slug)},
  ${txt(ring.name)},
  ${txt(ring.title)},
  ${txt(ring.description)},
  ${num(ring.basePrice)},
  ${txt(ring.currency)},
  ${enumOrNull(ring.shape, 'enum_ring_shape', shapeSet)},
  ${enumOrNull(ring.settingStyle, 'enum_ring_setting_style', settingStyleSet)},
  ${enumOrNull(ring.bandType, 'enum_ring_band_type', bandTypeSet)},
  ${enumOrNull(ring.settingProfile, 'enum_ring_setting_profile', settingProfileSet)}
)`

const chunkSize = 75
let chunkIndex = 1

for (let i = 0; i < rings.length; i += chunkSize) {
  const chunk = rings.slice(i, i + chunkSize)
  const values = chunk.map(rowSql).join(',\n')

  const sql = `INSERT INTO engagement_rings (
  slug,
  name,
  title,
  description,
  base_price_usd,
  currency,
  shape,
  setting_style,
  band_type,
  setting_profile
)
VALUES
${values}
ON CONFLICT (slug) DO NOTHING;\n`

  writeFileSync(`.sisyphus/evidence/rings-core-${chunkIndex}.sql`, sql)
  chunkIndex += 1
}
