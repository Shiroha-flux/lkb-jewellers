# Ring QC Remediation Plan (Data, Filters, UI Cleanup)

## TL;DR

> **Quick Summary**: Remediasi berdasarkan QC dokumen 15-halaman — memperbaiki filter options (metal 8-opsi, clarity order, carat range, ring size F-Z), menghapus price text dan opsi Moissanite, memperbaiki shape misclassification di static data, dan menambah clarity education + ring size converter sections. Image-related issues (hover + default thumbnail) di-skip dari plan ini — akan dikerjakan terpisah setelah AI image generation.
> 
> **Deliverables**:
> - Filter metal expanded ke 8 opsi (9K Y/W/R, 18K Y/W/R, PT, PD)
> - Clarity order dikoreksi + tambah SI1, SI2, FL
> - Carat range tambah bucket 5.00+
> - Ring size range diperluas ke F–Z
> - Price text "Starting $X,XXX USD" dihapus dari semua card
> - Opsi Moissanite dihapus dari konfigurator
> - Shape misclassification diperbaiki (Sofia → Marquise, dll.)
> - Clarity education section ditambah di detail page
> - Ring size converter section ditambah di detail page
> 
> **Estimated Effort**: Medium
> **Parallel Execution**: YES — 3 waves
> **Critical Path**: Task 1 (types/data) → Task 5 (metal color prefix) → Task 8 (integration smoke) → Task 9 (tests) → Final Verification

---

## Context

### Original Request
User meminta remediasi menyeluruh berdasarkan QC document (QC 1 - 9326.pdf, 15 halaman) yang mendokumentasikan bug pada halaman engagement rings listing & detail. Ditambah dua request eksplisit: (1) hapus price "Starting $1,500 USD" dari ring card, (2) hapus opsi Moissanite dari konfigurator.

### Interview Summary
**Key Discussions**:
- Metal filter harus expand dari 4 ke 8 opsi; 9K dan 18K mirror by color family (render image sama)
- Banyak ring salah shape category di static data (round muncul di filter lain, dll.)
- Clarity options kurang SI1, SI2, FL; urutan harus ascending quality
- Ring size harus F–Z, bukan D–S
- Carat range perlu bucket "5.00+"
- Detail page perlu tambah clarity education + ring size converter sections
- Price dihapus karena "Starting at $1,500 USD" menyesatkan
- Moissanite dihapus dari side stone options

**Scope Decisions (Session 2)**:
- **SKIP: Hover image fix** — semua hover task di-skip. Image akan di-generate pakai AI nanti, dikerjakan terpisah.
- **SKIP: Default thumbnail fix** — semua default image yang salah juga di-skip. Image-related issues dikerjakan terpisah.
- **TETAP**: Semua data/filter/UI cleanup issues.

**Research Findings**:
- `filterRings()` di `src/lib/ring-filters.ts` TIDAK memfilter berdasarkan metal (silently ignores)
- Metal filter hanya swap image URL di UI — bukan filter DB
- `METAL_COLOR_PREFIX` di `ring-listing-card.tsx` dan `metalToColorKey()` di `ring-detail-content.tsx` harus update atomik
- `MetalValue` type change cascades ke 3 files: `ring-filters.ts`, `ring-listing-card.tsx`, `engagement-rings-content.tsx`
- Static gemstone data tidak punya SI1/SI2/FL entries — selecting them returns 0 results
- Palladium perlu mapping color prefix ke `'white'`

### Metis Review
**Identified Gaps** (addressed):
- Metal filter is UI-only (image swap, not DB filter) — plan treats it as visual mapping only
- Palladium has no color prefix — mapped to `'white'` same as platinum
- SI1/SI2/FL clarity won't have matching gemstones — noted, acceptable for now
- Ring shape reclassification needs exact ring-to-shape mapping — itemized in task
- 9K variants share same images as 18K by color — no new image URLs needed

---

## Work Objectives

### Core Objective
Memperbaiki semua non-image bug yang ditemukan di QC document, plus menghapus price text dan opsi Moissanite, sehingga data layer dan UI text/filter berfungsi sesuai spec.

### Concrete Deliverables
- `src/data/ring-filters.ts` — MetalValue type + metalOptions expanded to 8
- `src/data/engagement-rings.ts` — RING_METAL_OPTIONS expanded, RING_SIDE_STONE_OPTIONS tanpa Moissanite, RING_SIZES F-Z, shape corrections
- `src/data/gemstone-options.ts` — clarityOptions reordered + SI1/SI2/FL added, caratRanges + 5.00+ bucket
- `src/components/engagement-rings/ring-card.tsx` — price text removed
- `src/components/engagement-rings/ring-listing-card.tsx` — price text removed, METAL_COLOR_PREFIX updated
- `src/components/engagement-rings/ring-configurator.tsx` — Moissanite removed (auto via data change)
- `src/components/engagement-rings/ring-detail-content.tsx` — metalToColorKey updated, clarity education section, ring size converter section
- `src/components/engagement-rings/engagement-rings-content.tsx` — FILTER_LABEL_MAP auto-updates via data import

### Definition of Done
- [ ] All 8 metal options visible in filter bar
- [ ] Clarity options show SI1, SI2, VS1, VS2, VVS1, VVS2, IF, FL in correct order
- [ ] Carat range includes "5.00+" bucket
- [ ] Ring size options show F through Z
- [ ] No price text visible on any ring card
- [ ] No Moissanite option visible in configurator
- [ ] All rings appear under correct shape filter
- [ ] Clarity education section visible on detail page
- [ ] Ring size converter section visible on detail page
- [ ] `bun run build` passes with zero errors

### Must Have
- 8 metal filter options with correct labels (9K Yellow Gold, 9K White Gold, 9K Rose Gold, 18K Yellow Gold, 18K White Gold, 18K Rose Gold, Platinum, Palladium)
- Clarity in ascending quality order: SI1, SI2, VS1, VS2, VVS1, VVS2, IF, FL
- Ring size F–Z (remove D, E from current list)
- Carat range includes 5.00+ bucket
- Price text completely removed from both card components
- Moissanite completely removed from side stone options
- Sofia ring moved to Marquise shape
- All QC-flagged shape misclassifications fixed
- Clarity education section on detail page
- Ring size converter section on detail page

