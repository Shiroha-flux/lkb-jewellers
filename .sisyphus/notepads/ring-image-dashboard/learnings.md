# Learnings — ring-image-dashboard

## [2026-03-10] Session ses_32999daaeffeUfX1F4CeoznZSs — Initial Setup

### Codebase Patterns
- Dashboard file: `src/app/dashboard/page.tsx` — 1442 lines, TabType union at line 55
- Auth pattern: cookie `admin_session=authenticated` — check in API routes via `request.headers.get('cookie')`
- Supabase server client: `createClient()` from `@/lib/supabase-server`
- Supabase browser client: `createBrowserClient()` from `@/lib/supabase`
- Product CRUD pattern: `src/lib/products.ts` — follow this for ring-preferences.ts
- Dashboard styling: `bg-black`, `border-gray-800`, `text-white`, `rounded-xl`
- Image upload: products use imgbb; rings use Supabase Storage directly
- Slug-to-storage-path: `ring.slug.replace('ring-', '')` → e.g., `ring-allison` → `allison`
- Storage bucket: `engagement-rings`, path: `rings/{slug-without-ring-prefix}/{color}_{number}.jpg`

### Key Files
- `src/data/ring-hover-box-map.json` — 650+ lines, slug → color → hover URL
- `src/components/engagement-rings/ring-card.tsx` — MANUAL_HOVER_OVERRIDES, MANUAL_PRIMARY_NUMBER_OVERRIDES, GLOBAL_FALLBACK_HOVER_IMAGE
- `src/lib/supabase-rings.ts` — fetchAllRings(), fetchRingBySlug(), mapToRing()
- `src/app/engagement-rings/page.tsx` — server component for ring listing

### Worktree
- Branch: `ring-image-dashboard`
- Path: `C:\Users\Imam\Documents\project\KERJAAN\flux\lkb-jewellers-ring-dashboard`
- All code changes go in worktree, NOT in main repo

## [2026-03-10] Session Task 10 — Build/Test/E2E QA

### QA Findings
- Build command `npm run build` sukses (exit 0) pada worktree `lkb-jewellers-ring-dashboard`.
- Test command `npm run test` gagal 1 test: `src/__tests__/ring-filters.test.ts` pada kasus `filters by metal correctly (yellow_gold)`.
- API count check via `GET /api/rings/preferences` dengan cookie admin menghasilkan `RING_IMAGE_PREFERENCES_ROWS=655`.
- Public listing saat runtime menampilkan `24 of 224 settings` (bukan 225), perlu validasi sinkronisasi data/listing total.
- Pada QA browser, flow dashboard (tab Engagement Rings, search allison, open manager, set thumbnail+hover, save, reload) dapat dijalankan.

### Evidence
- Build/test output: `.sisyphus/evidence/task-10-build-test.txt`
- Screenshot flow: `.sisyphus/evidence/task-10-e2e-flow/`

## [2026-03-10] Session Task 10 — Seed + Integration QA + Visual QA

### Runtime Learnings
- Seed script butuh env runtime; command paling stabil: `npx dotenvx run -f .env.local -- npx tsx scripts/seed-ring-preferences.ts`.
- Seed menghasilkan `654` upsert rows, tetapi total tabel menjadi `655` (ada row existing/non-overwritten sebelumnya).
- `GET /api/rings/preferences` sesuai auth guard: tanpa cookie `401`, dengan `admin_session=authenticated` jadi `200`.
- Dashboard `Engagement Rings` memuat list dan search via placeholder `Search by name or slug…`; query `allison` menampilkan `ring-allison`.
- Ring manager ter-render expand-in-place di bawah row ring (bukan modal), dan tabs `Yellow Gold`, `White Gold`, `Rose Gold` muncul normal.
- Verifikasi fallback hover paling akurat lewat perubahan opacity dua layer image (`0/1 -> 1/0`) saat hover, bukan membandingkan src URL.

## [2026-03-10] F1 Audit Compliance Fix

