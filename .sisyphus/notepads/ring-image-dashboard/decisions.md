# Decisions — ring-image-dashboard

## [2026-03-10] Session ses_32999daaeffeUfX1F4CeoznZSs — Initial Setup

### Architecture Decisions
- RLS: DISABLE RLS on ring_image_preferences (same as products/contacts/orders)
- Fallback chain: DB preferences > MANUAL_HOVER_OVERRIDES > ring-hover-box-map.json > GLOBAL_FALLBACK
- Upload security: service role key only in API routes (never client-side)
- Component extraction: EngagementRingsTab + RingImageManager in separate files under `src/components/dashboard/engagement-rings/`
- State management: all local state in EngagementRingsTab, no parent state changes
- Reorder: up/down arrows (no drag-and-drop)
- Seed: idempotent upsert from ring-hover-box-map.json + MANUAL_HOVER_OVERRIDES

## [2026-03-10] Session Task 10 — QA/Verification Decisions

- Evidence dipusatkan di main repo: `.sisyphus/evidence/task-10-*` sesuai instruksi orkestrator (bukan di worktree).
- Untuk validasi hover fallback di listing, indikator utama ditetapkan sebagai perubahan opacity layer image on-hover (lebih reliabel dibanding membandingkan src URL).
- LSP diagnostics dijalankan pada file komponen yang diverifikasi (`EngagementRingsTab.tsx`, `RingImageManager.tsx`) dan hasilnya clean.
