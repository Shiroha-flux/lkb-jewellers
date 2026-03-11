'use client'

import { useState, useMemo } from 'react'
import Link from 'next/link'
import { ArrowLeft, Star, Shield, RefreshCw, Truck, Gem } from 'lucide-react'
import { Separator } from '@/components/ui/separator'
import { ImageGallery } from '@/components/engagement-rings/image-gallery'
import { RingConfigurator } from '@/components/engagement-rings/ring-configurator'
import type { Ring } from '@/data/engagement-rings'
import { RING_METAL_OPTIONS } from '@/data/engagement-rings'
import type { RecommendedGemstone } from '@/data/gemstone-options'
import { clarityOptions } from '@/data/gemstone-options'

interface RingDetailContentProps {
  ring: Ring
  gemstones?: RecommendedGemstone[]
}

function TrustBadge({ icon: Icon, label }: { icon: React.ElementType; label: string }) {
  return (
    <div className="flex flex-col items-center gap-2 text-center">
      <div className="w-10 h-10 rounded-full border border-zinc-700 flex items-center justify-center">
        <Icon size={18} className="text-[#D4AF37]" />
      </div>
      <span className="text-gray-400 text-xs leading-tight">{label}</span>
    </div>
  )
}

function SpecRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex justify-between py-3 border-b border-zinc-800 last:border-0">
      <span className="text-gray-500 text-sm">{label}</span>
      <span className="text-white text-sm font-medium">{value}</span>
    </div>
  )
}

/** Map metal label → image color prefix (yellow / rose / white) */
function metalToColorKey(metal: string): string {
  const lower = metal.toLowerCase()
  if (lower.includes('yellow')) return 'yellow'
  if (lower.includes('rose')) return 'rose'
  return 'white' // Platinum & White Gold both use white images
}

function dedupeUrls(urls: string[]): string[] {
  const seen = new Set<string>()
  const result: string[] = []

  for (const url of urls) {
    const key = url.trim().toLowerCase().split('?')[0]
    if (seen.has(key)) continue
    seen.add(key)
    result.push(url)
  }

  return result
}