### Must NOT Have (Guardrails)
- NO modifications to Navbar, Footer, AppShell, AuthContext, CartContext
- NO modifications to globals.css or tailwind config
- NO `text-gold` class (overridden to white) — use `text-[#D4AF37]` hardcoded
- NO new npm dependencies
- NO changes to Supabase schema or API routes (shape corrections are static data only)
- NO new image assets — image fixes are OUT OF SCOPE for this plan
- NO removal of the `formatPrice` function itself (other pages may use it)
- NO hover behavior changes — hover fixes are OUT OF SCOPE for this plan
- NO default thumbnail image changes — image fixes are OUT OF SCOPE for this plan
- JANGAN mengubah filter logic dari image-swap ke DB filter — metal filter tetap UI-only

---

## Verification Strategy (MANDATORY)

> **ZERO HUMAN INTERVENTION** — ALL verification is agent-executed. No exceptions.

### Test Decision
- **Infrastructure exists**: YES (bun test, `src/__tests__/ring-filters.test.ts` exists)
- **Automated tests**: YES (Tests-after) — add/update tests for changed data + filter logic
- **Framework**: bun test

### QA Policy
Every task MUST include agent-executed QA scenarios.
Evidence saved to `.sisyphus/evidence/task-{N}-{scenario-slug}.{ext}`.

- **Frontend/UI**: Use Playwright — Navigate, interact, assert DOM, screenshot
- **Data/Types**: Use Bash (bun/tsc) — Type check, import validation
- **Build**: Use Bash — `bun run build` must pass

---

## Execution Strategy

### Parallel Execution Waves

```
Wave 1 (Start Immediately — data layer, 5 parallel):
├── Task 1: MetalValue type expansion + metal options data [quick]
├── Task 2: Gemstone options update (clarity reorder + SI1/SI2/FL, carat 5.00+) [quick]
├── Task 3: Ring sizes F-Z + Moissanite removal [quick]
├── Task 4: Ring shape reclassification in static data [unspecified-high]
├── Task 5: Price text removal from both card components [quick]

Wave 2 (After Wave 1 — component updates + detail page, 4 parallel):
├── Task 6: Metal color prefix + metalToColorKey update [quick]
├── Task 7: Clarity education section on detail page [visual-engineering]
├── Task 8: Ring size converter section on detail page [visual-engineering]

Wave 3 (After Wave 2 — tests + build verification, 2 parallel):
├── Task 9: Update/add unit tests for changed data + filters [quick]
├── Task 10: Build verification + type check [quick]

Wave FINAL (After ALL tasks — independent review, 4 parallel):
├── Task F1: Plan compliance audit (oracle)
├── Task F2: Code quality review (unspecified-high)
├── Task F3: Real manual QA via Playwright (unspecified-high)
├── Task F4: Scope fidelity check (deep)

Critical Path: Task 1 → Task 6 → Task 10 → F1-F4
Parallel Speedup: ~60% faster than sequential
Max Concurrent: 5 (Wave 1)
```

### Dependency Matrix

| Task | Depends On | Blocks |
|------|-----------|--------|
| 1 | — | 6, 9, 10 |
| 2 | — | 7, 9, 10 |
| 3 | — | 8, 9, 10 |
| 4 | — | 9, 10 |
| 5 | — | 10 |
| 6 | 1 | 10 |
| 7 | 2 | 10 |
| 8 | 3 | 10 |
| 9 | 1, 2, 3, 4 | 10 |
| 10 | 5-9 | F1-F4 |
| F1-F4 | 10 | — |

### Agent Dispatch Summary

- **Wave 1**: **5 tasks** — T1 → `quick`, T2 → `quick`, T3 → `quick`, T4 → `unspecified-high`, T5 → `quick`
- **Wave 2**: **3 tasks** — T6 → `quick`, T7 → `visual-engineering`, T8 → `visual-engineering`
- **Wave 3**: **2 tasks** — T9 → `quick`, T10 → `quick`
- **FINAL**: **4 tasks** — F1 → `oracle`, F2 → `unspecified-high`, F3 → `unspecified-high`, F4 → `deep`

---

## TODOs

