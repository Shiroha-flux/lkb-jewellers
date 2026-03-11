# Ring Image Management Dashboard

## TL;DR

> **Quick Summary**: Tambah tab "Engagement Rings" di admin dashboard untuk manage gambar 225 ring. Admin bisa lihat semua foto per ring per metal color (yellow/white/rose) dalam grid, pilih thumbnail & hover image dengan klik, upload foto baru ke Supabase Storage, hapus foto, dan reorder urutan. Preferences disimpan di tabel baru `ring_image_preferences` di Supabase, menggantikan hardcoded overrides dan JSON file.
> 
> **Deliverables**:
> - Tabel Supabase `ring_image_preferences` + RLS policy
> - API routes `/api/rings/preferences` dan `/api/rings/images` (CRUD + upload + delete)
> - Komponen dashboard `EngagementRingsTab` dengan grid UI per ring per color
> - Update `ring-card.tsx` baca preferences dari DB dengan fallback ke JSON
> - Migration script seed data dari `ring-hover-box-map.json`
> - Supabase Storage upload/delete via server-side API route (service role key)
> 
> **Estimated Effort**: Large
> **Parallel Execution**: YES - 4 waves
> **Critical Path**: Task 1 → Task 3 → Task 5 → Task 7 → Task 8 → Final Verification

---

## Context

### Original Request
User mau semua engagement rings bisa dimanage dari dashboard. Pilih hover image yang mana, thumbnail yang mana. Per ring, per metal color (yellow/white/rose/platinum). Full image management: upload baru, hapus, reorder.

### Interview Summary
**Key Discussions**:
- Dashboard sudah ada di `/dashboard` dengan auth `lkbadmin` via cookie `admin_session`
- Saat ini dashboard manage products/orders/contacts/sell/newsletter — BELUM ada engagement ring management
- Ring data di Supabase: `engagement_rings` (225 rows), `engagement_ring_images` (3330 rows)
- Images di Supabase Storage bucket `engagement-rings/rings/{slug}/{color}_{number}.jpg`
- Hover logic saat ini pakai hardcoded overrides + `ring-hover-box-map.json` (generated CV script)
- User pilih: tabel baru di Supabase, full CRUD (upload/delete/reorder), grid UI klik assign
- Per ring per metal color — setiap color punya set foto dan preferences sendiri

**Research Findings**:
- Dashboard `page.tsx` sudah 1442 baris — komponen baru HARUS di-extract ke file terpisah
- RLS aktif di semua tabel ring — tabel baru perlu policy eksplisit atau disable RLS
- `engagement_ring_images` sudah punya `thumbnail_url` kolom tapi TIDAK dipakai di `mapToRing()`
- Slug format: `ring-allison` → storage path: `rings/allison/` (tanpa prefix `ring-`)
- Beberapa ring tidak punya semua 3 warna (e.g., `ring-adelyn` hanya punya rose + white)
- Product images saat ini upload ke imgbb — untuk rings pakai Supabase Storage langsung

### Metis Review
**Identified Gaps** (addressed):
- RLS concern: Tabel baru pakai disable RLS (sama seperti `products`, `contacts`, `orders`) — semua dashboard tables tanpa RLS
- Fallback chain: `ring-card.tsx` HARUS tetap berfungsi jika DB preferences kosong — fallback ke JSON + overrides
- Dashboard file size: Komponen engagement rings di-extract ke folder terpisah, bukan inline
- Storage upload security: Upload via API route dengan server-side Supabase client, bukan anon key di browser
- Migration data: Seed script baca `ring-hover-box-map.json` + `MANUAL_HOVER_OVERRIDES` → insert ke DB
- Slug-to-path mapping: `ring.slug.replace('ring-', '')` untuk storage path — sudah pattern existing

---

## Work Objectives

### Core Objective
Buat fitur image management engagement rings di admin dashboard. Admin bisa lihat, pilih, upload, hapus, dan reorder foto per ring per metal color. Preferences tersimpan di Supabase dan menggantikan hardcoded logic.

### Concrete Deliverables
- Tabel `ring_image_preferences` di Supabase
- API route `src/app/api/rings/preferences/route.ts` (GET/POST/DELETE preferences)
- API route `src/app/api/rings/images/route.ts` (POST upload / DELETE from storage)
- Lib `src/lib/ring-preferences.ts` (CRUD functions)
- Komponen `src/components/dashboard/engagement-rings/EngagementRingsTab.tsx` (main tab)
- Komponen `src/components/dashboard/engagement-rings/RingImageManager.tsx` (per-ring image grid)
- Update `ring-card.tsx` — baca dari DB, fallback ke JSON
- Update `supabase-rings.ts` — fetch preferences saat fetch rings
- Update `dashboard/page.tsx` — tambah tab + sidebar entry
- Script `scripts/seed-ring-preferences.ts` — migrasi data JSON ke DB

### Definition of Done
- [ ] `npm run build` pass tanpa error
- [ ] Tab "Engagement Rings" muncul di sidebar dashboard
- [ ] Admin bisa lihat 225 ring, klik ring → lihat foto per color
- [ ] Admin bisa set thumbnail dan hover per color per ring
- [ ] Admin bisa upload foto baru ke Supabase Storage
- [ ] Admin bisa hapus foto dari storage
- [ ] Admin bisa reorder foto (up/down arrows)
- [ ] Preferences tersimpan di DB dan terbaca oleh frontend
- [ ] Fallback ke `ring-hover-box-map.json` jika DB preferences kosong

### Must Have
- Grid gambar per ring per metal color
- Klik assign thumbnail / hover
- Upload foto baru ke Supabase Storage
- Hapus foto dari storage + DB
- Reorder urutan foto (up/down arrows)
- Auth check di semua API routes
- Fallback chain tetap berfungsi

