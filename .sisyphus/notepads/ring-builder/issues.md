# Issues — ring-builder

## [2026-02-26] Session ses_3660c0af5ffeubV0C4ZnkbLmnJ — Kickoff

No issues yet. Will be updated as tasks complete.

## [2026-02-27] F3 Playwright QA — Browser Test Findings

### BUG: Filter→URL sync broken (Medium)
- Clicking a filter button on `/engagement-rings` updates grid but NOT the URL
- `?shape=round` never appears in URL bar after clicking Round filter
- Reverse direction works: navigating to `?shape=oval` correctly applies filter
- Root cause likely in `useSearchParams` / `useRouter` push logic in filter-bar component
- File: `src/components/engagement-rings/filter-bar.tsx`

### BUG: Select.Item empty value in configurator (Medium-High)
- `Error: A <Select.Item /> must have a value prop that is not an empty string`
- Source: `@radix-ui/react-select` in ring-configurator comboboxes
- Triggers 3x per render, causes HMR full reload loop in dev mode
- Makes Playwright interactions unstable (element refs constantly invalidated)
- File: `src/components/engagement-rings/ring-configurator.tsx`
- Fix: Ensure all `<SelectItem value={...}>` have non-empty string values

### ISSUE: Turbopack fails on Windows (Low - dev-only)
- `next dev` (Turbopack) fails with: `reading file ...\nul - Incorrect function (os error 1)`
- PostCSS/Tailwind processing tries to read Windows reserved device name `nul`
- Workaround: `npx next dev --webpack`
- Affects: dev mode only, build passes fine

### Evidence
- Screenshots saved to `.sisyphus/evidence/test1-*.png` through `test5-*.png`
- Full report: `.sisyphus/evidence/F3-playwright-qa-report.md`

## [2026-02-27] Supabase migration engagement-rings

### ISSUE (resolved): Build gagal di generateStaticParams karena request cookies tidak tersedia
- Symptom: `cookies was called outside a request scope` saat `next build` collect page data `/engagement-rings/[slug]`.
- Root cause: helper data memakai `createClient()` cookie-based dari `supabase-server` pada konteks build-time static.
- Fix: tambah fallback client `@supabase/supabase-js` non-persistent di `src/lib/supabase-rings.ts` ketika `createClient()` tidak bisa dipakai.
- Status: resolved, build berhasil penuh.

### ISSUE (resolved): TypeScript check gagal di test globals
- Symptom: `describe/it/expect` tidak dikenali pada `npx tsc --noEmit`.
- Root cause: globals vitest belum terdaftar di TypeScript compiler options.
- Fix: tambah `"types": ["vitest/globals"]` di `tsconfig.json`.
- Status: resolved, type-check hijau.
