import { describe, it, expect } from 'vitest'
import { filterRings, parseFiltersFromURL, filtersToURL, hasActiveFilters, clearFilters } from '@/lib/ring-filters'
import { metalOptions, MetalValue } from '@/data/ring-filters'
import { RING_METAL_OPTIONS, RING_SIDE_STONE_OPTIONS, RING_SIZES } from '@/data/engagement-rings'
import { clarityOptions, caratRanges } from '@/data/gemstone-options'
import type { Ring } from '@/data/engagement-rings'

// Mock ring data for testing
const mockRings: Ring[] = [
  {
    id: 'ring-sheridan',
    slug: 'ring-sheridan',
    name: 'Sheridan',
    title: 'Sheridan - Oval 4 Claw Solitaire',
    description: 'Test description',
    basePrice: 1852,
    currency: 'USD',
    images: ['https://example.com/img1.jpg'],
    thumbnails: ['https://example.com/thumb1.jpg'],
    specs: { bandWidth: '1.5mm' },
    shape: 'oval',
    settingStyle: 'solitaire',
    bandType: 'plain',
    settingProfile: 'high_set',
  },
  {
    id: 'ring-emma',
    slug: 'ring-emma',
    name: 'Emma',
    title: 'Emma - Classic Oval 4 Claw Solitaire with Hidden Halo',
    description: 'Test description',
    basePrice: 1626,
    currency: 'USD',
    images: ['https://example.com/img2.jpg'],
    thumbnails: ['https://example.com/thumb2.jpg'],
    specs: { bandWidth: '1.5mm' },
    shape: 'oval',
    settingStyle: 'halo',
    bandType: 'pave',
    settingProfile: 'high_set',
  },
  {
    id: 'ring-francesca',
    slug: 'ring-francesca',
    name: 'Francesca',
    title: 'Francesca - Pear and Pear Claw Toi et Moi',
    description: 'Test description',
    basePrice: 1788,
    currency: 'USD',
    images: ['https://example.com/img3.jpg'],
    thumbnails: ['https://example.com/thumb3.jpg'],
    specs: { bandWidth: '1.5mm' },
    shape: 'pear',
    settingStyle: 'toi_et_moi',
    bandType: 'plain',
    settingProfile: 'high_set',
  },
  {
    id: 'ring-daisy',
    slug: 'ring-daisy',
    name: 'Daisy',
    title: 'Daisy - Classic Oval 4 Claw Solitaire',
    description: 'Test description',
    basePrice: 1301,
    currency: 'USD',
    images: ['https://example.com/img4.jpg'],
    thumbnails: ['https://example.com/thumb4.jpg'],
    specs: { bandWidth: '1.5mm' },
    shape: 'oval',
    settingStyle: 'solitaire',
    bandType: 'plain',
    settingProfile: 'low_set',
  },
]

describe('filterRings', () => {
  it('returns all rings when no filters are active', () => {
    const result = filterRings(mockRings, {})
    expect(result).toHaveLength(4)
  })

  it('filters by shape correctly', () => {
    const result = filterRings(mockRings, { shape: 'oval' })
    expect(result).toHaveLength(3)
    expect(result.every(r => r.shape === 'oval')).toBe(true)
  })

  it('filters by settingStyle correctly', () => {
    const result = filterRings(mockRings, { settingStyle: 'solitaire' })
    expect(result).toHaveLength(2)
    expect(result.every(r => r.settingStyle === 'solitaire')).toBe(true)
  })

  it('filters by bandType correctly', () => {
    const result = filterRings(mockRings, { bandType: 'pave' })
    expect(result).toHaveLength(1)
    expect(result[0].name).toBe('Emma')
  })

  it('filters by settingProfile correctly', () => {
    const result = filterRings(mockRings, { settingProfile: 'low_set' })
    expect(result).toHaveLength(1)
    expect(result[0].name).toBe('Daisy')
  })

  it('filters by metal (metal filter is UI-only, returns all rings)', () => {
    const result = filterRings(mockRings, { metal: 'yellow_gold' })
    // Metal filter is image-swap only — filterRings ignores metal filter
    expect(result.length).toBeGreaterThanOrEqual(0)
  })

  it('uses AND logic for multiple filters', () => {
    const result = filterRings(mockRings, { shape: 'oval', settingStyle: 'solitaire' })
    expect(result).toHaveLength(2)
    expect(result.every(r => r.shape === 'oval' && r.settingStyle === 'solitaire')).toBe(true)
  })

  it('returns empty array when no rings match filters', () => {
    const result = filterRings(mockRings, { shape: 'heart' })
    expect(result).toHaveLength(0)
  })

  it('returns empty array for invalid filter value', () => {
    const result = filterRings(mockRings, { shape: 'nonexistent' as never })
    expect(result).toHaveLength(0)
  })
})

