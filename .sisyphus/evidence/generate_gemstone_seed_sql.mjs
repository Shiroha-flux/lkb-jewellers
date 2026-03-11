import { readFileSync, writeFileSync } from 'node:fs'

const gemstones = JSON.parse(readFileSync('.sisyphus/evidence/gemstones.json', 'utf8'))

const stoneTypes = new Set(['lab_grown_diamond', 'natural_diamond', 'moissanite', 'lab_grown_sapphire'])
const clarities = new Set(['VS1', 'VS2', 'VVS1', 'VVS2', 'IF'])
const colours = new Set(['D', 'E', 'F', 'G', 'H'])

const q = (value) => `'${String(value).replace(/'/g, "''")}'`
const txt = (value) => (value === undefined || value === null || value === '' ? 'NULL' : q(value))
const num = (value) => (value === undefined || value === null || Number.isNaN(Number(value)) ? 'NULL' : String(Number(value)))
const enumOrNull = (value, type, set) => (set.has(value) ? `${q(value)}::${type}` : 'NULL')

const statements = gemstones.map((gemstone) => {
  const stoneType = enumOrNull(gemstone.type, 'enum_gemstone_stone_type', stoneTypes)
  const clarity = enumOrNull(gemstone.clarity, 'enum_gemstone_clarity', clarities)
  const colour = enumOrNull(gemstone.colour, 'enum_gemstone_colour', colours)
  const carat = num(gemstone.carat)
  const price = num(gemstone.price)
  const dimensions = txt(gemstone.dimensions)
  const imageUrl = txt(gemstone.imageUrl)

  return `INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT ${stoneType}, ${carat}, ${clarity}, ${colour}, ${dimensions}, ${price}, ${imageUrl}, true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = ${stoneType}
    AND carat = ${carat}
    AND clarity = ${clarity}
    AND colour = ${colour}
    AND COALESCE(dimensions, '') = COALESCE(${dimensions}, '')
    AND price_usd = ${price}
    AND COALESCE(image_url, '') = COALESCE(${imageUrl}, '')
);`
})

writeFileSync('.sisyphus/evidence/gemstones-seed.sql', `${statements.join('\n\n')}\n`)
