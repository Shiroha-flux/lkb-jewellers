import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { RingDetailContent } from '@/components/engagement-rings/ring-detail-content'
import ShowroomSection from '@/components/showroom-section'
import { fetchAllSlugs, fetchGemstones, fetchRingBySlug } from '@/lib/supabase-rings'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateStaticParams() {
  try {
    const slugs = await fetchAllSlugs()
    return slugs.map(slug => ({ slug }))
  } catch {
    // Env vars may be missing at build time (e.g. Vercel first deploy)
    // Return empty so pages are generated on-demand instead
    return []
  }
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const ring = await fetchRingBySlug(slug)
  if (!ring) return { title: 'Ring Not Found | LKB Jewellers' }

  return {
    title: `${ring.name} Engagement Ring | LKB Jewellers`,
    description: ring.description || `The ${ring.name} — ${ring.title}.`,
  }
}

export default async function RingDetailPage({ params }: PageProps) {
  const { slug } = await params

  const [ring, gemstones] = await Promise.all([
    fetchRingBySlug(slug),
    fetchGemstones(),
  ])

  if (!ring) notFound()

  return (
    <>
      <RingDetailContent ring={ring} gemstones={gemstones} />
      <ShowroomSection />
    </>
  )
}