- [x] 1. MetalValue Type Expansion + Metal Options Data

  **What to do**:
  - Expand `MetalValue` union type in `src/data/ring-filters.ts` from 4 to 8 values:
    - Current: `'platinum' | 'yellow_gold' | 'rose_gold' | 'white_gold'`
    - New: add `'9k_yellow_gold' | '9k_white_gold' | '9k_rose_gold' | 'palladium'`
  - Add 4 new entries to `metalOptions` array in same file:
    - `{ value: '9k_yellow_gold', label: '9K Yellow Gold', description: 'Classic warm gold in 9k purity', color: '#D4AF37' }`
    - `{ value: '9k_white_gold', label: '9K White Gold', description: 'Bright white 9k gold', color: '#D0D0D0' }`
    - `{ value: '9k_rose_gold', label: '9K Rose Gold', description: 'Romantic blush-toned 9k gold', color: '#B76E79' }`
    - `{ value: 'palladium', label: 'Palladium', description: 'Lightweight, hypoallergenic white metal', color: '#CED0CE' }`
  - Update `RING_METAL_OPTIONS` in `src/data/engagement-rings.ts` to include all 8 labels:
    - `['Platinum', 'Palladium', '18k Yellow Gold', '18k Rose Gold', '18k White Gold', '9k Yellow Gold', '9k Rose Gold', '9k White Gold']`

  **Must NOT do**:
  - DO NOT change `filterRings()` logic — metal filter stays as image-swap only
  - DO NOT add new image URLs or modify any image references
  - DO NOT modify Supabase schema

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Straightforward data additions to 2 files, no complex logic
  - **Skills**: `[]`
  - **Skills Evaluated but Omitted**:
    - `shadcn-ui`: No UI component work in this task

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 2, 3, 4, 5)
  - **Blocks**: Tasks 6, 9, 10
  - **Blocked By**: None (can start immediately)

  **References**:

  **Pattern References**:
  - `src/data/ring-filters.ts:5` — Current `MetalValue` type definition (line 5)
  - `src/data/ring-filters.ts:95-120` — Current `metalOptions` array with 4 entries (follow exact same structure)
  - `src/data/ring-filters.ts:21-24` — `MetalOption` interface showing required fields: `value`, `label`, `description?`, `color`, `secondaryColor?`

  **API/Type References**:
  - `src/data/engagement-rings.ts:31-36` — Current `RING_METAL_OPTIONS` const array

  **WHY Each Reference Matters**:
  - `ring-filters.ts:5`: This is the union type — add new values here. All consumers import from this file.
  - `ring-filters.ts:95-120`: Follow exact object shape (value, label, description, color) for new entries.
  - `engagement-rings.ts:31-36`: This const is used by `ring-configurator.tsx` to render metal pills — must have all 8 labels.

  **Acceptance Criteria**:

  - [ ] `MetalValue` type has 8 members
  - [ ] `metalOptions` array has 8 entries with correct labels/colors
  - [ ] `RING_METAL_OPTIONS` has 8 labels
  - [ ] `bunx tsc --noEmit` passes with zero errors

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: MetalValue type accepts all 8 values
    Tool: Bash (bunx tsc --noEmit)
    Preconditions: Tasks 1 changes applied
    Steps:
      1. Run `bunx tsc --noEmit` from project root
      2. Check exit code is 0
    Expected Result: Zero type errors, exit code 0
    Failure Indicators: Type error mentioning MetalValue, or "not assignable to type"
    Evidence: .sisyphus/evidence/task-1-tsc-check.txt

  Scenario: metalOptions array has exactly 8 entries
    Tool: Bash (bun)
    Preconditions: File saved
    Steps:
      1. Run: `bun -e "const { metalOptions } = require('./src/data/ring-filters'); console.log('count:', metalOptions.length); metalOptions.forEach(o => console.log(o.value, o.label))"`
      2. Assert output shows count: 8
      3. Assert all 8 values present: platinum, palladium, yellow_gold, rose_gold, white_gold, 9k_yellow_gold, 9k_white_gold, 9k_rose_gold
    Expected Result: 8 entries, all values listed
    Failure Indicators: count !== 8, missing values
    Evidence: .sisyphus/evidence/task-1-metal-options-count.txt
  ```

  **Commit**: YES (groups with Task 6)
  - Message: `fix(data): expand MetalValue to 8 options with color prefix mapping`
  - Files: `src/data/ring-filters.ts`, `src/data/engagement-rings.ts`
  - Pre-commit: `bunx tsc --noEmit`

- [x] 2. Gemstone Options Update (Clarity Reorder + SI1/SI2/FL, Carat 5.00+)

  **What to do**:
  - Reorder `clarityOptions` in `src/data/gemstone-options.ts` to ascending quality:
    ```
    SI1, SI2, VS1, VS2, VVS1, VVS2, IF, FL
    ```
  - Add 3 missing clarity entries:
    - `{ value: 'SI1', label: 'SI1', description: 'Slightly Included 1 — inclusions noticeable under 10x magnification' }`
    - `{ value: 'SI2', label: 'SI2', description: 'Slightly Included 2 — inclusions easily noticeable under 10x magnification' }`
    - `{ value: 'FL', label: 'FL', description: 'Flawless — no inclusions or blemishes visible under 10x magnification' }`
  - Add carat range bucket to `caratRanges` array:
    - `{ value: '5.00+', label: '5.00ct+', minCarat: 5.00, maxCarat: 99 }`
  - Also add intermediate buckets if needed for smooth UX:
    - `{ value: '3.00-3.99', label: '3.00 – 3.99ct', minCarat: 3.00, maxCarat: 3.99 }`
    - `{ value: '4.00-4.99', label: '4.00 – 4.99ct', minCarat: 4.00, maxCarat: 4.99 }`
    - Adjust existing `3.00+` entry to `3.00-3.99` range (change maxCarat from 99 to 3.99)

  **Must NOT do**:
  - DO NOT modify the gemstone filtering logic in `src/lib/gemstone-utils.ts`
  - DO NOT add fake/dummy gemstone sample data for SI1/SI2/FL
  - DO NOT change the `GemstoneConfig` interface

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Data array reordering and additions in single file
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 3, 4, 5)
  - **Blocks**: Tasks 7, 9, 10
  - **Blocked By**: None

  **References**:

  **Pattern References**:
  - `src/data/gemstone-options.ts:70-96` — Current `clarityOptions` array (5 entries, needs reorder + 3 new)
  - `src/data/gemstone-options.ts:98-106` — Current `caratRanges` array (7 entries, last is `3.00+`)
  - `src/data/gemstone-options.ts:10-15` — `ClarityOption` interface shape

  **WHY Each Reference Matters**:
  - `gemstone-options.ts:70-96`: These are the clarity entries to reorder. Follow exact same interface shape for new SI1/SI2/FL entries.
  - `gemstone-options.ts:98-106`: Last entry `3.00+` needs adjustment. Its maxCarat=99 trick should only be on the final bucket.

  **Acceptance Criteria**:

  - [ ] `clarityOptions` has exactly 8 entries in order: SI1, SI2, VS1, VS2, VVS1, VVS2, IF, FL
  - [ ] `caratRanges` includes 5.00+ as final bucket
  - [ ] `bunx tsc --noEmit` passes

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: Clarity options in correct ascending order
    Tool: Bash (bun)
    Preconditions: File saved
    Steps:
      1. Run: `bun -e "const { clarityOptions } = require('./src/data/gemstone-options'); console.log(clarityOptions.map(o => o.value).join(', '))"`
      2. Assert output is exactly: "SI1, SI2, VS1, VS2, VVS1, VVS2, IF, FL"
    Expected Result: 8 clarity values in ascending quality order
    Failure Indicators: Wrong order, missing values, or extra values
    Evidence: .sisyphus/evidence/task-2-clarity-order.txt

  Scenario: Carat ranges include 5.00+ bucket
    Tool: Bash (bun)
    Preconditions: File saved
    Steps:
      1. Run: `bun -e "const { caratRanges } = require('./src/data/gemstone-options'); console.log(caratRanges.map(o => o.value).join(', ')); console.log('last:', caratRanges[caratRanges.length-1].value, caratRanges[caratRanges.length-1].maxCarat)"`
      2. Assert last entry value is "5.00+" with maxCarat=99
    Expected Result: "5.00+" is the last bucket
    Failure Indicators: Missing 5.00+ bucket, or 3.00+ still has maxCarat=99
    Evidence: .sisyphus/evidence/task-2-carat-ranges.txt
  ```

  **Commit**: YES
  - Message: `fix(data): reorder clarity options, add SI1/SI2/FL, add 5.00+ carat`
  - Files: `src/data/gemstone-options.ts`
  - Pre-commit: `bunx tsc --noEmit`

