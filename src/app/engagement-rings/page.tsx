import { Suspense } from 'react'
import type { Metadata } from 'next'
import { EngagementRingsContent } from '@/components/engagement-rings/engagement-rings-content'
import { getAllRingPreferences } from '@/lib/ring-preferences'
import ShowroomSection from '@/components/showroom-section'

export const metadata: Metadata = {
  title: 'Engagement Rings | LKB Jewellers',
  description: 'Browse our collection of 225 engagement ring settings. Filter by shape, metal type, setting style, band type, and setting profile to find your perfect ring.',
}

export default async function EngagementRingsPage() {
  let allRingPreferences = {}

  try {
    allRingPreferences = await getAllRingPreferences()
  } catch {
    allRingPreferences = {}
  }

  return (
    <>
      <Suspense>
        <EngagementRingsContent allRingPreferences={allRingPreferences} />
      </Suspense>
      <ShowroomSection />
    </>
  )
}
