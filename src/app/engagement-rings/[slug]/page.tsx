import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { engagementRings } from '@/data/engagement-rings'
import { RingDetailContent } from '@/components/engagement-rings/ring-detail-content'

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateStaticParams() {
  return engagementRings.map(ring => ({ slug: ring.slug }))
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const ring = engagementRings.find(r => r.slug === slug)
  if (!ring) return { title: 'Ring Not Found | LKB Jewellers' }
  return {
    title: `${ring.name} Engagement Ring | LKB Jewellers`,
    description: ring.description || `The ${ring.name} — ${ring.title}. Starting from ${ring.currency} ${ring.basePrice.toLocaleString()}.`,
  }
}

export default async function RingDetailPage({ params }: PageProps) {
  const { slug } = await params
  const ring = engagementRings.find(r => r.slug === slug)
  if (!ring) notFound()

  return <RingDetailContent ring={ring} />
}