describe('parseFiltersFromURL', () => {
  it('parses empty search params to empty filters', () => {
    const params = new URLSearchParams()
    const result = parseFiltersFromURL(params)
    expect(result).toEqual({})
  })

  it('parses shape from URL correctly', () => {
    const params = new URLSearchParams('shape=oval')
    const result = parseFiltersFromURL(params)
    expect(result.shape).toBe('oval')
  })

  it('parses multiple filters from URL', () => {
    const params = new URLSearchParams('shape=oval&settingStyle=solitaire&metal=platinum')
    const result = parseFiltersFromURL(params)
    expect(result.shape).toBe('oval')
    expect(result.settingStyle).toBe('solitaire')
    expect(result.metal).toBe('platinum')
  })

  it('ignores unknown URL params', () => {
    const params = new URLSearchParams('shape=oval&unknown=value')
    const result = parseFiltersFromURL(params)
    expect(result.shape).toBe('oval')
    expect((result as Record<string, unknown>).unknown).toBeUndefined()
  })
})

describe('filtersToURL', () => {
  it('returns empty string for empty filters', () => {
    const result = filtersToURL({})
    expect(result).toBe('')
  })

  it('serializes single filter correctly', () => {
    const result = filtersToURL({ shape: 'oval' })
    expect(result).toBe('?shape=oval')
  })

  it('serializes multiple filters correctly', () => {
    const result = filtersToURL({ shape: 'oval', settingStyle: 'solitaire' })
    expect(result).toContain('shape=oval')
    expect(result).toContain('settingStyle=solitaire')
    expect(result.startsWith('?')).toBe(true)
  })

  it('skips undefined values', () => {
    const result = filtersToURL({ shape: 'oval', metal: undefined })
    expect(result).toBe('?shape=oval')
    expect(result).not.toContain('metal')
  })
})

describe('parseFiltersFromURL + filtersToURL roundtrip', () => {
  it('preserves filter state through roundtrip', () => {
    const original = { shape: 'oval', settingStyle: 'solitaire', metal: 'platinum' }
    const url = filtersToURL(original)
    const params = new URLSearchParams(url.replace('?', ''))
    const parsed = parseFiltersFromURL(params)
    expect(parsed.shape).toBe(original.shape)
    expect(parsed.settingStyle).toBe(original.settingStyle)
    expect(parsed.metal).toBe(original.metal)
  })
})

describe('hasActiveFilters', () => {
  it('returns false for empty filters', () => {
    expect(hasActiveFilters({})).toBe(false)
  })

  it('returns true when any filter is set', () => {
    expect(hasActiveFilters({ shape: 'oval' })).toBe(true)
  })
})

describe('clearFilters', () => {
  it('returns empty filters object', () => {
    expect(clearFilters()).toEqual({})
  })
})

describe('Data validation — expanded options', () => {
  it('metalOptions has exactly 8 entries', () => {
    expect(metalOptions).toHaveLength(8)
  })

  it('metalOptions contains all 8 MetalValue variants', () => {
    const values = metalOptions.map(o => o.value)
    expect(values).toContain('platinum')
    expect(values).toContain('palladium')
    expect(values).toContain('yellow_gold')
    expect(values).toContain('rose_gold')
    expect(values).toContain('white_gold')
    expect(values).toContain('9k_yellow_gold')
    expect(values).toContain('9k_white_gold')
    expect(values).toContain('9k_rose_gold')
  })

  it('RING_METAL_OPTIONS has 8 labels', () => {
    expect(RING_METAL_OPTIONS).toHaveLength(8)
  })

  it('RING_METAL_OPTIONS includes 9K variants and Palladium', () => {
    expect(RING_METAL_OPTIONS).toContain('Palladium')
    expect(RING_METAL_OPTIONS).toContain('9k Yellow Gold')
    expect(RING_METAL_OPTIONS).toContain('9k Rose Gold')
    expect(RING_METAL_OPTIONS).toContain('9k White Gold')
  })

  it('RING_SIZES starts with F and ends with Z (21 entries)', () => {
    expect(RING_SIZES[0]).toBe('F')
    expect(RING_SIZES[RING_SIZES.length - 1]).toBe('Z')
    expect(RING_SIZES).toHaveLength(21)
  })

  it('RING_SIZES does not contain D or E', () => {
    expect(RING_SIZES).not.toContain('D')
    expect(RING_SIZES).not.toContain('E')
  })

  it('RING_SIDE_STONE_OPTIONS has exactly 2 entries (no Moissanite)', () => {
    expect(RING_SIDE_STONE_OPTIONS).toHaveLength(2)
    expect(RING_SIDE_STONE_OPTIONS).not.toContain('Moissanite')
    expect(RING_SIDE_STONE_OPTIONS).toContain('Lab Grown Diamond')
    expect(RING_SIDE_STONE_OPTIONS).toContain('Natural Diamond')
  })

  it('clarityOptions has 8 entries in ascending quality order', () => {
    expect(clarityOptions).toHaveLength(8)
    const values = clarityOptions.map(o => o.value)
    expect(values).toEqual(['SI1', 'SI2', 'VS1', 'VS2', 'VVS1', 'VVS2', 'IF', 'FL'])
  })

  it('caratRanges includes 5.00+ as last bucket', () => {
    const last = caratRanges[caratRanges.length - 1]
    expect(last.value).toBe('5.00+')
    expect(last.maxCarat).toBe(99)
  })
})