### Must NOT Have (Guardrails)
- JANGAN drag-and-drop reorder (pakai up/down arrows seperti existing product images)
- JANGAN tambah komponen inline di `dashboard/page.tsx` (extract ke file terpisah)
- JANGAN hapus `ring-hover-box-map.json` atau `MANUAL_HOVER_OVERRIDES` — pertahankan sebagai fallback
- JANGAN ubah schema tabel `engagement_ring_images` atau `engagement_rings`
- JANGAN expose Supabase service role key ke client-side code
- JANGAN ubah hover animation logic di `ring-card.tsx`
- JANGAN buat auth mechanism baru (pakai `admin_session` cookie yang ada)
- JANGAN pakai anon key untuk write ke Supabase Storage (pakai service role via API route)

---

## Verification Strategy (MANDATORY)

> **ZERO HUMAN INTERVENTION** — ALL verification is agent-executed. No exceptions.

### Test Decision
- **Infrastructure exists**: YES (project has npm run test, 37 tests passing)
- **Automated tests**: Tests-after (add tests for API routes and lib functions)
- **Framework**: bun test / vitest (whatever existing project uses)

### QA Policy
Every task MUST include agent-executed QA scenarios.
Evidence saved to `.sisyphus/evidence/task-{N}-{scenario-slug}.{ext}`.

- **API/Backend**: Use Bash (curl) — Send requests, assert status + response fields
- **Frontend/UI**: Use Playwright (playwright skill) — Navigate, interact, assert DOM, screenshot
- **Database**: Use Supabase SQL — Query tables, assert row counts and data

---

## Execution Strategy

### Parallel Execution Waves

```
Wave 1 (Start Immediately — foundation):
├── Task 1: Supabase migration: tabel ring_image_preferences [quick]
├── Task 2: Lib: src/lib/ring-preferences.ts [quick]
└── Task 3: API routes: /api/rings/preferences + /api/rings/images [deep]

Wave 2 (After Wave 1 — core components):
├── Task 4: Komponen: EngagementRingsTab.tsx (ring list + search) [visual-engineering]
├── Task 5: Komponen: RingImageManager.tsx (image grid per color) [visual-engineering]
└── Task 6: Update ring-card.tsx: baca dari DB + fallback [deep]

Wave 3 (After Wave 2 — integration):
├── Task 7: Integrasi tab ke dashboard page.tsx [quick]
├── Task 8: Update supabase-rings.ts: fetch preferences [quick]
└── Task 9: Seed script: migrasi JSON → DB [quick]

Wave 4 (After Wave 3 — verification):
└── Task 10: Build + integration test + visual QA [deep]

Wave FINAL (After ALL tasks — independent review, 4 parallel):
├── Task F1: Plan compliance audit (oracle)
├── Task F2: Code quality review (unspecified-high)
├── Task F3: Real manual QA (unspecified-high)
└── Task F4: Scope fidelity check (deep)

Critical Path: Task 1 → Task 3 → Task 5 → Task 7 → Task 10 → F1-F4
Parallel Speedup: ~60% faster than sequential
Max Concurrent: 3 (Waves 1 & 2)
```

### Dependency Matrix

| Task | Depends On | Blocks | Wave |
|------|-----------|--------|------|
| 1    | —         | 2, 3, 9 | 1   |
| 2    | 1         | 4, 5, 6 | 1   |
| 3    | 1         | 4, 5, 7 | 1   |
| 4    | 2, 3      | 7      | 2   |
| 5    | 2, 3      | 7      | 2   |
| 6    | 2         | 8, 10  | 2   |
| 7    | 4, 5      | 10     | 3   |
| 8    | 6         | 10     | 3   |
| 9    | 1         | 10     | 3   |
| 10   | 7, 8, 9   | F1-F4  | 4   |

### Agent Dispatch Summary

- **Wave 1**: 3 tasks — T1 `quick`, T2 `quick`, T3 `deep`
- **Wave 2**: 3 tasks — T4 `visual-engineering`, T5 `visual-engineering`, T6 `deep`
- **Wave 3**: 3 tasks — T7 `quick`, T8 `quick`, T9 `quick`
- **Wave 4**: 1 task — T10 `deep`
- **FINAL**: 4 tasks — F1 `oracle`, F2 `unspecified-high`, F3 `unspecified-high`, F4 `deep`

---

## TODOs

- [x] 1. Supabase Migration: Tabel `ring_image_preferences`

  **What to do**:
  - Buat tabel `ring_image_preferences` dengan schema:
    ```sql
    CREATE TABLE ring_image_preferences (
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      ring_slug VARCHAR NOT NULL,
      color VARCHAR NOT NULL CHECK (color IN ('yellow', 'white', 'rose')),
      thumbnail_url TEXT,
      hover_url TEXT,
      updated_at TIMESTAMPTZ DEFAULT now(),
      UNIQUE(ring_slug, color)
    );
    CREATE INDEX idx_ring_prefs_slug ON ring_image_preferences(ring_slug);
    ```
  - DISABLE RLS pada tabel ini (sama seperti `products`, `contacts`, `orders` — semua dashboard tables tanpa RLS)
  - Atau jika harus RLS: buat policy `anon` read + `service_role` write

  **Must NOT do**:
  - JANGAN ubah schema tabel `engagement_ring_images` atau `engagement_rings`
  - JANGAN tambah kolom ke tabel existing

  **Recommended Agent Profile**:
  - **Category**: `quick`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 2, 3)
  - **Blocks**: Tasks 2, 3, 9
  - **Blocked By**: None

  **References**:
  **Pattern References**:
  - Existing dashboard tables (`products`, `contacts`, `orders`) all have `rls_enabled: false` — follow same pattern
  - `engagement_ring_images` table has `_parent_id` FK to `engagement_rings.id` — but our table uses `ring_slug` (VARCHAR) for simplicity since slug is unique

  **QA Scenarios (MANDATORY)**:
  ```
  Scenario: Table created successfully
    Tool: Supabase SQL
    Steps:
      1. Run: SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'ring_image_preferences' ORDER BY ordinal_position
      2. Assert: 6 columns returned (id, ring_slug, color, thumbnail_url, hover_url, updated_at)
      3. Run: INSERT INTO ring_image_preferences (ring_slug, color, thumbnail_url) VALUES ('test-ring', 'yellow', 'https://test.jpg')
      4. Assert: Insert succeeds
      5. Run: DELETE FROM ring_image_preferences WHERE ring_slug = 'test-ring'
    Expected Result: Table exists with correct schema, inserts work
    Evidence: .sisyphus/evidence/task-1-table-created.txt

  Scenario: Unique constraint works
    Tool: Supabase SQL
    Steps:
      1. INSERT INTO ring_image_preferences (ring_slug, color) VALUES ('test-dup', 'yellow')
      2. INSERT INTO ring_image_preferences (ring_slug, color) VALUES ('test-dup', 'yellow')
      3. Assert: Second insert fails with unique violation
      4. Cleanup: DELETE FROM ring_image_preferences WHERE ring_slug = 'test-dup'
    Expected Result: Duplicate (ring_slug, color) rejected
    Evidence: .sisyphus/evidence/task-1-unique-constraint.txt
  ```

  **Commit**: YES
  - Message: `feat(db): add ring_image_preferences table`
  - Files: migration file
  - Pre-commit: `npm run build`

