// Ring filter utility functions for the engagement rings listing page
import type { Ring } from '@/data/engagement-rings'

export interface ActiveFilters {
  shape?: string
  metal?: string
  settingStyle?: string
  bandType?: string
  settingProfile?: string
}

/**
 * Filter rings by active filters using AND logic.
 * All active filters must match for a ring to be included.
 */
export function filterRings(rings: Ring[], filters: ActiveFilters): Ring[] {
  return rings.filter(ring => {
    if (filters.shape && ring.shape !== filters.shape) return false
    if (filters.settingStyle && ring.settingStyle !== filters.settingStyle) return false
    if (filters.bandType && ring.bandType !== filters.bandType) return false
    if (filters.settingProfile && ring.settingProfile !== filters.settingProfile) return false
    return true
  })
}

/**
 * Parse URL search params into ActiveFilters object.
 */
export function parseFiltersFromURL(searchParams: URLSearchParams | { get: (key: string) => string | null } | null): ActiveFilters {
  const filters: ActiveFilters = {}
  if (!searchParams) return filters
  const shape = searchParams.get('shape')
  const metal = searchParams.get('metal')
  const settingStyle = searchParams.get('settingStyle')
  const bandType = searchParams.get('bandType')
  const settingProfile = searchParams.get('settingProfile')

  if (shape) filters.shape = shape
  if (metal) filters.metal = metal
  if (settingStyle) filters.settingStyle = settingStyle
  if (bandType) filters.bandType = bandType
  if (settingProfile) filters.settingProfile = settingProfile

  return filters
}

/**
 * Serialize ActiveFilters to URL query string.
 * Skips undefined/empty values.
 */
export function filtersToURL(filters: ActiveFilters): string {
  const params = new URLSearchParams()
  if (filters.shape) params.set('shape', filters.shape)
  if (filters.metal) params.set('metal', filters.metal)
  if (filters.settingStyle) params.set('settingStyle', filters.settingStyle)
  if (filters.bandType) params.set('bandType', filters.bandType)
  if (filters.settingProfile) params.set('settingProfile', filters.settingProfile)
  const str = params.toString()
  return str ? `?${str}` : ''
}

/**
 * Check if any filters are active.
 */
export function hasActiveFilters(filters: ActiveFilters): boolean {
  return Object.values(filters).some(v => v !== undefined && v !== '')
}

/**
 * Clear all active filters.
 */
export function clearFilters(): ActiveFilters {
  return {}
}