- [x] 3. Ring Sizes F-Z + Moissanite Removal

  **What to do**:
  - Update `RING_SIZES` in `src/data/engagement-rings.ts`:
    - Current: `['D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S']`
    - New: `['F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']`
    - Remove D and E, add T through Z
  - Remove `'Moissanite'` from `RING_SIDE_STONE_OPTIONS` in same file:
    - Current: `['Lab Grown Diamond', 'Moissanite', 'Natural Diamond']`
    - New: `['Lab Grown Diamond', 'Natural Diamond']`

  **Must NOT do**:
  - DO NOT modify `ring-configurator.tsx` — it reads from these consts, so removal is automatic
  - DO NOT change the `as const` assertion on these arrays

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Two simple array edits in one file
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 2, 4, 5)
  - **Blocks**: Tasks 8, 9, 10
  - **Blocked By**: None

  **References**:

  **Pattern References**:
  - `src/data/engagement-rings.ts:40-44` — `RING_SIDE_STONE_OPTIONS` array (remove 'Moissanite')
  - `src/data/engagement-rings.ts:46-49` — `RING_SIZES` array (replace with F-Z)

  **Consumer References**:
  - `src/components/engagement-rings/ring-configurator.tsx:153` — Iterates `RING_SIDE_STONE_OPTIONS` (auto-updates)
  - `src/components/engagement-rings/ring-configurator.tsx:201` — Iterates `RING_SIZES` (auto-updates)

  **WHY Each Reference Matters**:
  - `engagement-rings.ts:40-44`: Remove the middle entry 'Moissanite'. Keep `as const`.
  - `engagement-rings.ts:46-49`: Replace entire array contents. Keep `as const`.
  - `ring-configurator.tsx`: No changes needed — it maps over these arrays, so UI updates automatically.

  **Acceptance Criteria**:

  - [ ] `RING_SIZES` starts with 'F' and ends with 'Z' (21 entries)
  - [ ] `RING_SIDE_STONE_OPTIONS` has exactly 2 entries: 'Lab Grown Diamond', 'Natural Diamond'
  - [ ] No reference to 'Moissanite' in `RING_SIDE_STONE_OPTIONS`
  - [ ] `bunx tsc --noEmit` passes

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: Ring sizes are F through Z
    Tool: Bash (bun)
    Preconditions: File saved
    Steps:
      1. Run: `bun -e "const { RING_SIZES } = require('./src/data/engagement-rings'); console.log('first:', RING_SIZES[0], 'last:', RING_SIZES[RING_SIZES.length-1], 'count:', RING_SIZES.length)"`
      2. Assert first='F', last='Z', count=21
    Expected Result: F to Z, 21 sizes
    Failure Indicators: D or E present, missing T-Z, count !== 21
    Evidence: .sisyphus/evidence/task-3-ring-sizes.txt

  Scenario: Moissanite completely removed
    Tool: Bash (grep)
    Preconditions: File saved
    Steps:
      1. Run: `grep -n "Moissanite" src/data/engagement-rings.ts`
      2. Assert zero matches (exit code 1)
    Expected Result: No matches found
    Failure Indicators: Any line containing 'Moissanite'
    Evidence: .sisyphus/evidence/task-3-no-moissanite.txt
  ```

  **Commit**: YES
  - Message: `fix(data): extend ring sizes F-Z, remove Moissanite option`
  - Files: `src/data/engagement-rings.ts`
  - Pre-commit: `bunx tsc --noEmit`

- [x] 4. Ring Shape Reclassification in Static Data

  **What to do**:
  - In `src/data/engagement-rings.ts`, find and update the `shape` field for misclassified rings.
  - QC document identified these rings as appearing under WRONG shape filters:
    - **Sofia** (`ring-sofia`): Currently `round` → change to `marquise`
    - **Ainsley** (`ring-ainsley`): Verify current shape, reclassify if wrong per QC
    - **Brooke** (`ring-brooke`): Verify and reclassify if needed
    - **Brooklyn** (`ring-brooklyn`): Verify and reclassify if needed
    - **Blair** (`ring-blair`): Verify and reclassify if needed
    - **Kyla** (`ring-kyla`): Verify and reclassify if needed
    - **Jacinta** (`ring-jacinta`): Verify and reclassify if needed
    - **Briana** (`ring-briana`): Verify and reclassify if needed
    - **Miller** (`ring-miller`): Verify and reclassify if needed
    - **Parker** (`ring-parker`): Verify and reclassify if needed
    - **Polly** (`ring-polly`): Verify and reclassify if needed
    - **Raleigh** (`ring-raleigh`): Verify and reclassify if needed
    - **Willow** (`ring-willow`): Verify and reclassify if needed
  - For each ring above: read its `title` and `description` fields which contain the actual shape name (e.g., "Pear 4 Claw..." means shape should be `pear`). Use the title as the source of truth.
  - Cross-reference: the title format is `"{Name} - {Shape} {Claws} {Style}..."` — extract the shape word after the dash.

  **Must NOT do**:
  - DO NOT change any field other than `shape`
  - DO NOT modify rings not listed above
  - DO NOT change Supabase data — this is static data only

  **Recommended Agent Profile**:
  - **Category**: `unspecified-high`
    - Reason: Needs careful cross-referencing of 13+ rings' titles against shape values in a 6000+ line file
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 2, 3, 5)
  - **Blocks**: Tasks 9, 10
  - **Blocked By**: None

  **References**:

  **Pattern References**:
  - `src/data/engagement-rings.ts:52-100` — Example ring entry showing structure (id, slug, name, title, shape)
  - `src/data/engagement-rings.ts:25` — Valid shape values: `'round' | 'oval' | 'emerald' | 'radiant' | 'pear' | 'cushion' | 'elongated_cushion' | 'elongated_hexagon' | 'marquise' | 'princess' | 'asscher' | 'heart'`

  **WHY Each Reference Matters**:
  - `engagement-rings.ts:52-100`: Shows how each ring entry is structured. The `title` field contains the actual shape name.
  - `engagement-rings.ts:25`: Valid values for the `shape` field. Must use one of these exact strings.

  **Acceptance Criteria**:

  - [ ] Sofia's shape is `'marquise'`
  - [ ] All 13 listed rings have shape matching their title description
  - [ ] No ring title says "Round" but has shape `'pear'` (or any mismatch)
  - [ ] `bunx tsc --noEmit` passes

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: Sofia is classified as marquise
    Tool: Bash (grep)
    Preconditions: File saved
    Steps:
      1. Run: `grep -A 20 '"ring-sofia"' src/data/engagement-rings.ts | grep '"shape"'`
      2. Assert output contains: "marquise"
    Expected Result: shape: "marquise"
    Failure Indicators: shape is "round" or anything other than "marquise"
    Evidence: .sisyphus/evidence/task-4-sofia-shape.txt

  Scenario: No shape-title mismatches for reclassified rings
    Tool: Bash (bun script)
    Preconditions: File saved
    Steps:
      1. Write a quick validation script that for each ring in the list, extracts the shape word from title (word after " - ") and compares to shape field
      2. Run the script
      3. Assert zero mismatches
    Expected Result: All listed rings have matching title and shape
    Failure Indicators: Any mismatch found
    Evidence: .sisyphus/evidence/task-4-shape-validation.txt
  ```

  **Commit**: YES
  - Message: `fix(data): reclassify ring shapes per QC audit`
  - Files: `src/data/engagement-rings.ts`
  - Pre-commit: `bunx tsc --noEmit`