- [x] 2. Lib: `src/lib/ring-preferences.ts`

  **What to do**:
  - Buat file `src/lib/ring-preferences.ts` mengikuti pola `src/lib/products.ts`
  - Export fungsi:
    - `getRingPreferences(slug: string)` → `{ yellow?: { thumbnail_url, hover_url }, white?: ..., rose?: ... }` atau `null`
    - `getAllRingPreferences()` → `Record<string, Record<string, { thumbnail_url, hover_url }>>`
    - `upsertRingPreference(slug: string, color: string, thumbnailUrl: string | null, hoverUrl: string | null)` → void
    - `deleteRingPreference(slug: string, color: string)` → void
  - Gunakan `createClient()` dari `@/lib/supabase-server` untuk server-side calls
  - Buat juga browser-side helpers jika diperlukan

  **Must NOT do**:
  - JANGAN ubah file `src/lib/products.ts`
  - JANGAN import service role key di file ini (itu di API route)

  **Recommended Agent Profile**:
  - **Category**: `quick`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES (setelah Task 1 selesai)
  - **Parallel Group**: Wave 1 (with Tasks 1, 3)
  - **Blocks**: Tasks 4, 5, 6
  - **Blocked By**: Task 1

  **References**:
  **Pattern References**:
  - `src/lib/products.ts` — CRUD pattern: `getProducts()`, `createProduct()`, `updateProduct()`, `deleteProduct()`. Ikuti pola function signature dan error handling.
  - `src/lib/supabase-server.ts` — Server client setup: `createClient()` returns server supabase client with cookies
  - `src/lib/supabase.ts` — Browser client: `createBrowserClient()` with anon key

  **QA Scenarios (MANDATORY)**:
  ```
  Scenario: getRingPreferences returns null for non-existent ring
    Tool: Bash (node/bun REPL)
    Steps:
      1. Import getRingPreferences from the module
      2. Call getRingPreferences('ring-nonexistent')
      3. Assert: returns null
    Expected Result: null returned, no error thrown
    Evidence: .sisyphus/evidence/task-2-get-null.txt
  ```

  **Commit**: YES (group with Task 3)
  - Message: `feat(lib): add ring-preferences CRUD functions`
  - Files: `src/lib/ring-preferences.ts`

