# Issues — ring-image-dashboard

## [2026-03-10] Session ses_32999daaeffeUfX1F4CeoznZSs — Initial Setup

### Pre-existing Issues (not caused by this plan)
- `src/__tests__/ring-filters.test.ts` has 6 TypeScript errors (metalOptions property doesn't exist on Ring type) — pre-existing, tracked in ring-filter-hover-remediation plan

## [2026-03-10] Session Task 10 — Runtime Issues Encountered

- Port `3000` sempat dipakai proses Next.js lain sehingga instance worktree ini auto-pindah ke `3001` dan memicu lock `.next/dev/lock` saat restart.
- Solusi operasional: hentikan proses Next worktree yang existing dulu, lalu start ulang agar bind kembali ke `localhost:3000`.


## [2026-03-10] Task F1 - Plan Compliance Audit

- Must Have gagal: fitur reorder (up/down arrows) belum ada di `src/components/dashboard/engagement-rings/RingImageManager.tsx` dan tidak ada API untuk update `_order` pada `engagement_ring_images`.
- Potensi guardrail breach: `src/app/api/rings/images/route.ts` dan `scripts/seed-ring-preferences.ts` punya fallback ke `NEXT_PUBLIC_SUPABASE_ANON_KEY` ketika `SUPABASE_SERVICE_ROLE_KEY` kosong (plan melarang anon key untuk write ke Storage).
- DB check OK: `ring_image_preferences` row count = 655.