- [x] 5. Price Text Removal from Both Card Components

  **What to do**:
  - In `src/components/engagement-rings/ring-card.tsx` (line 279-281): Remove the entire `<p>` element showing price:
    ```tsx
    // REMOVE THIS:
    <p className="text-[#D4AF37] text-sm font-medium uppercase tracking-widest">
      Starting {formatPrice(ring.basePrice, ring.currency)} {ring.currency}
    </p>
    ```
  - In `src/components/engagement-rings/ring-listing-card.tsx` (line 157-159): Remove the same `<p>` element:
    ```tsx
    // REMOVE THIS:
    <p className="text-[#D4AF37] text-sm font-medium uppercase tracking-widest">
      Starting {formatPrice(ring.basePrice, ring.currency)} {ring.currency}
    </p>
    ```
  - Keep the `formatPrice` function in both files — do NOT remove it (may be used elsewhere or in future)
  - Keep the `<div className="p-3">` wrapper and the `<h3>` name element intact

  **Must NOT do**:
  - DO NOT remove the `formatPrice` function definition
  - DO NOT remove the `basePrice` or `currency` fields from Ring interface
  - DO NOT modify the card layout or spacing beyond removing the price line

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Two simple line deletions in two files
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 2, 3, 4)
  - **Blocks**: Task 10
  - **Blocked By**: None

  **References**:

  **Pattern References**:
  - `src/components/engagement-rings/ring-card.tsx:279-281` — Price `<p>` to remove
  - `src/components/engagement-rings/ring-listing-card.tsx:157-159` — Price `<p>` to remove
  - `src/components/engagement-rings/ring-card.tsx:274-282` — Surrounding `<div className="p-3">` context (keep this)
  - `src/components/engagement-rings/ring-listing-card.tsx:153-160` — Surrounding context (keep this)

  **WHY Each Reference Matters**:
  - Lines 279-281 and 157-159: These are the exact lines to delete. The `<p>` with gold text showing "Starting $1,500 USD".
  - Surrounding context: The `<div className="p-3">` and `<h3>` must remain — only the `<p>` goes.

  **Acceptance Criteria**:

  - [ ] No `Starting` price text in `ring-card.tsx`
  - [ ] No `Starting` price text in `ring-listing-card.tsx`
  - [ ] `formatPrice` function still exists in both files
  - [ ] `bunx tsc --noEmit` passes

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: No price text in ring-card.tsx
    Tool: Bash (grep)
    Preconditions: File saved
    Steps:
      1. Run: `grep -n "Starting" src/components/engagement-rings/ring-card.tsx`
      2. Assert zero matches (exit code 1)
    Expected Result: No "Starting" text found
    Failure Indicators: Any line matching "Starting"
    Evidence: .sisyphus/evidence/task-5-no-price-ring-card.txt

  Scenario: No price text in ring-listing-card.tsx
    Tool: Bash (grep)
    Preconditions: File saved
    Steps:
      1. Run: `grep -n "Starting" src/components/engagement-rings/ring-listing-card.tsx`
      2. Assert zero matches (exit code 1)
    Expected Result: No "Starting" text found
    Failure Indicators: Any line matching "Starting"
    Evidence: .sisyphus/evidence/task-5-no-price-listing-card.txt

  Scenario: formatPrice function still exists
    Tool: Bash (grep)
    Preconditions: File saved
    Steps:
      1. Run: `grep -n "formatPrice" src/components/engagement-rings/ring-card.tsx`
      2. Assert at least 1 match (the function definition)
    Expected Result: formatPrice function definition found
    Failure Indicators: Zero matches — function was accidentally deleted
    Evidence: .sisyphus/evidence/task-5-formatprice-exists.txt
  ```

  **Commit**: YES
  - Message: `fix(ui): remove price text from ring cards`
  - Files: `src/components/engagement-rings/ring-card.tsx`, `src/components/engagement-rings/ring-listing-card.tsx`
  - Pre-commit: `bunx tsc --noEmit`

- [x] 6. Metal Color Prefix + metalToColorKey Update

  **What to do**:
  - Update `METAL_COLOR_PREFIX` in `src/components/engagement-rings/ring-listing-card.tsx` (line 9-14):
    - Add entries for new MetalValue variants:
    ```typescript
    const METAL_COLOR_PREFIX: Record<MetalValue, string> = {
      platinum: 'white',
      palladium: 'white',
      yellow_gold: 'yellow',
      rose_gold: 'rose',
      white_gold: 'white',
      '9k_yellow_gold': 'yellow',
      '9k_white_gold': 'white',
      '9k_rose_gold': 'rose',
    }
    ```
  - Update `metalToColorKey()` in `src/components/engagement-rings/ring-detail-content.tsx` (line 39-44):
    - Add palladium handling (maps to 'white')
    - The function already handles 9K variants via `includes('yellow')` / `includes('rose')` — verify this works for "9k Yellow Gold" etc.
    - Current logic: `if (lower.includes('yellow')) return 'yellow'` — this already catches "9k yellow gold"
    - Verify palladium falls through to `return 'white'` default — it does, since it has no 'yellow' or 'rose'
    - NO CHANGES NEEDED to `metalToColorKey()` — verify-only

  **Must NOT do**:
  - DO NOT change the `swapMetalInUrl()` function logic
  - DO NOT modify any component rendering logic

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Add 4 entries to one Record object, verify another function
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 2 (with Tasks 7, 8)
  - **Blocks**: Task 10
  - **Blocked By**: Task 1 (needs expanded MetalValue type)

  **References**:

  **Pattern References**:
  - `src/components/engagement-rings/ring-listing-card.tsx:7` — Imports `MetalValue` from ring-filters
  - `src/components/engagement-rings/ring-listing-card.tsx:9-14` — Current `METAL_COLOR_PREFIX` Record (4 entries)
  - `src/components/engagement-rings/ring-detail-content.tsx:38-44` — `metalToColorKey()` function

  **WHY Each Reference Matters**:
  - `ring-listing-card.tsx:9-14`: This Record MUST be exhaustive for MetalValue. After Task 1 adds 4 new values, TypeScript will error if this Record is incomplete.
  - `ring-detail-content.tsx:38-44`: Uses string matching, not Record lookup. Verify it handles all 8 metals correctly without changes.

  **Acceptance Criteria**:

  - [ ] `METAL_COLOR_PREFIX` has exactly 8 entries (all MetalValue variants)
  - [ ] Palladium maps to 'white'
  - [ ] 9K variants map to same color as 18K counterparts
  - [ ] `metalToColorKey()` handles all 8 RING_METAL_OPTIONS labels correctly
  - [ ] `bunx tsc --noEmit` passes (Record exhaustiveness check)

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: METAL_COLOR_PREFIX is exhaustive for MetalValue
    Tool: Bash (bunx tsc --noEmit)
    Preconditions: Task 1 and Task 6 changes applied
    Steps:
      1. Run: `bunx tsc --noEmit`
      2. Assert no errors about METAL_COLOR_PREFIX missing keys
    Expected Result: Zero type errors
    Failure Indicators: "Property 'X' is missing in type" errors
    Evidence: .sisyphus/evidence/task-6-tsc-exhaustive.txt

  Scenario: metalToColorKey handles all 8 metal labels
    Tool: Bash (bun)
    Preconditions: File saved
    Steps:
      1. Run: `bun -e "
        const metals = ['Platinum','Palladium','18k Yellow Gold','18k Rose Gold','18k White Gold','9k Yellow Gold','9k Rose Gold','9k White Gold'];
        function metalToColorKey(metal) { const l=metal.toLowerCase(); if(l.includes('yellow'))return'yellow'; if(l.includes('rose'))return'rose'; return'white'; }
        metals.forEach(m => console.log(m, '->', metalToColorKey(m)))
      "`
      2. Assert: Platinum→white, Palladium→white, Yellow→yellow, Rose→rose, White→white for both 9K and 18K
    Expected Result: All 8 metals map to correct color key
    Failure Indicators: Any unexpected mapping
    Evidence: .sisyphus/evidence/task-6-color-key-mapping.txt
  ```

  **Commit**: YES (groups with Task 1)
  - Message: `fix(data): expand MetalValue to 8 options with color prefix mapping`
  - Files: `src/components/engagement-rings/ring-listing-card.tsx`, `src/components/engagement-rings/ring-detail-content.tsx`
  - Pre-commit: `bunx tsc --noEmit`

- [x] 7. Clarity Education Section on Detail Page

  **What to do**:
  - Add a clarity education section to `src/components/engagement-rings/ring-detail-content.tsx`
  - Position: between the ring size converter area and the ring builder / configurator section
  - Content: visual/textual explanation of clarity grades from SI1 to FL
  - Design approach:
    - Section title: "Understanding Diamond Clarity"
    - Show all 8 clarity grades in order: SI1 → FL
    - Each grade shows: abbreviation, full name, brief description
    - Use existing design patterns from the detail page (same spacing, fonts, colors)
    - Use `text-[#D4AF37]` for accent color, `text-white` for headings, `text-gray-400`/`text-gray-500` for descriptions
    - Clean grid or list layout, no images needed
  - Import `clarityOptions` from `src/data/gemstone-options.ts` to render dynamically

  **Must NOT do**:
  - NO new npm dependencies
  - NO `text-gold` class
  - NO external images or assets
  - NO modifications to other sections of the detail page

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
    - Reason: UI section creation requiring design sensibility
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 2 (with Tasks 6, 8)
  - **Blocks**: Task 10
  - **Blocked By**: Task 2 (needs updated clarityOptions data)

  **References**:

  **Pattern References**:
  - `src/components/engagement-rings/ring-detail-content.tsx:18-36` — `TrustBadge` and `SpecRow` components for design pattern reference
  - `src/components/engagement-rings/ring-detail-content.tsx:60-210` — Main component layout to understand insertion point
  - `src/data/gemstone-options.ts:70-96` — `clarityOptions` array to import and map over

  **WHY Each Reference Matters**:
  - `ring-detail-content.tsx:18-36`: Follow same styling patterns (gray-400/500, zinc-800 borders, text-sm)
  - `ring-detail-content.tsx:60-210`: Understand the page layout to find correct insertion point
  - `gemstone-options.ts:70-96`: Data source — render dynamically, not hardcoded

  **Acceptance Criteria**:

  - [ ] Clarity education section visible on detail page
  - [ ] Shows all 8 clarity grades in correct order
  - [ ] Uses existing design system colors (`text-[#D4AF37]`, `text-white`, `text-gray-400`)
  - [ ] No new dependencies
  - [ ] `bunx tsc --noEmit` passes

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: Clarity education section renders on detail page
    Tool: Bash (grep)
    Preconditions: File saved
    Steps:
      1. Run: `grep -n "Understanding Diamond Clarity\|clarity.*education\|clarityOptions" src/components/engagement-rings/ring-detail-content.tsx`
      2. Assert matches found (section exists in code)
    Expected Result: Section title and clarityOptions import found
    Failure Indicators: Zero matches
    Evidence: .sisyphus/evidence/task-7-clarity-section-exists.txt

  Scenario: Clarity section renders all 8 grades
    Tool: Bash (bun build check)
    Preconditions: Tasks 2 and 7 applied
    Steps:
      1. Run: `bunx tsc --noEmit`
      2. Assert zero errors
    Expected Result: Clean type check
    Failure Indicators: Import errors or missing types
    Evidence: .sisyphus/evidence/task-7-tsc-check.txt
  ```

  **Commit**: YES (groups with Task 8)
  - Message: `feat(ui): add clarity education and ring size converter sections`
  - Files: `src/components/engagement-rings/ring-detail-content.tsx`
  - Pre-commit: `bun run build`

- [x] 8. Ring Size Converter Section on Detail Page

  **What to do**:
  - Add a ring size converter section to `src/components/engagement-rings/ring-detail-content.tsx`
  - Position: near bottom of detail page, below specs section
  - Content:
    - Section title: "Ring Size Guide"
    - UK to US/EU size conversion table (common sizes F-Z)
    - Brief instruction text about how to measure ring size
    - Link/text about complimentary resizing service
    - Use `RING_SIZES` from `src/data/engagement-rings.ts` for consistency
  - Conversion data (hardcoded is fine — standard conversion table):
    - F→3, G→3.5, H→4, I→4.5, J→5, K→5.5, L→6, M→6.5, N→7, O→7.5, P→8, Q→8.5, R→9, S→9.5, T→10, U→10.5, V→11, W→11.5, X→12, Y→12.5, Z→13

  **Must NOT do**:
  - NO external links to PDFs or downloads (keep it self-contained)
  - NO new npm dependencies
  - NO `text-gold` class
  - NO modifications to other sections

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
    - Reason: UI section creation with table/grid layout
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 2 (with Tasks 6, 7)
  - **Blocks**: Task 10
  - **Blocked By**: Task 3 (needs updated RING_SIZES)

  **References**:

  **Pattern References**:
  - `src/components/engagement-rings/ring-detail-content.tsx:29-36` — `SpecRow` component for table-like layout pattern
  - `src/components/engagement-rings/ring-configurator.tsx:196-214` — Current ring size section for context
  - `src/data/engagement-rings.ts:46-49` — `RING_SIZES` const

  **WHY Each Reference Matters**:
  - `ring-detail-content.tsx:29-36`: Reuse `SpecRow` pattern or similar for conversion rows
  - `ring-configurator.tsx:196-214`: Shows existing ring size UX with "complimentary resizing" text
  - `engagement-rings.ts:46-49`: Source of truth for available sizes

  **Acceptance Criteria**:

  - [ ] Ring size converter section visible on detail page
  - [ ] Shows UK to US conversion for all sizes F-Z
  - [ ] Mentions complimentary resizing
  - [ ] Uses consistent design (same colors, fonts as rest of page)
  - [ ] `bunx tsc --noEmit` passes

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: Ring size guide section exists in code
    Tool: Bash (grep)
    Preconditions: File saved
    Steps:
      1. Run: `grep -n "Ring Size Guide\|size.*converter\|size.*guide" src/components/engagement-rings/ring-detail-content.tsx`
      2. Assert matches found
    Expected Result: Section title found in source
    Failure Indicators: Zero matches
    Evidence: .sisyphus/evidence/task-8-size-guide-exists.txt

  Scenario: Conversion covers F through Z
    Tool: Bash (grep)
    Preconditions: File saved
    Steps:
      1. Run: `grep -c "→\|=>" src/components/engagement-rings/ring-detail-content.tsx` or check conversion data entries
      2. Assert at least 21 conversion entries present
    Expected Result: 21 size conversions (F-Z)
    Failure Indicators: Missing sizes or fewer than 21 entries
    Evidence: .sisyphus/evidence/task-8-conversion-count.txt
  ```

  **Commit**: YES (groups with Task 7)
  - Message: `feat(ui): add clarity education and ring size converter sections`
  - Files: `src/components/engagement-rings/ring-detail-content.tsx`
  - Pre-commit: `bun run build`

- [x] 9. Update/Add Unit Tests for Changed Data + Filters

  **What to do**:
  - Update existing test file `src/__tests__/ring-filters.test.ts`:
    - Fix existing test errors (tests reference `metalOptions` property on Ring which doesn't exist)
    - Add tests that verify `MetalValue` type covers all 8 options
    - Add tests that verify `metalOptions` array has 8 entries
    - Add tests that verify `filterRings()` still works correctly with shape filters
  - Add new test assertions:
    - `RING_SIZES` starts with 'F', ends with 'Z', has 21 entries
    - `RING_SIDE_STONE_OPTIONS` has exactly 2 entries, no 'Moissanite'
    - `clarityOptions` has 8 entries in correct order
    - `caratRanges` last entry is '5.00+'
    - `RING_METAL_OPTIONS` has 8 entries

  **Must NOT do**:
  - DO NOT create new test files — add to existing test file
  - DO NOT add integration/e2e tests (those are in Final Verification)

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Adding test assertions to existing file
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 3 (with Task 10)
  - **Blocks**: Task 10
  - **Blocked By**: Tasks 1, 2, 3, 4

  **References**:

  **Pattern References**:
  - `src/__tests__/ring-filters.test.ts` — Existing test file (has errors to fix)

  **WHY Each Reference Matters**:
  - `ring-filters.test.ts`: Fix existing failures first, then add new assertions. Current tests use `metalOptions` property on Ring mock which doesn't exist in the Ring interface.

  **Acceptance Criteria**:

  - [ ] All existing tests pass (fixed)
  - [ ] New data validation tests added
  - [ ] `bun test` passes with zero failures

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: All tests pass
    Tool: Bash (bun test)
    Preconditions: All data tasks (1-4) completed
    Steps:
      1. Run: `bun test`
      2. Assert exit code 0, all tests pass
    Expected Result: 0 failures
    Failure Indicators: Any test failure
    Evidence: .sisyphus/evidence/task-9-test-results.txt
  ```

  **Commit**: YES
  - Message: `test(unit): update tests for expanded data options`
  - Files: `src/__tests__/ring-filters.test.ts`
  - Pre-commit: `bun test`

- [x] 10. Build Verification + Type Check

  **What to do**:
  - Run full build pipeline to verify everything works together:
    1. `bunx tsc --noEmit` — type check
    2. `bun test` — unit tests
    3. `bun run build` — Next.js production build
  - Fix any errors that surface from the combined changes
  - This is an integration verification task — no new code unless fixing build errors

  **Must NOT do**:
  - DO NOT make feature changes — only fix build/type errors
  - DO NOT add `@ts-ignore` or `as any` to suppress errors

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Build verification, fix-only if needed
  - **Skills**: `[]`

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Sequential (after Wave 2)
  - **Blocks**: F1-F4
  - **Blocked By**: Tasks 5-9

  **References**:

  **All changed files from Tasks 1-9**

  **Acceptance Criteria**:

  - [ ] `bunx tsc --noEmit` exits with code 0
  - [ ] `bun test` exits with code 0
  - [ ] `bun run build` exits with code 0

  **QA Scenarios (MANDATORY):**

  ```
  Scenario: Full build pipeline passes
    Tool: Bash
    Preconditions: All tasks 1-9 completed
    Steps:
      1. Run: `bunx tsc --noEmit`
      2. Assert exit code 0
      3. Run: `bun test`
      4. Assert exit code 0
      5. Run: `bun run build`
      6. Assert exit code 0
    Expected Result: All three commands succeed
    Failure Indicators: Any non-zero exit code
    Evidence: .sisyphus/evidence/task-10-build-pipeline.txt
  ```

  **Commit**: YES (only if build fixes were needed)
  - Message: `chore(build): fix build errors from QC remediation`
  - Files: (whatever needed fixing)
  - Pre-commit: `bun run build`

---

## Final Verification Wave (MANDATORY — after ALL implementation tasks)

> 4 review agents run in PARALLEL. ALL must APPROVE. Rejection → fix → re-run.

- [x] F1. **Plan Compliance Audit** — `oracle`
  Read the plan end-to-end. For each "Must Have": verify implementation exists (read file, check DOM). For each "Must NOT Have": search codebase for forbidden patterns — reject with file:line if found. Check evidence files exist in `.sisyphus/evidence/`. Compare deliverables against plan.
  Output: `Must Have [N/N] | Must NOT Have [N/N] | Tasks [N/N] | VERDICT: APPROVE/REJECT`

- [x] F2. **Code Quality Review** — `unspecified-high`
  Run `bun run build` + `bunx tsc --noEmit`. Review all changed files for: `as any`/`@ts-ignore`, empty catches, console.log in prod, commented-out code, unused imports. Check AI slop: excessive comments, over-abstraction, generic names.
  Output: `Build [PASS/FAIL] | Types [PASS/FAIL] | Files [N clean/N issues] | VERDICT`

- [x] F3. **Real Manual QA** — `unspecified-high` (+ `playwright` skill)
  Start dev server. Navigate to `/engagement-rings`. Verify 8 metal options in filter bar. Verify no price text on any card. Verify no Moissanite in configurator. Verify ring sizes F-Z. Verify clarity options in correct order. Navigate to ring detail page: verify clarity education section, ring size converter. Screenshot every verification.
  Output: `Scenarios [N/N pass] | Integration [N/N] | Edge Cases [N tested] | VERDICT`

- [x] F4. **Scope Fidelity Check** — `deep`
  For each task: read "What to do", read actual diff (git diff). Verify 1:1 — everything in spec was built, nothing beyond spec was built. Check "Must NOT do" compliance. Verify NO hover changes, NO default thumbnail changes, NO image modifications. Flag unaccounted changes.
  Output: `Tasks [N/N compliant] | Contamination [CLEAN/N issues] | Unaccounted [CLEAN/N files] | VERDICT`

---

## Commit Strategy

| Group | Message | Files | Pre-commit |
|-------|---------|-------|-----------|
| T1+T6 | `fix(data): expand MetalValue to 8 options with color prefix mapping` | ring-filters.ts, ring-listing-card.tsx, ring-detail-content.tsx | `bunx tsc --noEmit` |
| T2 | `fix(data): reorder clarity options, add SI1/SI2/FL, add 5.00+ carat` | gemstone-options.ts | `bunx tsc --noEmit` |
| T3 | `fix(data): extend ring sizes F-Z, remove Moissanite option` | engagement-rings.ts | `bunx tsc --noEmit` |
| T4 | `fix(data): reclassify ring shapes per QC audit` | engagement-rings.ts | `bunx tsc --noEmit` |
| T5 | `fix(ui): remove price text from ring cards` | ring-card.tsx, ring-listing-card.tsx | `bunx tsc --noEmit` |
| T7+T8 | `feat(ui): add clarity education and ring size converter sections` | ring-detail-content.tsx | `bun run build` |
| T9 | `test(unit): update tests for expanded data options` | ring-filters.test.ts | `bun test` |
| T10 | `chore(build): verify clean build + type check` | — | `bun run build` |

---

## ⚠️ SKIPPED TASKS — REMINDER

> **Setelah SEMUA task di plan ini selesai, masih ada 2 area yang BELUM dikerjakan dan perlu plan terpisah:**
>
> ### 1. Hover Image Fix
> - **Issue**: Hover pada ring card saat ini melakukan zoom, bukan menampilkan LKB ring box image
> - **Affected**: Semua ring cards di listing page
> - **Blocker**: Image LKB ring box belum tersedia — akan di-generate pakai AI
> - **Action**: Buat plan baru setelah AI images ready
>
> ### 2. Default Thumbnail Image Fix
> - **Issue**: Beberapa ring menampilkan thumbnail salah (box/cushion image muncul di shape filter yang berbeda)
> - **Affected rings** (from QC document):
>   - ROUND: Amanda, Kimia — showing box/cushion image
>   - OVAL: Allison — showing box across all metals
>   - RADIANT: Ayla — showing cushion image
>   - PEAR: Chantelle, Salma — showing cushion image
>   - ELONGATED CUSHION: Bree — wrong image
>   - MARQUISE: Sena — wrong image
> - **Blocker**: Image-related, akan dikerjakan bersamaan dengan hover fix
> - **Action**: Buat plan baru setelah AI images ready
>
> **Ingatkan user setelah plan ini selesai dieksekusi!**

---

## Success Criteria

### Verification Commands
```bash
bunx tsc --noEmit           # Expected: no errors
bun test                     # Expected: all tests pass
bun run build                # Expected: build succeeds
```

### Final Checklist
- [ ] All 8 metal options in filter bar (9K Y/W/R, 18K Y/W/R, PT, PD)
- [ ] Clarity order: SI1, SI2, VS1, VS2, VVS1, VVS2, IF, FL
- [ ] Carat includes 5.00+ bucket
- [ ] Ring sizes F–Z only
- [ ] Zero price text on any ring card
- [ ] Zero Moissanite in configurator
- [ ] All rings under correct shape filter
- [ ] Clarity education section on detail page
- [ ] Ring size converter section on detail page
- [ ] `bun run build` passes
- [ ] ⚠️ REMINDER: hover fix + default thumbnail fix masih pending (plan terpisah)