- [x] 3. API Routes: Ring Preferences + Image Management

  **What to do**:
  - Buat `src/app/api/rings/preferences/route.ts`:
    - `GET /api/rings/preferences?slug=ring-allison` → return preferences per slug (semua colors)
    - `GET /api/rings/preferences` (tanpa slug) → return ALL preferences (untuk dashboard initial load)
    - `POST /api/rings/preferences` body `{ slug, color, thumbnail_url?, hover_url? }` → upsert
    - `DELETE /api/rings/preferences?slug=X&color=Y` → delete preference
  - Buat `src/app/api/rings/images/route.ts`:
    - `POST /api/rings/images` (multipart/form-data) → upload file ke Supabase Storage bucket `engagement-rings/rings/{slug}/{color}_{number}.jpg`. Gunakan `SUPABASE_SERVICE_ROLE_KEY` env var untuk write access.
    - `DELETE /api/rings/images?path=rings/allison/yellow_5.jpg` → delete dari storage. Juga delete row dari `engagement_ring_images` jika ada.
  - Buat `src/app/api/rings/list/route.ts`:
    - `GET /api/rings/list` → return semua ring dengan images grouped by color. Optimized query.
  - Semua routes: cek cookie `admin_session=authenticated` di request → return 401 jika tidak ada
  - Pattern: baca cookie dari `request.headers.get('cookie')`, parse, cek value

  **Must NOT do**:
  - JANGAN expose service role key ke response body
  - JANGAN allow non-admin access
  - JANGAN upload ke bucket selain `engagement-rings`

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES (setelah Task 1)
  - **Parallel Group**: Wave 1 (with Tasks 1, 2)
  - **Blocks**: Tasks 4, 5, 7
  - **Blocked By**: Task 1

  **References**:
  **Pattern References**:
  - `src/app/api/auth/route.ts` — Auth check pattern. Baca file ini untuk lihat gimana dashboard cek password.
  - `src/app/dashboard/page.tsx:114-131` — Cookie auth pattern: `document.cookie = 'admin_session=authenticated; ...'`
  - `src/lib/supabase-rings.ts:104-114` — `getSupabaseClient()` pattern for server-side Supabase

  **API/Type References**:
  - `src/lib/ring-preferences.ts` (Task 2) — CRUD functions to call

  **External References**:
  - Supabase Storage JS: `supabase.storage.from('engagement-rings').upload(path, file, { upsert: true })`
  - Supabase Storage JS: `supabase.storage.from('engagement-rings').remove([path])`

  **QA Scenarios (MANDATORY)**:
  ```
  Scenario: Auth check — unauthorized request rejected
    Tool: Bash (curl)
    Steps:
      1. curl -s -o /dev/null -w '%{http_code}' http://localhost:3000/api/rings/preferences
      2. Assert: status code is 401
    Expected Result: 401 Unauthorized
    Evidence: .sisyphus/evidence/task-3-auth-401.txt

  Scenario: Auth check — authorized request succeeds
    Tool: Bash (curl)
    Steps:
      1. curl -s -w '\n%{http_code}' http://localhost:3000/api/rings/preferences -H 'Cookie: admin_session=authenticated'
      2. Assert: status code is 200
      3. Assert: response body is valid JSON
    Expected Result: 200 OK with JSON body
    Evidence: .sisyphus/evidence/task-3-auth-200.txt

  Scenario: POST upsert preference
    Tool: Bash (curl)
    Steps:
      1. curl -X POST http://localhost:3000/api/rings/preferences -H 'Cookie: admin_session=authenticated' -H 'Content-Type: application/json' -d '{"slug":"ring-adelyn","color":"yellow","thumbnail_url":"https://test.jpg","hover_url":"https://test-hover.jpg"}'
      2. Assert: status 200
      3. curl http://localhost:3000/api/rings/preferences?slug=ring-adelyn -H 'Cookie: admin_session=authenticated'
      4. Assert: response contains thumbnail_url and hover_url for yellow
    Expected Result: Preference saved and retrievable
    Evidence: .sisyphus/evidence/task-3-upsert.txt

  Scenario: DELETE preference
    Tool: Bash (curl)
    Steps:
      1. curl -X DELETE 'http://localhost:3000/api/rings/preferences?slug=ring-adelyn&color=yellow' -H 'Cookie: admin_session=authenticated'
      2. Assert: status 200
      3. curl http://localhost:3000/api/rings/preferences?slug=ring-adelyn -H 'Cookie: admin_session=authenticated'
      4. Assert: yellow preference is gone
    Expected Result: Preference deleted
    Evidence: .sisyphus/evidence/task-3-delete.txt
  ```

  **Commit**: YES
  - Message: `feat(api): add ring preferences and image management API routes`
  - Files: `src/app/api/rings/preferences/route.ts`, `src/app/api/rings/images/route.ts`, `src/app/api/rings/list/route.ts`
  - Pre-commit: `npm run build`

- [x] 4. Komponen: `EngagementRingsTab.tsx` (Ring List + Search)

  **What to do**:
  - Buat `src/components/dashboard/engagement-rings/EngagementRingsTab.tsx`
  - Komponen utama yang render di dashboard tab "Engagement Rings"
  - Fitur:
    - Fetch semua 225 ring via `GET /api/rings/list` (with admin cookie)
    - Fetch semua preferences via `GET /api/rings/preferences`
    - Tampilkan grid card ring (thumbnail + nama + slug)
    - Search bar untuk filter by name/slug
    - Klik ring → buka `RingImageManager` (Task 5) di panel/modal
    - Badge indicator: ✅ jika ring sudah punya preferences, ⚠️ jika belum
  - Styling: ikuti pattern dashboard existing (bg-black, border-gray-800, text-white, rounded-xl)
  - State management: semua local state (useState), JANGAN tambah state ke DashboardContent

  **Must NOT do**:
  - JANGAN inline di `dashboard/page.tsx`
  - JANGAN tambah state ke parent `DashboardContent`
  - JANGAN fetch data langsung dari Supabase (pakai API routes)

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: [`shadcn-ui`, `frontend-ui-ux`]
    - `shadcn-ui`: Dashboard pakai shadcn components (Button, Input, Badge, Dialog, Separator)
    - `frontend-ui-ux`: Grid layout, search UX, responsive design

  **Parallelization**:
  - **Can Run In Parallel**: YES (with Tasks 5, 6)
  - **Parallel Group**: Wave 2
  - **Blocks**: Task 7
  - **Blocked By**: Tasks 2, 3

  **References**:
  **Pattern References**:
  - `src/app/dashboard/page.tsx:841-962` — Product listing grid pattern (search + grid + card). Ikuti exact styling: grid-cols-3, card with image, hover border-white/30, group-hover:scale-110 image.
  - `src/app/dashboard/page.tsx:844-869` — Search bar pattern. Input dengan clear button, result count.
  - `src/app/dashboard/page.tsx:55` — `TabType` union — akan ditambah `'engagement-rings'`
  - `src/app/dashboard/page.tsx:717-726` — `sidebarTabs` array structure

  **API/Type References**:
  - `GET /api/rings/list` (Task 3) — returns array of rings with images
  - `GET /api/rings/preferences` (Task 3) — returns all preferences
  - `src/data/engagement-rings.ts:Ring` — Ring type interface

  **QA Scenarios (MANDATORY)**:
  ```
  Scenario: Ring list renders with search
    Tool: Playwright
    Preconditions: Dev server running, admin logged in
    Steps:
      1. Navigate to http://localhost:3000/dashboard
      2. Click sidebar tab "Engagement Rings"
      3. Assert: grid shows ring cards (at least 1 visible)
      4. Type "allison" in search box
      5. Assert: filtered results show ring-allison
      6. Screenshot
    Expected Result: Ring grid renders, search filters correctly
    Evidence: .sisyphus/evidence/task-4-ring-list.png

  Scenario: Ring list shows preference status badges
    Tool: Playwright
    Preconditions: At least 1 ring has preferences in DB (after seed)
    Steps:
      1. Navigate to Engagement Rings tab
      2. Find ring with preferences → assert badge shows ✅ or similar indicator
      3. Find ring without preferences → assert shows warning indicator
    Expected Result: Visual distinction between configured and unconfigured rings
    Evidence: .sisyphus/evidence/task-4-badges.png
  ```

  **Commit**: YES (group with Task 5)
  - Message: `feat(dashboard): add engagement rings image management components`
  - Files: `src/components/dashboard/engagement-rings/EngagementRingsTab.tsx`

