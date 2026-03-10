"use client"

import { useState, useEffect } from "react"
import { Search, ChevronDown, ChevronRight, Gem, Loader2 } from "lucide-react"
import { Input } from "@/components/ui/input"
import { Badge } from "@/components/ui/badge"
import RingImageManager from "./RingImageManager"

type RingListItem = {
  slug: string
  name: string
  images: Record<string, string[]>
}

type ColorPref = {
  thumbnail_url: string | null
  hover_url: string | null
}

type AllPreferences = Record<string, Record<string, ColorPref>>

export default function EngagementRingsTab() {
  const [rings, setRings] = useState<RingListItem[]>([])
  const [allPreferences, setAllPreferences] = useState<AllPreferences>({})
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [search, setSearch] = useState("")
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null)

  useEffect(() => {
    Promise.all([
      fetch("/api/rings/list"),
      fetch("/api/rings/preferences"),
    ])
      .then(async ([listRes, prefsRes]) => {
        if (!listRes.ok) throw new Error(`HTTP ${listRes.status}`)
        const listJson = await listRes.json()
        setRings(listJson.data ?? [])
        if (prefsRes.ok) {
          const prefsJson = await prefsRes.json()
          setAllPreferences(prefsJson.data ?? {})
        }
      })
      .catch((err) => setError(err.message ?? "Failed to load ring data"))
      .finally(() => setLoading(false))
  }, [])

  function ringHasPreferences(slug: string): boolean {
    const ringPrefs = allPreferences[slug]
    if (!ringPrefs) return false
    return Object.values(ringPrefs).some(
      (pref) => pref.thumbnail_url !== null || pref.hover_url !== null
    )
  }

  const filtered = rings.filter(
    (r) =>
      r.name.toLowerCase().includes(search.toLowerCase()) ||
      r.slug.toLowerCase().includes(search.toLowerCase())
  )

  function toggleExpand(slug: string) {
    setExpandedSlug((prev) => (prev === slug ? null : slug))
  }

  function getTotalImages(images: Record<string, string[]>): number {
    return Object.values(images).reduce((sum, arr) => sum + arr.length, 0)
  }

  // ─── Loading ───────────────────────────────────────────────────────────────
  if (loading) {
    return (
      <div className="flex items-center justify-center h-48">
        <Loader2 className="w-6 h-6 animate-spin text-zinc-500" />
        <span className="ml-3 text-zinc-400 text-sm">Loading rings…</span>
      </div>
    )
  }

  // ─── Error ─────────────────────────────────────────────────────────────────
  if (error) {
    return (
      <div className="flex items-center gap-3 p-4 bg-red-950/40 border border-red-800/50 rounded-lg text-red-400 text-sm">
        <span>⚠</span>
        <span>{error}</span>
      </div>
    )
  }

  return (
    <div className="space-y-4">
      {/* ── Header ─────────────────────────────────────────────────────────── */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <Gem className="w-5 h-5 text-zinc-400" />
          <h2 className="text-lg font-semibold text-white">Engagement Rings</h2>
          <Badge
            variant="outline"
            className="text-zinc-400 border-zinc-700 text-xs"
          >
            {rings.length} {rings.length === 1 ? "ring" : "rings"}
          </Badge>
        </div>
      </div>

      {/* ── Search ─────────────────────────────────────────────────────────── */}
      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-zinc-500 pointer-events-none" />
        <Input
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search by name or slug…"
          className="pl-9 bg-zinc-900 border-zinc-800 text-white placeholder:text-zinc-600 focus-visible:ring-zinc-700"
        />
      </div>

      {/* ── Ring List ──────────────────────────────────────────────────────── */}
      {filtered.length === 0 ? (
        <div className="text-center py-12 text-zinc-600 text-sm">
          {search ? `No rings found for "${search}"` : "No ring data available"}
        </div>
      ) : (
        <div className="space-y-1">
          {filtered.map((ring) => {
            const isOpen = expandedSlug === ring.slug
            const totalImages = getTotalImages(ring.images)
            const colors = Object.keys(ring.images).filter(
              (c) => ring.images[c].length > 0
            )

            return (
              <div
                key={ring.slug}
                className="border border-zinc-800 rounded-lg overflow-hidden bg-zinc-900/50"
              >
                {/* Ring row header */}
                <button
                  onClick={() => toggleExpand(ring.slug)}
                  className="w-full flex items-center gap-3 px-4 py-3 text-left hover:bg-zinc-800/60 transition-colors group"
                >
                  {/* Expand icon */}
                  <span className="text-zinc-600 group-hover:text-zinc-400 transition-colors flex-shrink-0">
                    {isOpen ? (
                      <ChevronDown className="w-4 h-4" />
                    ) : (
                      <ChevronRight className="w-4 h-4" />
                    )}
                  </span>

                  {/* Ring info */}
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 flex-wrap">
                      <span className="font-medium text-white text-sm">
                        {ring.name}
                      </span>
                      <span className="text-zinc-600 text-xs font-mono">
                        {ring.slug}
                      </span>
                      {ringHasPreferences(ring.slug) ? (
                        <Badge
                          variant="outline"
                          className="text-[10px] px-1.5 py-0 border-green-800 text-green-400 bg-green-950/20"
                        >
                          ✓ prefs
                        </Badge>
                      ) : (
                        <Badge
                          variant="outline"
                          className="text-[10px] px-1.5 py-0 border-yellow-800 text-yellow-600 bg-yellow-950/20"
                        >
                          ⚠ no prefs
                        </Badge>
                      )}
                    </div>
                  </div>

                  {/* Stats */}
                  <div className="flex items-center gap-2 flex-shrink-0">
                    {colors.map((c) => (
                      <Badge
                        key={c}
                        variant="outline"
                        className={`text-xs border-zinc-700 ${
                          c === "yellow"
                            ? "text-yellow-400"
                            : c === "white"
                            ? "text-zinc-300"
                            : "text-rose-400"
                        }`}
                      >
                        {c === "yellow" ? "Y" : c === "white" ? "W" : "R"}{" "}
                        {ring.images[c]?.length ?? 0}
                      </Badge>
                    ))}
                    <Badge
                      variant="outline"
                      className="text-xs border-zinc-700 text-zinc-400"
                    >
                      {totalImages} {totalImages === 1 ? "photo" : "photos"}
                    </Badge>
                  </div>
                </button>

                {/* Expanded: RingImageManager */}
                {isOpen && (
                  <div className="border-t border-zinc-800">
                    <RingImageManager slug={ring.slug} name={ring.name} />
                  </div>
                )}
              </div>
            )
          })}
        </div>
      )}
    </div>
  )
}