### Fix A: Up/Down Reorder Arrows — RingImageManager.tsx
- `moveImage(color, fromIndex, direction)` fungsi: splice+insert untuk swap item di array `images[color]`
- Reorder adalah **local state only** — tidak ada API call baru
- Tombol ditempatkan di `absolute top-1 right-1`, visible on hover via `opacity-0 group-hover:opacity-100`
- Disabled: up button jika `index === 0`, down button jika `index === currentImages.length - 1`
- `disabled:opacity-25` digunakan (bukan `disabled:opacity-30`) untuk tampak lebih jelas saat disabled
- Tombol size `h-5 w-5` agar cukup kecil tapi masih clickable dalam card kecil
- Import ditambah: `ChevronUp, ChevronDown` dari `lucide-react`

### Fix B: Remove Anon Key Fallback — images/route.ts
- Hapus `anonKey` variable dan semua conditional fallback logic
- Jika `SUPABASE_SERVICE_ROLE_KEY` tidak ada → throw langsung: `'SUPABASE_SERVICE_ROLE_KEY is required for storage operations'`
- Pola yang benar: fail-fast, jangan fallback ke anon key untuk write ke Supabase Storage
- Build `npm run build` passed setelah kedua perubahan (265 static pages, 0 errors)

## [2026-03-10] Server-side Ring Preferences for Public Listing

### Implementasi
- Preferences ring sekarang diambil server-side pada `src/app/engagement-rings/page.tsx` via `getAllRingPreferences()` dengan fail-open ke object kosong.
- `EngagementRingsContent` menerima `allRingPreferences` prop, lalu resolve per-ring/per-color berdasarkan prioritas: metal filter aktif (`yellow_gold|white_gold|platinum|rose_gold`) lalu fallback deteksi warna dari URL thumbnail/hover.
- `RingListingCard` menerima `dbPreferences` prop dan memprioritaskan `thumbnail_url`/`hover_url` dari DB sebelum swap URL berbasis metal.

### RingCard Refactor
- `src/components/engagement-rings/ring-card.tsx` tidak lagi fetch `/api/rings/preferences` di client.
- Sumber DB preferences dipindah jadi prop `dbPreferences` (fail-open), sehingga chain fallback tetap: DB prefs → manual override map → `ring-hover-box-map.json` → global fallback.

### Verifikasi
- `lsp_diagnostics` clean pada file yang diubah.
- `npm run build` sukses (Next.js 16.1.6, 265 static pages).

## [2026-03-10] UI Compliance Fix — Preference Badge + AlertDialog

### Fix A: Preference Status Badge (EngagementRingsTab.tsx)
- Fetch `GET /api/rings/preferences` (tanpa slug) secara paralel dengan `GET /api/rings/list` via `Promise.all`
- Response shape: `{ data: { [ring_slug]: { [color]: { thumbnail_url, hover_url } } } }`
- `ringHasPreferences(slug)` cek apakah ada minimal satu color dengan thumbnail_url !== null atau hover_url !== null
- Badge ✓ prefs (green-400/green-800) jika sudah ada preferences, ⚠ no prefs (yellow-600/yellow-800) jika belum
- Preferences fetch fail-open: jika API return non-ok, state tetap `{}` (semua ring tampil ⚠)
- Badge ditempatkan inline di `flex items-center gap-2 flex-wrap` setelah slug text

### Fix B: AlertDialog Delete Confirmation (RingImageManager.tsx)
- Buat `src/components/ui/alert-dialog.tsx` mengikuti pola `dialog.tsx` — import `AlertDialog` dari `radix-ui` package
- `radix-ui` v1.4.3 sudah include `@radix-ui/react-alert-dialog` → `import { AlertDialog as AlertDialogPrimitive } from "radix-ui"` bekerja
- Hapus `if (!confirm(...)) return` dari `deleteImage()` function
- Delete button di-wrap dengan `<AlertDialog>` per image card di dalam loop
- `AlertDialogContent` pakai `className="bg-zinc-900 border-zinc-800"` untuk konsistensi dark theme
- `AlertDialogAction onClick={() => deleteImage(url)}` — url dari closure loop
- `npm run build` sukses (265 static pages, 0 errors)