- [x] 5. Komponen: `RingImageManager.tsx` (Image Grid per Color)

  **What to do**:
  - Buat `src/components/dashboard/engagement-rings/RingImageManager.tsx`
  - Panel/modal yang terbuka saat admin klik ring di list
  - Fitur:
    - Tabs per color: Yellow | White | Rose (hanya tampil tab yang punya gambar)
    - Grid gambar dari ring's images (filter by color dari URL pattern `{color}_N.jpg`)
    - Setiap gambar card punya:
      - Thumbnail gambar
      - Badge "PRIMARY" jika ini current thumbnail
      - Badge "HOVER" jika ini current hover image
      - Button "Set as Thumbnail" / "Set as Hover"
      - Button "Delete" (dengan konfirmasi dialog)
      - Up/Down arrows untuk reorder `_order` field
    - Upload section: file picker + upload ke Supabase Storage via `POST /api/rings/images`
      - Auto-naming: detect next available number (e.g., jika yellow_1 s/d yellow_5 ada, upload jadi yellow_6)
      - Show upload progress
    - Save button: POST preferences ke `/api/rings/preferences`
    - Show current thumbnail + hover preview side-by-side
  - Color detection dari URL: extract `yellow`, `white`, atau `rose` dari `{color}_{number}.jpg` pattern
  - Slug-to-path: `ring.slug.replace('ring-', '')` untuk storage path

  **Must NOT do**:
  - JANGAN implement drag-and-drop (pakai up/down arrows)
  - JANGAN hapus foto tanpa konfirmasi dialog
  - JANGAN set gambar yang sama sebagai thumbnail DAN hover (validasi)

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: [`shadcn-ui`, `frontend-ui-ux`]
    - `shadcn-ui`: Dialog, Tabs, Button, Badge components
    - `frontend-ui-ux`: Image grid layout, badge positioning, responsive

  **Parallelization**:
  - **Can Run In Parallel**: YES (with Tasks 4, 6)
  - **Parallel Group**: Wave 2
  - **Blocks**: Task 7
  - **Blocked By**: Tasks 2, 3

  **References**:
  **Pattern References**:
  - `src/app/dashboard/page.tsx:391-410` — Product image list with reorder (up/down arrows, delete, URL display). EXACT pattern to follow for image grid.
  - `src/app/dashboard/page.tsx:373-380` — Upload images pattern (file picker + imgbb upload). Adapt for Supabase Storage.
  - `src/components/engagement-rings/image-gallery.tsx` — Ring detail image gallery. Lihat gimana images di-render dan di-group.
  - `src/components/engagement-rings/ring-card.tsx:15-50` — `MANUAL_HOVER_OVERRIDES` dan `MANUAL_PRIMARY_NUMBER_OVERRIDES` — understand current override system.

  **API/Type References**:
  - `POST /api/rings/images` (Task 3) — upload file
  - `DELETE /api/rings/images?path=...` (Task 3) — delete file
  - `POST /api/rings/preferences` (Task 3) — save thumbnail/hover choice
  - Supabase image URL format: `https://ttiwmcrfahbczzehmyds.supabase.co/storage/v1/object/public/engagement-rings/rings/{slug-without-ring-prefix}/{color}_{number}.jpg`

  **QA Scenarios (MANDATORY)**:
  ```
  Scenario: Open ring and view images per color
    Tool: Playwright
    Preconditions: Dev server running, admin logged in
    Steps:
      1. Navigate to Engagement Rings tab
      2. Click on "Allison" ring card
      3. Assert: Image manager panel/modal opens
      4. Assert: Color tabs visible (at least Yellow, White, Rose)
      5. Click "White" tab
      6. Assert: Grid shows white_*.jpg images
      7. Screenshot
    Expected Result: Image grid loads per color with correct images
    Evidence: .sisyphus/evidence/task-5-image-grid.png

  Scenario: Set thumbnail and hover
    Tool: Playwright
    Preconditions: Ring image manager open for a ring
    Steps:
      1. Click "Set as Thumbnail" on first image
      2. Assert: Badge "PRIMARY" appears on that image
      3. Click "Set as Hover" on second image
      4. Assert: Badge "HOVER" appears on that image
      5. Click Save
      6. Assert: Success notification
      7. Reload page, open same ring
      8. Assert: Badges still in place (persisted)
    Expected Result: Preferences saved to DB and persist across reload
    Evidence: .sisyphus/evidence/task-5-set-preferences.png

  Scenario: Upload new image
    Tool: Playwright
    Preconditions: Ring image manager open
    Steps:
      1. Click upload button / file picker
      2. Select a test JPG file
      3. Assert: Upload progress shown
      4. Assert: New image appears in grid after upload
    Expected Result: Image uploaded to Supabase Storage, appears in grid
    Evidence: .sisyphus/evidence/task-5-upload.png

  Scenario: Delete image with confirmation
    Tool: Playwright
    Steps:
      1. Click "Delete" on an image
      2. Assert: Confirmation dialog appears
      3. Click "Cancel" → image still there
      4. Click "Delete" again → Click "Confirm"
      5. Assert: Image removed from grid
    Expected Result: Delete requires confirmation, removes from storage
    Evidence: .sisyphus/evidence/task-5-delete.png
  ```

  **Commit**: YES (group with Task 4)
  - Message: `feat(dashboard): add engagement rings image management components`
  - Files: `src/components/dashboard/engagement-rings/RingImageManager.tsx`