export function RingDetailContent({ ring, gemstones }: RingDetailContentProps) {
  const [selectedMetal, setSelectedMetal] = useState<string>(RING_METAL_OPTIONS[0])

  // Filter images & thumbnails based on selected metal color
  const colorKey = metalToColorKey(selectedMetal)

  const galleryImages = useMemo(() => {
    const filtered = ring.images.filter(url => {
      const filename = url.split('/').pop() ?? ''
      return filename.startsWith(colorKey + '_')
    })
    const source = filtered.length > 0 ? filtered : ring.images
    return dedupeUrls(source)
  }, [ring.images, colorKey])

  const galleryThumbs = useMemo(() => {
    const filtered = ring.thumbnails.filter(url => {
      const filename = url.split('/').pop() ?? ''
      return filename.startsWith(colorKey + '_')
    })
    const source = filtered.length > 0 ? filtered : ring.thumbnails
    return dedupeUrls(source)
  }, [ring.thumbnails, colorKey])

  return (
    <div className="min-h-screen bg-black">
      <div className="container mx-auto px-4 py-8">

        {/* Back link */}
        <Link
          href="/engagement-rings"
          className="inline-flex items-center gap-2 text-gray-500 hover:text-[#D4AF37] text-xs font-medium tracking-widest uppercase transition-colors duration-200 mb-8"
        >
          <ArrowLeft size={14} />
          Browse Other Settings
        </Link>

        {/* Two-column layout */}
        <div className="grid grid-cols-1 lg:grid-cols-[55%_45%] gap-8 lg:gap-12">

          {/* Left: Image Gallery */}
          <div className="lg:sticky lg:top-8 lg:self-start">
            <ImageGallery
              images={galleryImages}
              thumbnails={galleryThumbs}
              alt={ring.name}
            />
          </div>

          {/* Right: Ring info + configurator */}
          <div className="flex flex-col gap-6">

            {/* Ring name & title */}
            <div>
              <h1 className="font-heading text-white text-3xl md:text-4xl font-light tracking-wide mb-2">
                {ring.name}
              </h1>
              <p className="text-gray-400 text-sm leading-relaxed">
                {ring.title.replace(`${ring.name} - `, '')}
              </p>
            </div>

            {/* Reviews badge */}
            <div className="flex items-center gap-2">
              <div className="flex items-center gap-0.5">
                {Array.from({ length: 5 }).map((_, i) => (
                  <Star key={i} size={14} className="text-[#D4AF37] fill-[#D4AF37]" />
                ))}
              </div>
              <span className="text-gray-400 text-xs">5.0 · LKB Jewellers</span>
            </div>

            {/* Description */}
            {ring.description && (
              <p className="text-gray-400 text-sm leading-relaxed">
                {ring.description}
              </p>
            )}

            <Separator className="bg-zinc-800" />

            {/* Ring Configurator */}
            <RingConfigurator
              ring={ring}
              gemstones={gemstones}
              selectedMetal={selectedMetal}
              onMetalChange={setSelectedMetal}
            />

            <Separator className="bg-zinc-800" />

            {/* Trust badges */}
            <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 py-4">
              <TrustBadge icon={Shield} label="Lifetime Warranty" />
              <TrustBadge icon={RefreshCw} label="Free Resizing" />
              <TrustBadge icon={Truck} label="Free Shipping" />
              <TrustBadge icon={Gem} label="Ethically Sourced" />
            </div>

            <Separator className="bg-zinc-800" />

            {/* Specs table */}
            {Object.keys(ring.specs).length > 0 && (
              <div>
                <h3 className="font-heading text-white text-lg font-medium tracking-wide mb-4">
                  Ring Specifications
                </h3>
                <div>
                  {ring.specs.bandWidth && (
                    <SpecRow label="Band Width" value={ring.specs.bandWidth} />
                  )}
                  {ring.specs.avgSideStones && (
                    <SpecRow label="Avg. Side Stones" value={ring.specs.avgSideStones} />
                  )}
                  {ring.specs.centerStoneSize && (
                    <SpecRow label="Centre Stone Size" value={ring.specs.centerStoneSize} />
                  )}
                  {ring.specs.estimatedWeight && (
                    <SpecRow label="Estimated Weight" value={ring.specs.estimatedWeight} />
                  )}
                  {ring.specs.clawCount && (
                    <SpecRow label="Claw Count" value={ring.specs.clawCount} />
                  )}
                  {ring.specs.resizing && (
                    <SpecRow label="Resizing" value={ring.specs.resizing} />
                  )}
                </div>
              </div>
            )}

            <Separator className="bg-zinc-800" />

            {/* Clarity Education */}
            <div>
              <h3 className="font-heading text-white text-lg font-medium tracking-wide mb-4">
                Understanding Diamond Clarity
              </h3>
              <p className="text-gray-400 text-sm leading-relaxed mb-4">
                Diamond clarity refers to the absence of inclusions and blemishes. The scale ranges from Flawless (FL) to Slightly Included (SI), with higher grades indicating fewer imperfections.
              </p>
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                {clarityOptions.map((option) => (
                  <div key={option.value} className="border border-zinc-800 rounded-lg p-3 text-center">
                    <div className="text-[#D4AF37] font-medium text-sm mb-1">{option.label}</div>
                    <div className="text-white text-xs leading-tight mb-1">{option.description.split(' — ')[0]}</div>
                    <div className="text-gray-500 text-xs leading-tight">{option.description.split(' — ')[1]}</div>
                  </div>
                ))}
              </div>
            </div>

            <Separator className="bg-zinc-800" />

            {/* Ring Size Guide */}
            <div>
              <h3 className="font-heading text-white text-lg font-medium tracking-wide mb-4">
                Ring Size Guide
              </h3>
              <p className="text-gray-400 text-sm leading-relaxed mb-4">
                We use UK ring sizes. Use the conversion table below to find your size. Complimentary resizing is available on all rings.
              </p>
              <div className="overflow-x-auto">
                <table className="w-full text-sm border-collapse">
                  <thead>
                    <tr className="border-b border-zinc-800">
                      <th className="text-left text-gray-500 font-medium py-2 pr-4">UK Size</th>
                      <th className="text-left text-gray-500 font-medium py-2 pr-4">US Size</th>
                      <th className="text-left text-gray-500 font-medium py-2">EU Size</th>
                    </tr>
                  </thead>
                  <tbody>
                    {[
                      { uk: 'F', us: '3', eu: '46' },
                      { uk: 'G', us: '3.5', eu: '46.5' },
                      { uk: 'H', us: '4', eu: '47' },
                      { uk: 'I', us: '4.5', eu: '47.5' },
                      { uk: 'J', us: '5', eu: '49' },
                      { uk: 'K', us: '5.5', eu: '50' },
                      { uk: 'L', us: '6', eu: '51.5' },
                      { uk: 'M', us: '6.5', eu: '52' },
                      { uk: 'N', us: '7', eu: '54' },
                      { uk: 'O', us: '7.5', eu: '55' },
                      { uk: 'P', us: '8', eu: '56.5' },
                      { uk: 'Q', us: '8.5', eu: '57' },
                      { uk: 'R', us: '9', eu: '59' },
                      { uk: 'S', us: '9.5', eu: '60' },
                      { uk: 'T', us: '10', eu: '61.5' },
                      { uk: 'U', us: '10.5', eu: '62' },
                      { uk: 'V', us: '11', eu: '63.5' },
                      { uk: 'W', us: '11.5', eu: '64' },
                      { uk: 'X', us: '12', eu: '65.5' },
                      { uk: 'Y', us: '12.5', eu: '66' },
                      { uk: 'Z', us: '13', eu: '67.5' },
                    ].map(({ uk, us, eu }) => (
                      <tr key={uk} className="border-b border-zinc-800/50 last:border-0">
                        <td className="text-white py-2 pr-4 font-medium">{uk}</td>
                        <td className="text-gray-400 py-2 pr-4">{us}</td>
                        <td className="text-gray-400 py-2">{eu}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <p className="text-gray-500 text-xs mt-3">
                Not sure of your size? Visit us in-store for a complimentary ring sizing.
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  )
}
