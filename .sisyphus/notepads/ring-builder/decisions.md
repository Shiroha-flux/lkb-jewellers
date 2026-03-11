# Decisions — ring-builder

## [2026-02-26] Session ses_3660c0af5ffeubV0C4ZnkbLmnJ — Kickoff

### Architecture Decisions
- Route: `src/app/engagement-rings/` (separate folder, no conflict)
- Data storage: Static TypeScript files (split by A-D, E-J, K-N, O-S, T-Z if > 200KB)
- Scraping: Temporary script `scripts/scrape-cullen.ts` — deleted after use
- State management: Native useSearchParams + useRouter (no nuqs, no zustand)
- Image loading: Direct CDN URLs, no download to /public

### Rejected Options
- nuqs: rejected (user explicit "NO nuqs library")
- Supabase: rejected (user explicit "local only")
- Enquiry form: rejected (user explicit "no contact mechanism")
- Carousel library: rejected (CSS scroll-snap instead)

## [2026-02-27] Supabase migration engagement-rings

### Architecture Decisions
- Sumber data page listing/detail engagement-rings dipindah ke Supabase lewat `src/lib/supabase-rings.ts`, interface `Ring` tetap dipertahankan 1:1 untuk kompatibilitas komponen existing.
- `id` ring tetap diisi `slug` saat mapping agar kompatibel dengan komponen/UI yang pakai key/id berbasis slug.
- `RingConfigurator` menerima prop `gemstones` optional dari server; fallback ke static data dipertahankan untuk backward compatibility.
- `tsconfig.json` ditambah `types: ["vitest/globals"]` supaya `npx tsc --noEmit` tetap hijau tanpa ubah file test.