- [x] 6. Update `ring-card.tsx`: Baca dari DB + Fallback

  **What to do**:
  - Di halaman listing `/engagement-rings` (server component), fetch ALL preferences dari DB via `getAllRingPreferences()` (lib function dari Task 2)
  - Pass preferences per ring ke `<RingCard>` via prop baru `dbPreferences?: { thumbnail_url: string | null, hover_url: string | null } | null`
  - Di `ring-card.tsx`, tambah logic:
    ```
    // Priority: DB preferences > MANUAL_HOVER_OVERRIDES > ring-hover-box-map.json > GLOBAL_FALLBACK
    const hoverImage = dbPreferences?.hover_url ?? MANUAL_HOVER_OVERRIDES[slug]?.[color] ?? hoverBoxMap[slug]?.[color] ?? GLOBAL_FALLBACK_HOVER_IMAGE
    const primaryImage = dbPreferences?.thumbnail_url ?? (existing primary logic)
    ```
  - JANGAN hapus existing fallback logic (MANUAL_HOVER_OVERRIDES, ring-hover-box-map.json, GLOBAL_FALLBACK_HOVER_IMAGE)
  - Update `src/app/engagement-rings/page.tsx` (atau layout) untuk fetch preferences dan pass down

  **Must NOT do**:
  - JANGAN hapus `MANUAL_HOVER_OVERRIDES` atau `MANUAL_PRIMARY_NUMBER_OVERRIDES`
  - JANGAN hapus import `ring-hover-box-map.json`
  - JANGAN ubah hover animation logic (mouseEnter/mouseLeave handlers)
  - JANGAN ubah preload fail-open logic

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES (with Tasks 4, 5)
  - **Parallel Group**: Wave 2
  - **Blocks**: Task 8, 10
  - **Blocked By**: Task 2

  **References**:
  **Pattern References**:
  - `src/components/engagement-rings/ring-card.tsx:15-50` — Current `MANUAL_HOVER_OVERRIDES`, `MANUAL_PRIMARY_NUMBER_OVERRIDES`, `GLOBAL_FALLBACK_HOVER_IMAGE`. Understand full fallback chain.
  - `src/components/engagement-rings/ring-card.tsx:122-165` — Current image selection logic: `getColorFromUrl()`, `getImageNumber()`, hover image derivation. This is what gets a new DB priority layer.
  - `src/app/engagement-rings/page.tsx` — Server component that renders ring listing. This is where `getAllRingPreferences()` call goes.
  - `src/lib/ring-preferences.ts` (Task 2) — `getAllRingPreferences()` function

  **QA Scenarios (MANDATORY)**:
  ```
  Scenario: DB preferences override JSON mapping
    Tool: Bash (curl) + Playwright
    Preconditions: Seed preferences for ring-adelyn yellow with a specific hover URL
    Steps:
      1. Insert preference: ring-adelyn, yellow, hover_url = 'https://...adelyn/yellow_3.jpg'
      2. Navigate to /engagement-rings
      3. Find ring-adelyn card
      4. Hover over card
      5. Assert: hover image src matches the DB preference URL, NOT the JSON map URL
    Expected Result: DB preference takes priority over JSON
    Evidence: .sisyphus/evidence/task-6-db-override.png

  Scenario: Fallback to JSON when DB empty
    Tool: Playwright
    Preconditions: ring_image_preferences table is empty (or no entry for target ring)
    Steps:
      1. Ensure no preferences for ring-alexia
      2. Navigate to /engagement-rings
      3. Find ring-alexia card
      4. Hover over card
      5. Assert: hover image loads from MANUAL_HOVER_OVERRIDES or ring-hover-box-map.json
    Expected Result: Existing fallback chain works when DB has no data
    Evidence: .sisyphus/evidence/task-6-fallback.png
  ```

  **Commit**: YES
  - Message: `refactor(ring-card): read preferences from DB with JSON fallback`
  - Files: `src/components/engagement-rings/ring-card.tsx`, `src/app/engagement-rings/page.tsx`
  - Pre-commit: `npm run build && npm run test`

---

- [x] 7. Integrasi Tab ke Dashboard `page.tsx`

  **What to do**:
  - Di `src/app/dashboard/page.tsx`:
    - Tambah `"engagement-rings"` ke `TabType` union (baris 55): `type TabType = "add" | "watches" | ... | "engagement-rings"`
    - Import `EngagementRingsTab` dari `@/components/dashboard/engagement-rings/EngagementRingsTab`
    - Tambah entry ke `sidebarTabs` array (setelah merchandise, sebelum orders divider):
      `{ tab: "engagement-rings" }`
    - Tambah ke `tabIcon`: case `"engagement-rings"` return `<Gem size={20} />` (sudah import Gem)
    - Tambah ke `tabLabel`: `"engagement-rings": "Engagement Rings"`
    - Tambah ke `headerTitle` map: `"engagement-rings": { icon: <Gem />, title: "Engagement Rings", desc: "Manage ring images and preferences" }`
    - Tambah render conditional: `{activeTab === "engagement-rings" && <EngagementRingsTab />}`
  - JANGAN ubah hal lain di file ini

  **Must NOT do**:
  - JANGAN tambah state baru ke DashboardContent untuk engagement rings
  - JANGAN inline komponen (hanya import + render)
  - JANGAN ubah existing tab logic

  **Recommended Agent Profile**:
  - **Category**: `quick`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Wave 3 (sequential dependency on 4, 5)
  - **Blocks**: Task 10
  - **Blocked By**: Tasks 4, 5

  **References**:
  **Pattern References**:
  - `src/app/dashboard/page.tsx:55` — `TabType` union definition
  - `src/app/dashboard/page.tsx:684-696` — `tabIcon` function with switch cases
  - `src/app/dashboard/page.tsx:698-701` — `tabLabel` function with labels map
  - `src/app/dashboard/page.tsx:703-715` — `headerTitle` function with icon/title/desc map
  - `src/app/dashboard/page.tsx:717-726` — `sidebarTabs` array
  - `src/app/dashboard/page.tsx:833-838` — Tab content conditional render section

  **QA Scenarios (MANDATORY):**
  ```
  Scenario: Tab visible in sidebar
    Tool: Playwright
    Steps:
      1. Navigate to /dashboard, login with lkbadmin
      2. Assert: Sidebar contains "Engagement Rings" tab
      3. Click tab
      4. Assert: Header shows "Engagement Rings" title
      5. Assert: Content area shows EngagementRingsTab component
      6. Screenshot
    Expected Result: Tab integrated and functional
    Evidence: .sisyphus/evidence/task-7-tab-integrated.png
  ```

  **Commit**: YES
  - Message: `feat(dashboard): integrate engagement rings tab`
  - Files: `src/app/dashboard/page.tsx`
  - Pre-commit: `npm run build`

