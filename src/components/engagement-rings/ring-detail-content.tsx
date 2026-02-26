'use client'

import Link from 'next/link'
import { ArrowLeft, Star, Shield, RefreshCw, Truck, Gem } from 'lucide-react'
import { Separator } from '@/components/ui/separator'
import { ImageGallery } from '@/components/engagement-rings/image-gallery'
import { RingConfigurator } from '@/components/engagement-rings/ring-configurator'
import type { Ring } from '@/data/engagement-rings'

interface RingDetailContentProps {
  ring: Ring
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

export function RingDetailContent({ ring }: RingDetailContentProps) {
  const formattedPrice = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: ring.currency,
    minimumFractionDigits: 0,
    maximumFractionDigits: 0,
  }).format(ring.basePrice)

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
              images={ring.images}
              thumbnails={ring.thumbnails}
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

            {/* Price */}
            <div>
              <p className="text-[#D4AF37] text-2xl font-medium tracking-wide">
                {formattedPrice} {ring.currency}
              </p>
              <p className="text-gray-600 text-xs mt-1">Setting only — gemstone sold separately</p>
            </div>

            {/* Reviews badge */}
            <div className="flex items-center gap-2">
              <div className="flex items-center gap-0.5">
                {Array.from({ length: 5 }).map((_, i) => (
                  <Star key={i} size={14} className="text-[#D4AF37] fill-[#D4AF37]" />
                ))}
              </div>
              <span className="text-gray-400 text-xs">5.0 · Cullen Jewellery</span>
            </div>

            {/* Description */}
            {ring.description && (
              <p className="text-gray-400 text-sm leading-relaxed">
                {ring.description}
              </p>
            )}

            <Separator className="bg-zinc-800" />

            {/* Ring Configurator */}
            <RingConfigurator ring={ring} />

            <Separator className="bg-zinc-800" />

            {/* Trust badges */}
            <div className="grid grid-cols-4 gap-4 py-4">
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

          </div>
        </div>
      </div>
    </div>
  )
}
