'use client'

import { useState, useMemo, useCallback } from 'react'
import { useSearchParams, useRouter } from 'next/navigation'
import { X } from 'lucide-react'
import { FilterBar } from '@/components/engagement-rings/filter-bar'
import { RingCard } from '@/components/engagement-rings/ring-card'
import { engagementRings } from '@/data/engagement-rings'
import { filterRings, parseFiltersFromURL, filtersToURL, hasActiveFilters } from '@/lib/ring-filters'
import type { ActiveFilters } from '@/lib/ring-filters'

const PAGE_SIZE = 12

export function EngagementRingsContent() {
  const searchParams = useSearchParams()
  const router = useRouter()

  // Parse initial filters from URL
  const initialFilters = useMemo(
    () => parseFiltersFromURL(searchParams),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    []
  )

  const [activeFilters, setActiveFilters] = useState<ActiveFilters>(initialFilters)
  const [visibleCount, setVisibleCount] = useState(PAGE_SIZE)

  // Filter rings
  const filteredRings = useMemo(
    () => filterRings(engagementRings, activeFilters),
    [activeFilters]
  )

  const visibleRings = filteredRings.slice(0, visibleCount)
  const hasMore = visibleCount < filteredRings.length

  const handleFilterChange = useCallback((filters: ActiveFilters) => {
    setActiveFilters(filters)
    setVisibleCount(PAGE_SIZE)
    // Update URL (two-way sync)
    const url = `/engagement-rings${filtersToURL(filters)}`
    router.push(url, { scroll: false })
  }, [router])

  const handleClearFilters = useCallback(() => {
    handleFilterChange({})
  }, [handleFilterChange])

  const handleLoadMore = useCallback(() => {
    setVisibleCount(prev => prev + PAGE_SIZE)
  }, [])

  return (
    <div className="min-h-screen bg-black">
      {/* Page header */}
      <div className="container mx-auto px-4 pt-12 pb-6">
        <h1 className="font-heading text-white text-4xl md:text-5xl font-light tracking-wide mb-2">
          Engagement Rings
        </h1>
        <p className="text-gray-500 text-sm">
          {filteredRings.length} settings available
        </p>
      </div>

      {/* Filter bar */}
      <FilterBar
        activeFilters={activeFilters}
        onFilterChange={handleFilterChange}
      />

      {/* Active filter chips */}
      {hasActiveFilters(activeFilters) && (
        <div className="container mx-auto px-4 py-4">
          <div className="flex flex-wrap items-center gap-2">
            <span className="text-gray-500 text-xs">Active filters:</span>
            {Object.entries(activeFilters).map(([key, value]) => (
              value && (
                <button
                  key={key}
                  onClick={() => {
                    const next = { ...activeFilters }
                    delete next[key as keyof ActiveFilters]
                    handleFilterChange(next)
                  }}
                  className="flex items-center gap-1.5 bg-zinc-900 border border-zinc-700 hover:border-[#D4AF37] text-gray-300 text-xs px-3 py-1.5 rounded-full transition-colors duration-200"
                >
                  <span className="capitalize">{key.replace(/([A-Z])/g, ' $1').trim()}: {value}</span>
                  <X size={10} />
                </button>
              )
            ))}
            <button
              onClick={handleClearFilters}
              className="text-[#D4AF37] text-xs hover:underline ml-2"
            >
              Clear all
            </button>
          </div>
        </div>
      )}

      {/* Ring grid */}
      <div className="container mx-auto px-4 py-6">
        {filteredRings.length === 0 ? (
          /* Empty state */
          <div className="flex flex-col items-center justify-center py-24 text-center">
            <div className="w-16 h-16 rounded-full bg-zinc-900 flex items-center justify-center mb-6">
              <svg
                width="32"
                height="32"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="1"
                className="text-zinc-600"
              >
                <circle cx="12" cy="12" r="8" />
                <circle cx="12" cy="12" r="4" />
              </svg>
            </div>
            <h2 className="font-heading text-white text-xl mb-2">No rings match your filters</h2>
            <p className="text-gray-500 text-sm mb-6 max-w-sm">
              Try adjusting or clearing your filters to see more results.
            </p>
            <button
              onClick={handleClearFilters}
              className="px-6 py-2.5 border border-[#D4AF37] text-[#D4AF37] text-sm font-medium tracking-wide hover:bg-[#D4AF37] hover:text-black transition-all duration-200 rounded"
            >
              Clear All Filters
            </button>
          </div>
        ) : (
          <>
            {/* Results count */}
            <p className="text-gray-600 text-xs mb-6">
              Showing {visibleRings.length} of {filteredRings.length} rings
            </p>

            {/* Grid */}
            <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4 md:gap-6">
              {visibleRings.map(ring => (
                <RingCard key={ring.id} ring={ring} />
              ))}
            </div>

            {/* Load more */}
            {hasMore && (
              <div className="flex justify-center mt-12">
                <button
                  onClick={handleLoadMore}
                  className="px-8 py-3 border border-zinc-700 hover:border-[#D4AF37] text-gray-300 hover:text-[#D4AF37] text-sm font-medium tracking-widest uppercase transition-all duration-200"
                >
                  Load More ({filteredRings.length - visibleCount} remaining)
                </button>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  )
}