- [x] 8. Update `supabase-rings.ts`: Fetch Preferences

  **What to do**:
  - Di `src/lib/supabase-rings.ts`, update `fetchAllRings()` dan `fetchRingBySlug()`:
    - Setelah fetch ring data, juga fetch preferences dari `ring_image_preferences` table
    - Extend return type `Ring` interface (atau buat wrapper) untuk include `preferences` field
    - Atau: buat fungsi terpisah `fetchRingPreferencesMap()` yang dipanggil di page level
  - Approach yang lebih clean: di `src/app/engagement-rings/page.tsx`, panggil `fetchAllRings()` + `getAllRingPreferences()` secara parallel, lalu merge di page level
  - Pilih approach yang paling minimal perubahan

  **Must NOT do**:
  - JANGAN ubah `mapToRing()` function signature (breaking change)
  - JANGAN ubah `ringRelations` query string
  - JANGAN ubah existing Ring type interface (extend only jika perlu)

  **Recommended Agent Profile**:
  - **Category**: `quick`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES (with Tasks 7, 9)
  - **Parallel Group**: Wave 3
  - **Blocks**: Task 10
  - **Blocked By**: Task 6

  **References**:
  **Pattern References**:
  - `src/lib/supabase-rings.ts:116-140` — `fetchAllRings()` current implementation
  - `src/lib/supabase-rings.ts:142-165` — `fetchRingBySlug()` current implementation
  - `src/app/engagement-rings/page.tsx` — Server component that calls fetchAllRings()
  - `src/lib/ring-preferences.ts` (Task 2) — `getAllRingPreferences()` function to call

  **QA Scenarios (MANDATORY):**
  ```
  Scenario: Preferences merged with ring data on listing page
    Tool: Playwright
    Preconditions: At least 1 ring has preferences in DB
    Steps:
      1. Navigate to /engagement-rings
      2. Find the ring that has DB preferences
      3. Inspect DOM: ring-card should have data attributes or props indicating DB preference is active
      4. Hover the card
      5. Assert: hover image matches DB preference
    Expected Result: Ring listing page uses DB preferences
    Evidence: .sisyphus/evidence/task-8-merged-preferences.png
  ```

  **Commit**: YES
  - Message: `feat(rings): fetch and merge image preferences from DB`
  - Files: `src/lib/supabase-rings.ts` or `src/app/engagement-rings/page.tsx`
  - Pre-commit: `npm run build`

- [x] 9. Seed Script: Migrasi `ring-hover-box-map.json` → DB

  **What to do**:
  - Buat `scripts/seed-ring-preferences.ts`
  - Baca `src/data/ring-hover-box-map.json` → untuk setiap entry, insert ke `ring_image_preferences`:
    - `ring_slug` = key dari JSON (e.g., `ring-adelyn`)
    - `color` = sub-key (e.g., `yellow`, `white`, `rose`)
    - `hover_url` = value (the URL)
    - `thumbnail_url` = NULL (biarkan frontend pakai logic existing)
  - Juga migrate `MANUAL_HOVER_OVERRIDES` dari `ring-card.tsx`:
    - `ring-allison` yellow/white/rose hover URLs
    - `ring-alexia` yellow/white/rose hover URLs
  - Script harus IDEMPOTENT: gunakan upsert (ON CONFLICT DO UPDATE)
  - Gunakan Supabase client langsung dengan service role key dari env
  - Output: log berapa rows inserted/updated

  **Must NOT do**:
  - JANGAN hapus `ring-hover-box-map.json` setelah seed (tetap sebagai fallback)
  - JANGAN hardcode Supabase URL/key (baca dari env)

  **Recommended Agent Profile**:
  - **Category**: `quick`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES (with Tasks 7, 8)
  - **Parallel Group**: Wave 3
  - **Blocks**: Task 10
  - **Blocked By**: Task 1

  **References**:
  **Pattern References**:
  - `src/data/ring-hover-box-map.json` — Source data: `{ "ring-adelyn": { "rose": "https://...", "white": "https://..." }, ... }`
  - `src/components/engagement-rings/ring-card.tsx:15-30` — `MANUAL_HOVER_OVERRIDES` object to also migrate
  - `scripts/generate-seed-sql.mjs` — Existing seed script pattern (Node/ESM). Follow similar approach.

  **QA Scenarios (MANDATORY):**
  ```
  Scenario: Seed script populates DB from JSON
    Tool: Bash
    Steps:
      1. Run: npx tsx scripts/seed-ring-preferences.ts
      2. Assert: Script outputs row count (e.g., "Seeded 425 preferences")
      3. Run SQL: SELECT COUNT(*) FROM ring_image_preferences
      4. Assert: Count > 400 (225 rings * ~2-3 colors each)
      5. Run SQL: SELECT * FROM ring_image_preferences WHERE ring_slug = 'ring-allison'
      6. Assert: 3 rows (yellow, white, rose) with hover_url matching MANUAL_HOVER_OVERRIDES values
    Expected Result: JSON + overrides migrated to DB
    Evidence: .sisyphus/evidence/task-9-seed-output.txt

  Scenario: Script is idempotent
    Tool: Bash
    Steps:
      1. Run seed script twice
      2. Assert: No duplicate key errors
      3. SELECT COUNT(*) — same count as before
    Expected Result: Second run doesn't create duplicates
    Evidence: .sisyphus/evidence/task-9-idempotent.txt
  ```

  **Commit**: YES
  - Message: `chore(scripts): add seed script for ring image preferences`
  - Files: `scripts/seed-ring-preferences.ts`

