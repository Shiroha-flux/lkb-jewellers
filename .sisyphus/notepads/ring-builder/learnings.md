# Learnings — ring-builder

## [2026-02-26] Session ses_3660c0af5ffeubV0C4ZnkbLmnJ — Kickoff

### Codebase Patterns
- Route pattern: `src/app/{route}/page.tsx` as server component + `src/components/{route}-content.tsx` as "use client"
- Suspense wrapper pattern: see `src/app/jewellery/page.tsx`
- Filter + grid + useSearchParams: see `src/components/shop-content.tsx`
- Dark theme: bg-black, text-white, gold hardcoded as `text-[#D4AF37]` (NOT `text-gold` — overridden to white in globals.css)
- Image hover zoom: `hover:scale-105 transition-transform duration-700` (see bespoke/page.tsx:325-330)
- Responsive pattern: `flex flex-col lg:grid lg:grid-cols-2` (bespoke/page.tsx:82-84)

### Stack
- Next.js 16.1.6, React 19, framer-motion 12.34.2, Montserrat font, Tailwind CSS v4
- shadcn/ui INSTALLED: accordion, badge, button, card, dialog, input, marquee, separator, sheet, tooltip
- shadcn/ui MISSING: select, tabs, label, radio-group — install in Task 3
- tsconfig path alias: `@/*` → `./src/*`
- NO test infrastructure (vitest/jest not installed)

### Critical Guardrails
- NEVER use `text-gold` (overridden to #FFFFFF in globals.css line 8)
- NEVER touch CartContext, AuthContext, Navbar, Footer
- NO Supabase in engagement-rings code
- NO enquiry/cart/purchase flow
- NO carousel library — use CSS scroll-snap + framer-motion

### Cullen Jewellery Data
- 225 total engagement rings (Adelyn → Zya)
- Image CDN: `media.cullenjewellery.com/cdn-cgi/image/width={w},height={h}/products/rings/{name}/renders/{carat}/{setting}/{metal}/{hash}`
- URL pattern: `/engagement-rings/ring-{slug}`
- Filter categories: Shape (12), Metal Type (5), Setting Style (6), Band Type (3), Setting Profile (2)

## [2026-02-27] Supabase migration engagement-rings

### Integration Patterns
- `createClient()` dari `supabase-server` gagal saat build-time static generation (`cookies outside request scope`); perlu fallback non-cookie client untuk fungsi yang dipakai `generateStaticParams`/`generateMetadata`.
- Mapping DB ke `Ring` harus transform snake_case -> camelCase, termasuk mismatch `resizable` (DB) -> `resizing` (interface).
- Untuk kestabilan urutan data relasi, sort semua tabel child berdasarkan `_order` sebelum map ke array UI.
- `engagement_ring_specs` pakai FK `ring_id` (bukan `_parent_id`), sehingga nested select perlu alias relation `engagement_ring_specs!ring_id(*)`.

## [2026-03-05] Script download missing photos

### Scripts Pattern
- Cullen `__data.json` sering berisi URL image tanpa ekstensi file; filter paling aman adalah by path `/renders/` + exclude `.mp4`.
- Payload Cullen bisa memuat setting path bertingkat (`High Setting/Yellow`), jadi parsing warna harus scan segmen path dan cocokkan ke whitelist warna metal.
- Data node Cullen bisa memuat media ring lain; wajib filter URL dengan segmen `/products/rings/{ring_folder}/` agar tidak salah ambil gambar lintas produk.
- Untuk validasi mode LIVE tanpa mutasi DB/storage, jalankan dengan target yang sudah terpenuhi (`--target 0` atau target sama dengan existing).