- [x] 10. Build + Integration Test + Visual QA

  **What to do**:
  - Run `npm run build` — must pass with zero errors
  - Run `npm run test` — all existing tests pass + any new tests
  - Run seed script to populate DB
  - Start dev server
  - Full end-to-end flow via Playwright:
    1. Login to dashboard
    2. Navigate to Engagement Rings tab
    3. Search for "allison"
    4. Open ring-allison
    5. View images per color (Yellow/White/Rose tabs)
    6. Set a different thumbnail for yellow
    7. Set a different hover for yellow
    8. Save
    9. Navigate to /engagement-rings (public listing)
    10. Find ring-allison card → hover → verify new hover image
    11. Verify old fallback rings still work (ring without preferences)
  - Capture evidence for each step

  **Must NOT do**:
  - JANGAN skip any verification step

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: [`playwright`]

  **Parallelization**:
  - **Can Run In Parallel**: NO (depends on everything)
  - **Parallel Group**: Wave 4 (solo)
  - **Blocks**: F1-F4
  - **Blocked By**: Tasks 7, 8, 9

  **QA Scenarios (MANDATORY):**
  ```
  Scenario: Full E2E flow — dashboard to public listing
    Tool: Playwright
    Steps:
      1-11 as described above
    Expected Result: Complete flow works end-to-end
    Evidence: .sisyphus/evidence/task-10-e2e-flow/*.png (multiple screenshots)

  Scenario: Build and test pass
    Tool: Bash
    Steps:
      1. npm run build → assert exit 0
      2. npm run test → assert all pass
    Expected Result: Zero build errors, all tests pass
    Evidence: .sisyphus/evidence/task-10-build-test.txt
  ```

  **Commit**: YES
  - Message: `test: verify ring image management E2E`
  - Files: evidence files
  - Pre-commit: `npm run build && npm run test`

---

## Final Verification Wave (MANDATORY — after ALL implementation tasks)

> 4 review agents run in PARALLEL. ALL must APPROVE. Rejection → fix → re-run.

- [x] F1. **Plan Compliance Audit** — `oracle`
  Read the plan end-to-end. For each "Must Have": verify implementation exists (read file, curl endpoint, run command). For each "Must NOT Have": search codebase for forbidden patterns — reject with file:line if found. Check evidence files exist in .sisyphus/evidence/. Compare deliverables against plan.
  Output: `Must Have [N/N] | Must NOT Have [N/N] | Tasks [N/N] | VERDICT: APPROVE/REJECT`

- [x] F2. **Code Quality Review** — `unspecified-high`
  Run `tsc --noEmit` + linter + `npm run test`. Review all changed files for: `as any`/`@ts-ignore`, empty catches, console.log in prod, commented-out code, unused imports. Check AI slop: excessive comments, over-abstraction, generic names (data/result/item/temp).
  Output: `Build [PASS/FAIL] | Lint [PASS/FAIL] | Tests [N pass/N fail] | Files [N clean/N issues] | VERDICT`

- [x] F3. **Real Manual QA** — `unspecified-high` (+ `playwright` skill)
  Start from clean state. Open dashboard, login, navigate to Engagement Rings tab. Test: search ring, open ring, view images per color, set thumbnail, set hover, upload new image, delete image, reorder, save. Verify ring listing page reflects changes. Save screenshots to `.sisyphus/evidence/final-qa/`.
  Output: `Scenarios [N/N pass] | Integration [N/N] | Edge Cases [N tested] | VERDICT`

- [x] F4. **Scope Fidelity Check** — `deep`
  For each task: read "What to do", read actual diff (git log/diff). Verify 1:1 — everything in spec was built (no missing), nothing beyond spec was built (no creep). Check "Must NOT do" compliance. Detect cross-task contamination: Task N touching Task M's files. Flag unaccounted changes.
  Output: `Tasks [N/N compliant] | Contamination [CLEAN/N issues] | Unaccounted [CLEAN/N files] | VERDICT`

---

## Commit Strategy

- **Wave 1**: `feat(db): add ring_image_preferences table and migration` — migration file
- **Wave 1**: `feat(api): add ring preferences and image management API routes` — api routes + lib
- **Wave 2**: `feat(dashboard): add engagement rings image management components` — components
- **Wave 2**: `refactor(ring-card): read preferences from DB with JSON fallback` — ring-card update
- **Wave 3**: `feat(dashboard): integrate engagement rings tab` — page.tsx + supabase-rings update
- **Wave 3**: `chore(scripts): add seed script for ring image preferences` — seed script
- **Wave 4**: `test: add integration tests for ring image management` — tests

---

## Success Criteria

### Verification Commands
```bash
npm run build          # Expected: ✓ Compiled successfully
npm run test           # Expected: all tests pass
curl http://localhost:3000/api/rings/preferences  # Expected: 401 Unauthorized
curl http://localhost:3000/api/rings/preferences -H "Cookie: admin_session=authenticated"  # Expected: 200 with data
```

### Final Checklist
- [ ] All "Must Have" present
- [ ] All "Must NOT Have" absent
- [ ] All tests pass
- [ ] Dashboard tab functional
- [ ] Preferences persist in DB
- [ ] Fallback chain intact (JSON still works if DB empty)
- [ ] Upload/delete/reorder functional
- [ ] Auth on all API routes
