# Ring Builder — Cullen Jewellery-inspired Engagement Ring Configurator

## TL;DR

> **Quick Summary**: Build a Ring Builder feature for LKB Jewellers inspired by Cullen Jewellery. Two pages: (1) Listing page with 5-category horizontal filter bar + ring grid, (2) Detail page with image gallery + "Your Setting" + "Your Gemstone" configurator. ALL 225 engagement rings scraped from Cullen Jewellery with their detail pages, stored as static TypeScript. No backend, no cart, no enquiry — customers screenshot & visit the shop.
> 
> **Deliverables**:
> - `/engagement-rings` listing page with Shape/Metal/Setting Style/Band Type/Profile filters
> - `/engagement-rings/[slug]` detail page with full ring configurator
> - Static data files with ALL 225 scraped rings + gemstone data + images from Cullen CDN
> - Vitest test infrastructure + unit/integration tests
> - URL-synced filter state (two-way, shareable links)
> 
> **Estimated Effort**: XL (225 rings to scrape + full Ring Builder UI)
> **Parallel Execution**: YES — 4 waves
> **Critical Path**: Task 1 → Task 3 → Task 6 → Task 8 → Task 11 → Task 13 → Final

---

## Context

### Original Request
Build a Ring Builder similar to Cullen Jewellery (https://cullenjewellery.com/engagement-rings). Scrape all data from Cullen including ring listings, filter options, detail page configuration (Your Setting + Your Gemstone), and images. Design follows existing LKB dark theme.

### Interview Summary
**Key Discussions**:
- **Route**: `/engagement-rings` in separate folder — avoid conflict with existing routes
- **Data**: Static TypeScript files, scraped from Cullen Jewellery — NO Supabase
- **Purchase**: NONE — no enquiry, no cart. Customers screenshot & bring to shop
- **Design**: Follow existing dark theme (bg-black, gold #D4AF37 hardcoded, Montserrat)
- **URL state**: Two-way sync like Cullen (filter clicks update URL, back button works)
- **Tests**: Setup vitest from scratch + TDD approach
- **Images**: Scrape from Cullen Jewellery CDN (media.cullenjewellery.com)

**Research Findings**:
- Codebase uses `"use client"` + `<Suspense>` wrapper pattern (see `src/app/jewellery/page.tsx`)
- `text-gold` is overridden to `#FFFFFF` in globals.css → MUST use `text-[#D4AF37]` hardcoded
- shadcn/ui available: Button, Input, Card, Badge, Dialog, Sheet, Separator, Tooltip, Accordion
- shadcn/ui MISSING (need install): Select, Carousel, Tabs, Label, RadioGroup
- framer-motion available (v12.34.2) for animations
- `next.config.ts` image domains: i.ibb.co, cloudinary, lkbjewellers.com, unsplash — need to add `media.cullenjewellery.com`
- No test infrastructure exists — vitest + @testing-library/react from scratch

### Metis Review
**Identified Gaps** (addressed):
- Enquiry form ambiguity → Resolved: NO enquiry form at all
- Image source → Resolved: Scrape from Cullen CDN
- URL filter sync → Resolved: Two-way like Cullen
- `text-gold` override trap → Added as guardrail
- Missing shadcn components → Added install task
- No carousel library → Use CSS scroll-snap + framer-motion

---

## Work Objectives

### Core Objective
Build a complete Ring Builder experience with listing page (filterable ring grid) and detail page (ring configurator with Your Setting + Your Gemstone sections), using static data scraped from Cullen Jewellery, styled in LKB's dark luxury theme.

### Concrete Deliverables
- `src/app/engagement-rings/page.tsx` — Listing page
- `src/app/engagement-rings/[slug]/page.tsx` — Detail page
- `src/components/engagement-rings/` — All Ring Builder components
- `src/data/engagement-rings.ts` (or `src/data/rings/*.ts` if split) — ALL 225 ring data + types
- `src/data/ring-filters.ts` — Filter options + types
- `src/data/gemstone-options.ts` — Gemstone data + types
- `vitest.config.ts` + test files
- Updated `next.config.ts` (image domains)

### Definition of Done
- [ ] `npm run build` exits with code 0
- [ ] `npx tsc --noEmit` exits with code 0
- [ ] `npx vitest run` — all tests pass
- [ ] `/engagement-rings` loads with all 5 filter categories functional
- [ ] `/engagement-rings/[slug]` loads with image gallery + configurator
- [ ] URL state syncs two-way (filter ↔ URL ↔ back button)
- [ ] Dark theme consistent (bg-black, text-[#D4AF37], Montserrat)

### Must Have
- 5 filter categories matching Cullen: Shape, Metal Type, Setting Style, Band Type, Setting Profile
- Detail page "Your Setting" section with dropdowns
- Detail page "Your Gemstone" section with stone type/clarity/carat/colour
- Image gallery with thumbnails + main image swap
- Responsive design (mobile horizontal scroll filters, stacked detail layout)
- "No results" state with clear filters button
- 404 handling for invalid ring slugs
- URL-synced filters (two-way)

### Must NOT Have (Guardrails)
- ❌ NO enquiry form, mailto, WhatsApp, or any contact mechanism
- ❌ NO cart integration (do not touch CartContext)
- ❌ NO Supabase queries or API routes
- ❌ NO `text-gold` class (overridden to white) — use `text-[#D4AF37]` hardcoded
- ❌ NO modifications to Navbar, Footer, AppShell, AuthContext, CartContext
- ❌ NO carousel library installation (use CSS scroll-snap + framer-motion)
- ❌ NO 3D ring preview or complex animations
- ❌ NO price calculation logic (show static prices as-is from scraped data)
- ❌ NO engraving, timeline, or shipping features
- ❌ NO admin panel or CRUD interface
- ❌ NO `nuqs` library — use native `useSearchParams` + `useRouter`
- ❌ NO dark: class variants — site is already dark by default
- ❌ NO modifications to globals.css or tailwind config

---

## Verification Strategy

> **ZERO HUMAN INTERVENTION** — ALL verification is agent-executed. No exceptions.

### Test Decision
- **Infrastructure exists**: NO — must setup from scratch
- **Automated tests**: TDD (Red → Green → Refactor)
- **Framework**: Vitest + @testing-library/react + jsdom
- **Target**: ~15-20 tests covering filter logic, data utilities, component rendering

### QA Policy
Every task MUST include agent-executed QA scenarios.
Evidence saved to `.sisyphus/evidence/task-{N}-{scenario-slug}.{ext}`.

- **Frontend/UI**: Playwright — Navigate, interact, assert DOM, screenshot
- **Build**: Bash — `npm run build`, `npx tsc --noEmit`, `npx vitest run`

---

## Execution Strategy

### Parallel Execution Waves

```
Wave 1 (Foundation — start immediately, MAX PARALLEL):
├── Task 1: Vitest setup + test infrastructure [quick]
├── Task 2: Scrape & prepare static data files [deep]
├── Task 3: Install missing shadcn/ui components + update next.config [quick]

Wave 2 (Core Components — after Wave 1):
├── Task 4: Ring filter types + filter logic + tests [deep]
├── Task 5: Filter bar UI component [visual-engineering]
├── Task 6: Ring card component [visual-engineering]
├── Task 7: Gemstone data types + selector logic + tests [deep]

Wave 3 (Pages — after Wave 2):
├── Task 8: Listing page (filter bar + grid + URL sync + load more) [deep]
├── Task 9: Image gallery component [visual-engineering]
├── Task 10: Ring configurator (Your Setting + Your Gemstone) [visual-engineering]

Wave 4 (Detail Page + Polish — after Wave 3):
├── Task 11: Detail page assembly ([slug] route + gallery + configurator) [deep]
├── Task 12: Responsive + mobile optimization [visual-engineering]
├── Task 13: Integration tests + build verification [deep]

Wave FINAL (Verification — after ALL tasks):
├── Task F1: Plan compliance audit [oracle]
├── Task F2: Code quality review [unspecified-high]
├── Task F3: Real QA via Playwright [unspecified-high]
├── Task F4: Scope fidelity check [deep]
```

### Dependency Matrix

| Task | Depends On | Blocks | Wave |
|------|-----------|--------|------|
| 1 | — | 4, 7, 13 | 1 |
| 2 | — | 4, 5, 6, 7, 8, 9, 10, 11 | 1 |
| 3 | — | 5, 6, 9, 10 | 1 |
| 4 | 1, 2 | 5, 8 | 2 |
| 5 | 2, 3, 4 | 8 | 2 |
| 6 | 2, 3 | 8 | 2 |
| 7 | 1, 2 | 10 | 2 |
| 8 | 4, 5, 6 | 11, 13 | 3 |
| 9 | 2, 3 | 11 | 3 |
| 10 | 2, 3, 7 | 11 | 3 |
| 11 | 8, 9, 10 | 12, 13 | 4 |
| 12 | 11 | 13 | 4 |
| 13 | 1, 8, 11, 12 | F1-F4 | 4 |

### Agent Dispatch Summary

- **Wave 1**: 3 tasks — T1 `quick`, T2 `deep`, T3 `quick`
- **Wave 2**: 4 tasks — T4 `deep`, T5 `visual-engineering`, T6 `visual-engineering`, T7 `deep`
- **Wave 3**: 3 tasks — T8 `deep`, T9 `visual-engineering`, T10 `visual-engineering`
- **Wave 4**: 3 tasks — T11 `deep`, T12 `visual-engineering`, T13 `deep`
- **FINAL**: 4 tasks — F1 `oracle`, F2 `unspecified-high`, F3 `unspecified-high`, F4 `deep`

---

## TODOs

> Implementation + Test = ONE Task. Never separate.
> EVERY task MUST have: Recommended Agent Profile + Parallelization info + QA Scenarios.

- [ ] 1. Setup Vitest Test Infrastructure

  **What to do**:
  - Install vitest, @testing-library/react, @testing-library/jest-dom, jsdom as devDependencies
  - Create `vitest.config.ts` at project root with jsdom environment, path aliases matching tsconfig (`@/` → `./src/`)
  - Create `src/__tests__/setup.ts` with @testing-library/jest-dom imports
  - Create a smoke test `src/__tests__/smoke.test.ts` that verifies vitest runs (simple `expect(1+1).toBe(2)`)
  - Add `"test": "vitest run"`, `"test:watch": "vitest"` scripts to package.json
  - Run `npx vitest run` to verify setup works

  **Must NOT do**:
  - Do NOT install jest (we use vitest)
  - Do NOT modify any existing source files
  - Do NOT add test files for existing components

  **Recommended Agent Profile**:
  - **Category**: `quick`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 2, 3)
  - **Blocks**: Tasks 4, 7, 13
  - **Blocked By**: None

  **References**:
  - `tsconfig.json` — Path alias config to replicate in vitest.config.ts
  - `package.json` — Current scripts section, devDependencies
  - `src/lib/utils.ts` — Simple module to verify path alias resolution in tests

  **Acceptance Criteria**:
  - [ ] `npx vitest run` exits with code 0, 1 test passes
  - [ ] vitest.config.ts exists with jsdom + path aliases
  - [ ] package.json has "test" and "test:watch" scripts

  **QA Scenarios:**
  ```
  Scenario: Vitest runs successfully
    Tool: Bash
    Steps:
      1. Run `npx vitest run`
      2. Assert exit code 0
      3. Assert output contains "1 passed"
    Expected Result: 1 test passes, 0 failures
    Evidence: .sisyphus/evidence/task-1-vitest-run.txt

  Scenario: Path alias resolves
    Tool: Bash
    Steps:
      1. Create temp test importing `@/lib/utils`
      2. Run `npx vitest run`
      3. Assert no "Cannot find module" error
    Expected Result: Import resolves correctly
    Evidence: .sisyphus/evidence/task-1-path-alias.txt
  ```

  **Commit**: YES
  - Message: `chore: setup vitest test infrastructure`
  - Files: `vitest.config.ts`, `package.json`, `src/__tests__/setup.ts`, `src/__tests__/smoke.test.ts`
  - Pre-commit: `npx vitest run`

- [ ] 2. Scrape & Prepare Static Data Files

  **What to do**:
  - Create `src/data/ring-filters.ts` with TypeScript interfaces and all filter options:
    - `Shape`: 12 options (round, oval, emerald, radiant, pear, cushion, elongated_cushion, elongated_hexagon, marquise, princess, asscher, heart) — each with value, label, SVG icon path or inline SVG
    - `MetalType`: 5 options (two_tone, platinum, yellow_gold, rose_gold, white_gold) — each with value, label, color hex
    - `SettingStyle`: 6 options (trilogy, solitaire, halo, toi_et_moi, bezel, east_west) — each with value, label, icon
    - `BandType`: 3 options (plain, pave, accents) — each with value, label, icon
    - `SettingProfile`: 2 options (high_set, low_set) — each with value, label, icon
  - Create `src/data/engagement-rings.ts` with ALL 225 engagement rings scraped from Cullen Jewellery:
    - Interface: `Ring { id, slug, name, title, description, basePrice, currency, images[], thumbnails[], metalOptions[], settingOptions[], sideStonesOptions[], ringSizes[], specs{}, shape, settingStyle, bandType, settingProfile }`
    - Each ring has: name, full title, description text, base price in USD, multiple image URLs from Cullen CDN, available configuration options
    - Image URLs from `media.cullenjewellery.com` CDN (renders by metal color + setting type)
    - Each ring MUST have filter-relevant fields populated: `shape` (e.g., 'oval'), `settingStyle` (e.g., 'solitaire'), `bandType` (e.g., 'plain'), `settingProfile` (e.g., 'high_set') — parsed from the ring's full title
    - **SCRAPING APPROACH** (due to 225 rings):
      1. Create a temporary scraping script `scripts/scrape-cullen.ts` (Bun/Node)
      2. Script iterates through ALL 225 ring slugs (full list provided below)
      3. For each slug, fetch `https://cullenjewellery.com/engagement-rings/ring-{slug}` using `fetch()`
      4. Parse the HTML response to extract: title, description, base price, image URLs, configuration dropdown options, specs table
      5. Rate-limit requests to avoid being blocked (e.g., 1 request per 500ms with retry on 429)
      6. Write output to `src/data/engagement-rings.ts` as a typed constant array
      7. After all data is scraped and written, DELETE the `scripts/scrape-cullen.ts` script — it is temporary
    - **COMPLETE RING SLUG LIST** (225 rings, alphabetical):
      ring-adelyn, ring-adina, ring-adrian, ring-aida, ring-ainsley, ring-aisha, ring-alessia, ring-alex, ring-alexandria, ring-alexia, ring-alia, ring-alice, ring-alina, ring-allison, ring-alyssa, ring-amanda, ring-amor, ring-amy, ring-analyce, ring-angelina, ring-anna, ring-annika, ring-annie, ring-arabella, ring-ari, ring-aria, ring-arielle, ring-arlo, ring-ashlea, ring-aspen, ring-aster, ring-athena, ring-aubrey, ring-aurelie, ring-ava, ring-avery, ring-ayla, ring-bella, ring-bethany, ring-bindi, ring-billie, ring-blair, ring-blossom, ring-bonnie, ring-brandi, ring-bree, ring-briar, ring-brooke, ring-brooklyn, ring-bronte, ring-cali, ring-camilla, ring-candice, ring-carly, ring-carmella, ring-caroline, ring-cartia, ring-casey, ring-cataleya, ring-cecilia, ring-chantelle, ring-charlie, ring-charmaine, ring-claudia, ring-cynthia, ring-dahlia, ring-dakota, ring-daisy, ring-daya, ring-daphne, ring-daniela, ring-delilah, ring-delta, ring-elena, ring-eliana, ring-elise, ring-ella, ring-elle, ring-ellie, ring-elphie, ring-elsie, ring-ember, ring-emily, ring-emma, ring-emmy, ring-evangeline, ring-eve, ring-evelyn, ring-everleigh, ring-fiona, ring-francesca, ring-frankie, ring-freya, ring-freesia, ring-gabrielle, ring-gemma, ring-genevieve, ring-georgia, ring-gigi, ring-ginny, ring-giselle, ring-glinda, ring-grace, ring-greta, ring-gwyneth, ring-halle, ring-hannah, ring-hayley, ring-hilary, ring-iris, ring-isla, ring-ivy, ring-jacinta, ring-jackie, ring-jana, ring-jane, ring-jayden, ring-jaylene, ring-jennifer, ring-josephine, ring-journee, ring-judy, ring-julia, ring-juliette, ring-kala, ring-kate, ring-kelsey, ring-kiana, ring-kimia, ring-kirsten, ring-kyla, ring-lara, ring-leila, ring-leslie, ring-lexie, ring-liberty, ring-lilly, ring-lorelai, ring-lorena, ring-louise, ring-luna, ring-mabeline, ring-madeline, ring-maeve, ring-mahlia, ring-maisy, ring-mariah, ring-matisse, ring-meghan, ring-meesha, ring-melody, ring-merida, ring-mia, ring-miller, ring-molly, ring-morgan, ring-myrtle, ring-naomi, ring-nara, ring-natalie, ring-nienna, ring-nina, ring-noelle, ring-nola, ring-noor, ring-nora, ring-octavia, ring-olive, ring-olivia, ring-paige, ring-parker, ring-penelope, ring-phoebe, ring-pia, ring-polly, ring-poppy, ring-racquel, ring-raleigh, ring-rachel, ring-rita, ring-river, ring-rosalia, ring-rose, ring-rosie, ring-rowena, ring-sadie, ring-sage, ring-salma, ring-sasha, ring-savannah, ring-scarlett, ring-selena, ring-sena, ring-shai, ring-sharon, ring-shelly, ring-sheridan, ring-sherry, ring-sierra, ring-silvana, ring-siobhan, ring-sophia, ring-soraya, ring-stephanie, ring-suki, ring-svea, ring-tahlia, ring-tanya, ring-taylor, ring-tessa, ring-thea, ring-tilly, ring-trinity, ring-valeria, ring-violetta, ring-wanda, ring-wendy, ring-willow, ring-winnie, ring-yasmine, ring-zara, ring-zariyah, ring-zelda, ring-zoe, ring-zya
    - **DATA TO EXTRACT PER RING** (from each detail page HTML):
      - `name`: Ring name (e.g., "Sheridan")
      - `slug`: URL slug (e.g., "ring-sheridan")
      - `title`: Full title (e.g., "Sheridan - Oval 4 Claw Solitaire with Pear Accents...")
      - `description`: Description paragraph from detail page
      - `basePrice`: Starting price in USD (number, parsed from "STARTING $X,XXX USD")
      - `currency`: "USD"
      - `images[]`: Array of image URLs from `media.cullenjewellery.com` CDN (main product renders)
      - `thumbnails[]`: Same images but with width=200 CDN transform
      - `metalOptions[]`: Available metals from "METAL TYPE" dropdown (e.g., ["Platinum", "18k Yellow Gold", ...])
      - `settingOptions[]`: Available settings from "SETTING" dropdown (e.g., ["High Setting", "Low Setting"])
      - `sideStonesOptions[]`: From "SIDE & MELEE STONES" dropdown
      - `ringSizes[]`: From "RING SIZE" dropdown (UK sizing: D through S)
      - `specs`: Object with keys from specs table (e.g., `{ avgSideStones: "16", bandWidth: "1.5mm", ... }`)
      - `shape`: Parsed from title — one of: round, oval, emerald, radiant, pear, cushion, elongated_cushion, elongated_hexagon, marquise, princess, asscher, heart
      - `settingStyle`: Parsed from title — one of: trilogy, solitaire, halo, toi_et_moi, bezel, east_west
      - `bandType`: Parsed from title — one of: plain, pave, accents
      - `settingProfile`: Parsed from title — one of: high_set, low_set
    - **SPLITTING DATA FILES** (for performance):
      - Split into multiple files if `engagement-rings.ts` exceeds ~200KB:
        - `src/data/rings/rings-a-d.ts` (rings A-D)
        - `src/data/rings/rings-e-j.ts` (rings E-J)
        - `src/data/rings/rings-k-n.ts` (rings K-N)
        - `src/data/rings/rings-o-s.ts` (rings O-S)
        - `src/data/rings/rings-t-z.ts` (rings T-Z)
        - `src/data/rings/index.ts` — barrel export that combines all
      - If file is under 200KB, keep as single `src/data/engagement-rings.ts`
  - Create `src/data/gemstone-options.ts`:
    - Interface: `GemstoneConfig { stoneTypes[], clarityOptions[], caratRanges[], colourOptions[] }`
    - `stoneTypes`: Lab Grown Diamond, Natural Diamond, Moissanite, Lab Grown Sapphire
    - `clarityOptions`: VS1, VS2, VVS1, VVS2, IF
    - `caratRanges`: 0.50-0.99ct, 1.00-1.49ct, 1.50-1.99ct, 2.00-2.24ct, 2.25-2.49ct, 2.50-2.99ct, 3.00ct+
    - `colourOptions`: D, E, F, G, H
    - `RecommendedGemstone { id, type, carat, clarity, colour, dimensions, price, imageUrl }`
    - Scrape 8-12 sample recommended gemstones with images from Cullen CDN (from Sheridan detail page Your Gemstone section)
  - Scrape real data using the temporary script approach described above — NOT hyperbrowser (credits exhausted)

  **Must NOT do**:
  - Do NOT create API routes
  - Do NOT import from Supabase
  - Do NOT make up fake data — scrape real data from Cullen Jewellery
  - Do NOT download images to /public — use Cullen CDN URLs directly
  - Do NOT leave the scraping script in the repo after data is generated
  - Do NOT use hyperbrowser tools (credits exhausted) — use native fetch() or webfetch tool

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 3)
  - **Blocks**: Tasks 4, 5, 6, 7, 8, 9, 10, 11
  - **Blocked By**: None

  **References**:
  - `src/data/products.ts:1-19` — Existing Product interface pattern to follow for TypeScript types
  - `src/data/products.ts:21-179` — navMenuData pattern for organizing static data exports
  - Cullen Jewellery listing: https://cullenjewellery.com/engagement-rings — scrape ring names, prices, images
  - Cullen Jewellery detail (example): https://cullenjewellery.com/engagement-rings/ring-sheridan — scrape configuration options, specs, images
  - Cullen CDN pattern: `media.cullenjewellery.com/cdn-cgi/image/width={w},height={h}/products/rings/{name}/renders/{carat}/{setting}/{metal}/{hash}`
  - Full ring slug list: 225 rings from Adelyn to Zya (see slug list above)

  **Acceptance Criteria**:
  - [ ] `src/data/ring-filters.ts` exports all 5 filter categories with correct option counts (12+5+6+3+2)
  - [ ] Ring data files export ALL 225 rings with images, each ring has slug, name, title, price, shape, settingStyle
  - [ ] `src/data/gemstone-options.ts` exports stone types, clarity, carat, colour arrays + 8+ recommended gemstones
  - [ ] `npx tsc --noEmit` passes with no errors
  - [ ] No `scripts/scrape-cullen.ts` file remaining in repo (deleted after scraping)

  **QA Scenarios:**
  ```
  Scenario: Data files compile without errors
    Tool: Bash
    Steps:
      1. Run `npx tsc --noEmit`
      2. Assert exit code 0
    Expected Result: Zero TypeScript errors
    Evidence: .sisyphus/evidence/task-2-tsc.txt

  Scenario: All 225 rings present in data
    Tool: Bash
    Steps:
      1. Run `node -e "import('./src/data/engagement-rings.ts').then(d => console.log(Object.values(d).flat().filter(r => r?.slug).length))"` (or bun equivalent)
      2. Assert output is 225
    Expected Result: 225 rings in data files
    Evidence: .sisyphus/evidence/task-2-ring-count.txt

  Scenario: Each ring has required fields
    Tool: Bash
    Steps:
      1. Run validation script checking each ring has: slug, name, title, basePrice > 0, images.length > 0, shape, settingStyle
      2. Assert zero validation errors
    Expected Result: All rings have complete required fields
    Evidence: .sisyphus/evidence/task-2-ring-validation.txt

  Scenario: Scraping script cleaned up
    Tool: Bash
    Steps:
      1. Run `ls scripts/scrape-cullen.ts 2>&1`
      2. Assert file does NOT exist
    Expected Result: Temp script deleted
    Evidence: .sisyphus/evidence/task-2-cleanup.txt
  ```

  **Commit**: YES
  - Message: `feat(engagement-rings): add static ring, filter, and gemstone data for 225 rings`
  - Files: `src/data/engagement-rings.ts` (or `src/data/rings/*.ts`), `src/data/ring-filters.ts`, `src/data/gemstone-options.ts`
  - Pre-commit: `npx tsc --noEmit`
- [ ] 3. Install Missing shadcn/ui Components + Update next.config

  **What to do**:
  - Run `npx shadcn@latest add select` — for dropdown selectors in ring configurator
  - Run `npx shadcn@latest add tabs` — for potential tabbed sections
  - Run `npx shadcn@latest add label` — for form labels in configurator
  - Run `npx shadcn@latest add radio-group` — for filter selections
  - Update `next.config.ts` to add `media.cullenjewellery.com` to images.remotePatterns for Cullen CDN images
  - Verify all new components render without errors

  **Must NOT do**:
  - Do NOT modify existing shadcn components
  - Do NOT install carousel libraries (embla-carousel, swiper, etc.)
  - Do NOT modify globals.css or tailwind config

  **Recommended Agent Profile**:
  - **Category**: `quick`
  - **Skills**: [`shadcn-ui`]

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 1 (with Tasks 1, 2)
  - **Blocks**: Tasks 5, 6, 9, 10
  - **Blocked By**: None

  **References**:
  - `components.json` — shadcn configuration (style, aliases, etc.)
  - `src/components/ui/button.tsx` — Existing shadcn component pattern
  - `next.config.ts` — Current image domain config to extend

  **Acceptance Criteria**:
  - [ ] `src/components/ui/select.tsx` exists
  - [ ] `src/components/ui/tabs.tsx` exists
  - [ ] `src/components/ui/label.tsx` exists
  - [ ] `src/components/ui/radio-group.tsx` exists
  - [ ] `next.config.ts` includes `media.cullenjewellery.com` in remotePatterns
  - [ ] `npm run build` succeeds

  **QA Scenarios:**
  ```
  Scenario: shadcn components installed correctly
    Tool: Bash
    Steps:
      1. Check `ls src/components/ui/select.tsx src/components/ui/tabs.tsx src/components/ui/label.tsx src/components/ui/radio-group.tsx`
      2. Assert all 4 files exist
    Expected Result: All shadcn files present
    Evidence: .sisyphus/evidence/task-3-shadcn-check.txt

  Scenario: Build succeeds with new config
    Tool: Bash
    Steps:
      1. Run `npm run build`
      2. Assert exit code 0
    Expected Result: Clean build
    Evidence: .sisyphus/evidence/task-3-build.txt
  ```

  **Commit**: YES
  - Message: `chore: install missing shadcn components and update image domains`
  - Files: `src/components/ui/select.tsx`, `src/components/ui/tabs.tsx`, `src/components/ui/label.tsx`, `src/components/ui/radio-group.tsx`, `next.config.ts`
  - Pre-commit: `npm run build`

- [ ] 4. Ring Filter Logic + Types + Tests

  **What to do**:
  - Create `src/lib/ring-filters.ts` with filter utility functions:
    - `filterRings(rings: Ring[], filters: ActiveFilters): Ring[]` — apply all active filters (AND logic)
    - `parseFiltersFromURL(searchParams: URLSearchParams): ActiveFilters` — parse URL params to filter state
    - `filtersToURL(filters: ActiveFilters): string` — serialize filter state to URL query string
    - `ActiveFilters` type: `{ shape?: string; metal?: string; settingStyle?: string; bandType?: string; settingProfile?: string }`
  - Write RED tests first (TDD):
    - `src/__tests__/ring-filters.test.ts`
    - Test: filterRings returns all rings when no filters active
    - Test: filterRings with single filter returns correct subset
    - Test: filterRings with multiple filters uses AND logic
    - Test: filterRings with invalid filter value returns empty array
    - Test: parseFiltersFromURL correctly parses URL params
    - Test: filtersToURL serializes correctly (skips undefined values)
  - Make tests GREEN with implementation

  **Must NOT do**:
  - Do NOT install any URL state management library
  - Do NOT create React components in this task (logic only)

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 2 (with Tasks 5, 6, 7)
  - **Blocks**: Tasks 5, 8
  - **Blocked By**: Tasks 1, 2

  **References**:
  - `src/data/ring-filters.ts` (from Task 2) — Filter option types and values
  - `src/data/engagement-rings.ts` (from Task 2) — Ring interface and data to filter against
  - `src/components/shop-content.tsx:95` — Existing useSearchParams pattern for URL state reading

  **Acceptance Criteria**:
  - [ ] `npx vitest run src/__tests__/ring-filters.test.ts` — 6+ tests pass
  - [ ] filterRings correctly filters by all 5 categories
  - [ ] parseFiltersFromURL + filtersToURL roundtrip preserves state

  **QA Scenarios:**
  ```
  Scenario: All filter tests pass
    Tool: Bash
    Steps:
      1. Run `npx vitest run src/__tests__/ring-filters.test.ts`
      2. Assert exit code 0
      3. Assert output contains "6 passed" or more
    Expected Result: All 6+ tests pass
    Evidence: .sisyphus/evidence/task-4-filter-tests.txt

  Scenario: AND logic works correctly
    Tool: Bash
    Steps:
      1. Run specific test: `npx vitest run -t "multiple filters uses AND logic"`
      2. Assert pass
    Expected Result: Multi-filter AND logic verified
    Evidence: .sisyphus/evidence/task-4-and-logic.txt
  ```

  **Commit**: YES (groups with 5, 6, 7)
  - Message: `feat(engagement-rings): add filter logic, ring card, and gemstone components with tests`
  - Pre-commit: `npx vitest run`

- [ ] 5. Filter Bar UI Component

  **What to do**:
  - Create `src/components/engagement-rings/filter-bar.tsx` ("use client"):
    - Horizontal scrollable filter bar matching Cullen Jewellery layout
    - 5 filter sections: Shape, Metal Type, Setting Style, Band Type, Setting Profile
    - Each section has label + horizontal row of clickable icon/button options
    - Shape options show SVG icon outlines of each diamond shape
    - Metal Type options show colored circles (platinum gray, yellow gold, rose gold, white gold)
    - Setting Style options show simplified ring silhouette icons
    - Band Type options show band cross-section icons
    - Setting Profile options show side-view profile icons
    - Active filter highlighted with `border-[#D4AF37]` / `text-[#D4AF37]`
    - Click toggles filter (click again to deselect)
    - Info icon (ℹ) next to each section label with tooltip explanation
    - Props: `activeFilters: ActiveFilters`, `onFilterChange: (filters: ActiveFilters) => void`
  - Mobile: horizontal scroll with scroll-snap, sections stacked vertically
  - Use framer-motion for subtle enter/exit animations on filter selections

  **Must NOT do**:
  - Do NOT handle URL sync here (parent page handles it)
  - Do NOT fetch data (pure presentational + callback)
  - Do NOT use `text-gold` class — use `text-[#D4AF37]`

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: [`shadcn-ui`]

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 2 (with Tasks 4, 6, 7)
  - **Blocks**: Task 8
  - **Blocked By**: Tasks 2, 3, 4

  **References**:
  - `src/data/ring-filters.ts` (from Task 2) — Filter options data (labels, values, icons)
  - `src/lib/ring-filters.ts` (from Task 4) — ActiveFilters type
  - `src/components/ui/tooltip.tsx` — Existing shadcn tooltip for info icons
  - `src/components/ui/badge.tsx` — Pattern for small styled elements
  - `src/components/shop-content.tsx:168-210` — Existing filter button styling pattern (dark theme)
  - Cullen reference: horizontal icon bar with sections (see screenshot in user request)

  **Acceptance Criteria**:
  - [ ] Component renders all 5 filter categories with correct option counts
  - [ ] Active filter shows gold highlight (`border-[#D4AF37]`)
  - [ ] Click toggles filter on/off, calls onFilterChange
  - [ ] `npx tsc --noEmit` passes

  **QA Scenarios:**
  ```
  Scenario: Filter bar renders all categories
    Tool: Playwright
    Preconditions: Dev server running, navigate to /engagement-rings
    Steps:
      1. Navigate to http://localhost:3000/engagement-rings
      2. Assert 5 filter section labels visible: "Shape", "Metal Type", "Setting Style", "Band Type", "Setting Profile"
      3. Assert Shape section has 12 clickable options
      4. Assert Metal Type section has 5 colored circles
    Expected Result: All filter categories render with correct counts
    Evidence: .sisyphus/evidence/task-5-filter-bar.png

  Scenario: Filter toggle works
    Tool: Playwright
    Steps:
      1. Click "Oval" shape filter
      2. Assert "Oval" has gold border (border-[#D4AF37])
      3. Click "Oval" again
      4. Assert gold border removed
    Expected Result: Toggle on/off works
    Evidence: .sisyphus/evidence/task-5-filter-toggle.png
  ```

  **Commit**: YES (groups with 4, 6, 7)

- [ ] 6. Ring Card Component

  **What to do**:
  - Create `src/components/engagement-rings/ring-card.tsx` ("use client"):
    - Card component for grid display of individual rings
    - Image with hover zoom effect (scale-105 on hover, like existing pattern in bespoke page)
    - Ring name (font-heading)
    - Ring description/subtitle (text-gray-400)
    - Price display: "From $X,XXX USD" (text-[#D4AF37])
    - Click navigates to `/engagement-rings/[slug]`
    - Use Next.js `<Image>` with Cullen CDN URLs
    - Loading skeleton state (gray placeholder while image loads)
    - Error fallback if image fails (SVG placeholder, like pattern in product/[id]/page.tsx)
  - Use shadcn Card as base, customize with dark theme styling

  **Must NOT do**:
  - Do NOT add "Add to cart" button
  - Do NOT add wishlist/favorite functionality
  - Do NOT use `text-gold` — use `text-[#D4AF37]`

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: [`shadcn-ui`]

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 2 (with Tasks 4, 5, 7)
  - **Blocks**: Task 8
  - **Blocked By**: Tasks 2, 3

  **References**:
  - `src/data/engagement-rings.ts` (from Task 2) — Ring type with name, slug, title, price, images
  - `src/components/ui/card.tsx` — shadcn Card component to extend
  - `src/app/bespoke/page.tsx:325-330` — Image hover zoom pattern (`hover:scale-105 transition-transform duration-700`)
  - `src/app/product/[id]/page.tsx` — Image error fallback pattern (onError handler)
  - `next/image` — For optimized image loading with Cullen CDN

  **Acceptance Criteria**:
  - [ ] Ring card shows image, name, description, price
  - [ ] Click navigates to correct `/engagement-rings/[slug]` URL
  - [ ] Image error shows fallback SVG
  - [ ] `npx tsc --noEmit` passes

  **QA Scenarios:**
  ```
  Scenario: Ring card displays correctly
    Tool: Playwright
    Preconditions: Dev server running, listing page loaded
    Steps:
      1. Navigate to http://localhost:3000/engagement-rings
      2. Assert at least 1 ring card is visible
      3. Assert first card has: img element, h3 with ring name, price text containing "$"
      4. Assert card has link to /engagement-rings/[slug]
    Expected Result: Card structure complete
    Evidence: .sisyphus/evidence/task-6-ring-card.png

  Scenario: Card click navigates to detail
    Tool: Playwright
    Steps:
      1. Click first ring card
      2. Assert URL changes to /engagement-rings/[slug]
    Expected Result: Navigation to detail page
    Evidence: .sisyphus/evidence/task-6-card-navigate.png
  ```

  **Commit**: YES (groups with 4, 5, 7)

- [ ] 7. Gemstone Data Types + Selector Logic + Tests

  **What to do**:
  - Create `src/lib/gemstone-utils.ts` with utility functions:
    - `filterGemstones(options: RecommendedGemstone[], config: GemstoneFilter): RecommendedGemstone[]`
    - `GemstoneFilter` type: `{ stoneType?: string; clarity?: string; caratRange?: string; colour?: string }`
    - Filter recommended gemstones based on user's 4C selections
  - Write RED tests first (TDD) in `src/__tests__/gemstone-utils.test.ts`:
    - Test: returns all gemstones when no filters active
    - Test: filters by stone type correctly
    - Test: filters by clarity correctly
    - Test: filters by carat range correctly
    - Test: filters by colour correctly
    - Test: combined filters use AND logic
    - Test: returns empty array when no match
  - Make tests GREEN with implementation

  **Must NOT do**:
  - Do NOT create UI components (logic only)
  - Do NOT add price calculation

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 2 (with Tasks 4, 5, 6)
  - **Blocks**: Task 10
  - **Blocked By**: Tasks 1, 2

  **References**:
  - `src/data/gemstone-options.ts` (from Task 2) — GemstoneConfig and RecommendedGemstone types
  - `src/lib/ring-filters.ts` (from Task 4) — Similar filtering pattern to follow

  **Acceptance Criteria**:
  - [ ] `npx vitest run src/__tests__/gemstone-utils.test.ts` — 7+ tests pass
  - [ ] filterGemstones correctly filters by all 4 criteria

  **QA Scenarios:**
  ```
  Scenario: Gemstone filter tests pass
    Tool: Bash
    Steps:
      1. Run `npx vitest run src/__tests__/gemstone-utils.test.ts`
      2. Assert exit code 0, 7+ tests pass
    Expected Result: All gemstone filter tests green
    Evidence: .sisyphus/evidence/task-7-gemstone-tests.txt
  ```

  **Commit**: YES (groups with 4, 5, 6)

- [ ] 8. Listing Page — Filter Bar + Ring Grid + URL Sync + Load More

  **What to do**:
  - Create `src/app/engagement-rings/page.tsx` as server component wrapper with `<Suspense>`:
    - Fallback: dark loading skeleton matching existing pattern (`bg-black min-h-screen`)
  - Create `src/components/engagement-rings/engagement-rings-content.tsx` ("use client"):
    - Import all rings from `src/data/engagement-rings.ts`
    - Import filter options from `src/data/ring-filters.ts`
    - Import filterRings, parseFiltersFromURL, filtersToURL from `src/lib/ring-filters.ts`
    - Use `useSearchParams()` to read initial filter state from URL
    - Use `useRouter().push()` to update URL when filters change (two-way sync)
    - Filter bar at top (FilterBar component from Task 5)
    - Grid of RingCard components (from Task 6): 2 columns mobile, 3 columns tablet, 4 columns desktop
    - "Load More" button at bottom: initially show 12 rings, +12 per click
    - Empty state: "No rings match your filters" with "Clear All Filters" button (text-[#D4AF37])
    - Total results count: "Showing X of Y rings"
    - Page title: "Engagement Rings" in font-heading
  - Layout: full-width dark background, container mx-auto for content

  **Must NOT do**:
  - Do NOT add sort options (only filters)
  - Do NOT add search bar
  - Do NOT add price range slider
  - Do NOT import from Supabase
  - Do NOT use `text-gold` — use `text-[#D4AF37]`

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: [`shadcn-ui`]

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Wave 3 (with Tasks 9, 10 — but 9/10 can run parallel with 8)
  - **Blocks**: Tasks 11, 13
  - **Blocked By**: Tasks 4, 5, 6

  **References**:
  - `src/app/jewellery/page.tsx` — Suspense wrapper pattern to replicate
  - `src/components/shop-content.tsx` — Existing filter + grid pattern (client component)
  - `src/components/shop-content.tsx:95` — useSearchParams() usage pattern
  - `src/lib/ring-filters.ts` (from Task 4) — Filter utility functions
  - `src/components/engagement-rings/filter-bar.tsx` (from Task 5) — Filter bar component
  - `src/components/engagement-rings/ring-card.tsx` (from Task 6) — Ring card component

  **Acceptance Criteria**:
  - [ ] `/engagement-rings` loads with filter bar + ring grid
  - [ ] Clicking a filter updates URL query params
  - [ ] Copying URL with filters → paste in new tab → same filters applied
  - [ ] Back button reverts filter change
  - [ ] Load More shows 12 more rings per click
  - [ ] Empty state shows when no rings match
  - [ ] `npm run build` passes

  **QA Scenarios:**
  ```
  Scenario: Listing page loads with filters and grid
    Tool: Playwright
    Preconditions: Dev server running on localhost:3000
    Steps:
      1. Navigate to http://localhost:3000/engagement-rings
      2. Assert page title contains "Engagement Rings"
      3. Assert filter bar visible with 5 sections
      4. Assert at least 1 ring card visible in grid
      5. Screenshot full page
    Expected Result: Page loads with filters and ring grid
    Evidence: .sisyphus/evidence/task-8-listing-page.png

  Scenario: URL sync two-way
    Tool: Playwright
    Steps:
      1. Navigate to http://localhost:3000/engagement-rings
      2. Click "Oval" shape filter
      3. Assert URL now contains "?shape=oval" or "shape=oval"
      4. Navigate directly to http://localhost:3000/engagement-rings?shape=oval
      5. Assert "Oval" filter is highlighted
    Expected Result: URL ↔ filter state synced both ways
    Evidence: .sisyphus/evidence/task-8-url-sync.png

  Scenario: Empty state with no results
    Tool: Playwright
    Steps:
      1. Apply multiple restrictive filters that result in 0 matches
      2. Assert "No rings match" message visible
      3. Assert "Clear All Filters" button visible
      4. Click "Clear All Filters"
      5. Assert all rings show again
    Expected Result: Empty state + clear button work
    Evidence: .sisyphus/evidence/task-8-empty-state.png
  ```

  **Commit**: YES (groups with 9, 10)
  - Message: `feat(engagement-rings): add listing page with filters, gallery, and configurator`
  - Pre-commit: `npm run build`

- [ ] 9. Image Gallery Component

  **What to do**:
  - Create `src/components/engagement-rings/image-gallery.tsx` ("use client"):
    - Main large image display (aspect-square or 4:5 ratio)
    - Thumbnail strip on left side (vertical, desktop) or bottom (horizontal, mobile)
    - Click thumbnail → swap main image (with framer-motion crossfade transition)
    - Active thumbnail highlighted with `border-[#D4AF37]`
    - Image loading: skeleton placeholder (bg-gray-800 animate-pulse)
    - Image error: SVG fallback placeholder
    - Navigation arrows (< >) on main image for next/prev
    - Image counter: "1/5"
    - Props: `images: string[]`, `thumbnails: string[]`, `alt: string`
  - Use Next.js `<Image>` with Cullen CDN URLs
  - Use CSS scroll-snap for thumbnail scrolling (NO carousel library)
  - Use framer-motion `AnimatePresence` for image swap animation

  **Must NOT do**:
  - Do NOT install embla-carousel, swiper, or any carousel library
  - Do NOT add lightbox/zoom functionality
  - Do NOT add video support

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 3 (with Tasks 8, 10)
  - **Blocks**: Task 11
  - **Blocked By**: Tasks 2, 3

  **References**:
  - `src/data/engagement-rings.ts` (from Task 2) — Ring images/thumbnails arrays
  - `src/app/product/[id]/page.tsx` — Existing image display + error fallback pattern
  - `framer-motion` (already installed) — AnimatePresence, motion.img for transitions
  - Cullen reference: vertical thumbnail strip + main image layout

  **Acceptance Criteria**:
  - [ ] Gallery shows main image + thumbnails
  - [ ] Click thumbnail swaps main image with animation
  - [ ] Active thumbnail has gold border
  - [ ] Arrow navigation works (next/prev)
  - [ ] `npx tsc --noEmit` passes

  **QA Scenarios:**
  ```
  Scenario: Gallery renders with thumbnails
    Tool: Playwright
    Preconditions: Dev server, navigate to a ring detail page
    Steps:
      1. Navigate to http://localhost:3000/engagement-rings/[first-ring-slug]
      2. Assert main image visible (img element with src from Cullen CDN)
      3. Assert 2+ thumbnail images visible
      4. Assert one thumbnail has gold border (active state)
    Expected Result: Gallery fully rendered
    Evidence: .sisyphus/evidence/task-9-gallery.png

  Scenario: Thumbnail click swaps image
    Tool: Playwright
    Steps:
      1. Note current main image src
      2. Click second thumbnail
      3. Assert main image src changed
      4. Assert second thumbnail now has gold border
    Expected Result: Image swap works
    Evidence: .sisyphus/evidence/task-9-thumbnail-swap.png
  ```

  **Commit**: YES (groups with 8, 10)

- [ ] 10. Ring Configurator — Your Setting + Your Gemstone

  **What to do**:
  - Create `src/components/engagement-rings/ring-configurator.tsx` ("use client"):
    - Two main sections: "Your Setting" and "Your Gemstone"
    - **Your Setting** section:
      - Section title: "Your Setting" in font-heading
      - Description: "Start by selecting your stone, metal and ring size."
      - SIDE & MELEE STONES: shadcn Select dropdown (Lab Diamond, Moissanite, Natural Diamond)
      - METAL TYPE: shadcn Select dropdown (Platinum, 18k Yellow Gold, 18k Rose Gold, 18k White Gold)
      - SETTING: shadcn Select dropdown (High Setting, Low Setting, Basket Setting)
      - RING SIZE: shadcn Select dropdown (D through S, UK sizing)
      - Each row: label left (uppercase, tracking-wide), dropdown right
      - Info icon (ℹ) next to each label with shadcn Tooltip
      - Horizontal separator between rows
    - **Your Gemstone** section:
      - Section title: "Your Gemstone" in font-heading
      - "CARBON NEUTRAL GEMSTONES" badge (green icon + text)
      - Description: "Select your stone preferences to see recommended options."
      - STONE TYPE: shadcn Select dropdown
      - CLARITY: shadcn Select dropdown (VS1, VS2, VVS1, VVS2, IF)
      - CARAT: shadcn Select dropdown (ranges from gemstone data)
      - COLOUR: shadcn Select dropdown (D, E, F, G, H)
      - "RECOMMENDED OPTIONS" subsection:
        - Grid of recommended gemstone cards (2 columns)
        - Each card: gemstone image, type label, specs (carat – colour – clarity), dimensions, price
        - "VIEW MORE OPTIONS" button (text-[#D4AF37], just scrolls/expands more)
      - Filtering: as user changes dropdowns, recommended options filter automatically using gemstone-utils
  - Props: `ring: Ring`, `gemstones: RecommendedGemstone[]`, callbacks for state changes

  **Must NOT do**:
  - Do NOT add price calculation that combines ring + gemstone
  - Do NOT add "Add to Cart" or "Enquire" buttons
  - Do NOT add engraving or timeline options
  - Do NOT use `text-gold` — use `text-[#D4AF37]`

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: [`shadcn-ui`]

  **Parallelization**:
  - **Can Run In Parallel**: YES
  - **Parallel Group**: Wave 3 (with Tasks 8, 9)
  - **Blocks**: Task 11
  - **Blocked By**: Tasks 2, 3, 7

  **References**:
  - `src/data/engagement-rings.ts` (from Task 2) — Ring type with available options per ring
  - `src/data/gemstone-options.ts` (from Task 2) — Gemstone options and recommended gemstones
  - `src/lib/gemstone-utils.ts` (from Task 7) — filterGemstones function
  - `src/components/ui/select.tsx` (from Task 3) — shadcn Select for dropdowns
  - `src/components/ui/separator.tsx` — Existing separator between rows
  - `src/components/ui/tooltip.tsx` — For info icons
  - Cullen reference: "Your Setting" + "Your Gemstone" layout (see screenshots in request)

  **Acceptance Criteria**:
  - [ ] "Your Setting" renders with 4 dropdowns (Side Stones, Metal, Setting, Size)
  - [ ] "Your Gemstone" renders with 4 dropdowns + recommended options grid
  - [ ] Changing gemstone dropdown filters recommended options
  - [ ] UI matches dark theme (bg-black, text-white, gold accents)
  - [ ] `npx tsc --noEmit` passes

  **QA Scenarios:**
  ```
  Scenario: Configurator renders all sections
    Tool: Playwright
    Preconditions: Dev server, ring detail page loaded
    Steps:
      1. Navigate to http://localhost:3000/engagement-rings/[first-ring-slug]
      2. Assert "Your Setting" heading visible
      3. Assert 4 dropdown selectors in Your Setting section
      4. Assert "Your Gemstone" heading visible
      5. Assert 4 dropdown selectors in Your Gemstone section
      6. Assert at least 1 recommended gemstone card visible
    Expected Result: Full configurator rendered
    Evidence: .sisyphus/evidence/task-10-configurator.png

  Scenario: Gemstone filter updates recommendations
    Tool: Playwright
    Steps:
      1. Note current recommended gemstones count
      2. Change CLARITY dropdown to "IF"
      3. Assert recommended gemstones list updated (count may change or same)
      4. Assert all visible gemstone cards show clarity "IF"
    Expected Result: Dropdown change filters recommendations
    Evidence: .sisyphus/evidence/task-10-gemstone-filter.png
  ```

  **Commit**: YES (groups with 8, 9)

- [ ] 11. Detail Page Assembly — [slug] Route + Gallery + Configurator

  **What to do**:
  - Create `src/app/engagement-rings/[slug]/page.tsx`:
    - Server component that finds ring by slug from static data
    - If slug not found: call `notFound()` from Next.js (renders default 404)
    - If found: pass ring data to client component
    - `generateMetadata()` for SEO: title = ring name, description = ring description
    - `generateStaticParams()` to pre-generate all ring slug routes
  - Create `src/components/engagement-rings/ring-detail-content.tsx` ("use client"):
    - Two-column layout: Image Gallery (left, 55%) + Config Panel (right, 45%)
    - "← BROWSE OTHER SETTINGS" back link at top (links to /engagement-rings)
    - **Left column**: ImageGallery component (from Task 9)
    - **Right column**:
      - Ring name (h1, font-heading, text-4xl)
      - Full title/subtitle (text-gray-400)
      - Price: "$X,XXX USD (SETTING ONLY)" (text-[#D4AF37])
      - Description paragraph
      - Reviews badge (static: "⭐ 5.0 - X reviews")
      - Separator
      - RingConfigurator component (from Task 10)
    - Below fold: trust badges, specs table, ring story/description
  - Specs table: Average side stones, band width, center stone size, claw count, estimated weight, resizing info
  - Trust badges: "Lifetime Warranty", "Free Resizing", "Free Shipping", "Ethically Sourced"

  **Must NOT do**:
  - Do NOT add "Add to Cart" / "Buy Now" / "Enquire" buttons
  - Do NOT add engraving or timeline options
  - Do NOT fetch from Supabase
  - Do NOT modify Navbar
  - Do NOT use `text-gold` — use `text-[#D4AF37]`

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: [`shadcn-ui`]

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Wave 4 (sequential — needs 8, 9, 10)
  - **Blocks**: Tasks 12, 13
  - **Blocked By**: Tasks 8, 9, 10

  **References**:
  - `src/app/product/[id]/page.tsx` — Existing product detail layout (two-column grid pattern)
  - `src/app/jewellery/page.tsx` — Suspense wrapper pattern
  - `src/data/engagement-rings.ts` (from Task 2) — Ring data with specs, images, options
  - `src/components/engagement-rings/image-gallery.tsx` (from Task 9) — Gallery component
  - `src/components/engagement-rings/ring-configurator.tsx` (from Task 10) — Configurator component
  - Cullen detail page layout: image left, config right, specs below

  **Acceptance Criteria**:
  - [ ] `/engagement-rings/[valid-slug]` loads with gallery + configurator
  - [ ] `/engagement-rings/invalid-slug` shows 404
  - [ ] Back link navigates to /engagement-rings listing
  - [ ] SEO metadata generates correctly (title = ring name)
  - [ ] Specs table displays ring technical details
  - [ ] Trust badges display below configurator
  - [ ] `npm run build` passes (static params generate)

  **QA Scenarios:**
  ```
  Scenario: Detail page loads correctly
    Tool: Playwright
    Preconditions: Dev server running
    Steps:
      1. Navigate to http://localhost:3000/engagement-rings/[first-ring-slug]
      2. Assert ring name heading visible (h1)
      3. Assert image gallery visible (main image + thumbnails)
      4. Assert "Your Setting" section visible
      5. Assert "Your Gemstone" section visible
      6. Assert price displayed with "$" and "USD"
      7. Screenshot full page
    Expected Result: Complete detail page with all sections
    Evidence: .sisyphus/evidence/task-11-detail-page.png

  Scenario: 404 for invalid slug
    Tool: Playwright
    Steps:
      1. Navigate to http://localhost:3000/engagement-rings/this-ring-does-not-exist
      2. Assert 404 page renders (status 404 or "not found" text)
    Expected Result: 404 page shown
    Evidence: .sisyphus/evidence/task-11-404.png

  Scenario: Back navigation works
    Tool: Playwright
    Steps:
      1. Navigate to detail page
      2. Click "BROWSE OTHER SETTINGS" link
      3. Assert URL is /engagement-rings (listing page)
    Expected Result: Back to listing
    Evidence: .sisyphus/evidence/task-11-back-nav.png
  ```

  **Commit**: YES (groups with 12, 13)
  - Message: `feat(engagement-rings): add detail page, mobile optimization, and integration tests`
  - Pre-commit: `npm run build`

- [ ] 12. Responsive + Mobile Optimization

  **What to do**:
  - Review and optimize ALL engagement-rings components for mobile breakpoints:
    - **Filter bar**: horizontal scroll with scroll indicators (fade on edges), scroll-snap-x
    - **Ring grid**: 1 column on xs (<480px), 2 columns on sm, 3 on md, 4 on lg
    - **Detail page**: stacked layout on mobile (image on top, config below)
    - **Image gallery**: main image full-width, thumbnails horizontal scroll below
    - **Configurator**: full-width dropdowns, adequate touch targets (min 44px height)
    - **Typography**: responsive text sizes (text-2xl md:text-4xl patterns)
  - Test all breakpoints: 375px (iPhone SE), 430px (iPhone 15), 768px (iPad), 1024px (laptop), 1440px (desktop)
  - Ensure no horizontal overflow on any viewport
  - Ensure filter bar scroll has `-webkit-overflow-scrolling: touch` for iOS

  **Must NOT do**:
  - Do NOT change desktop layout significantly
  - Do NOT add mobile-only features (drawer, bottom sheet, etc.)
  - Do NOT install responsive utility libraries

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: [`playwright`]

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Wave 4 (after Task 11)
  - **Blocks**: Task 13
  - **Blocked By**: Task 11

  **References**:
  - All `src/components/engagement-rings/*.tsx` files — Components to review for responsive
  - `src/app/bespoke/page.tsx:82-84` — Existing responsive pattern (`flex flex-col lg:grid lg:grid-cols-2`)
  - `src/components/shop-content.tsx` — Existing responsive grid pattern

  **Acceptance Criteria**:
  - [ ] No horizontal overflow at 375px, 430px, 768px, 1024px, 1440px viewports
  - [ ] Filter bar scrolls horizontally on mobile without breaking layout
  - [ ] Detail page stacks correctly on mobile
  - [ ] All touch targets >= 44px

  **QA Scenarios:**
  ```
  Scenario: Mobile listing page (375px)
    Tool: Playwright
    Steps:
      1. Set viewport to 375x812 (iPhone SE)
      2. Navigate to /engagement-rings
      3. Assert no horizontal scrollbar on body
      4. Assert filter bar is horizontally scrollable
      5. Assert ring grid shows 1-2 columns
      6. Screenshot
    Expected Result: Clean mobile layout, no overflow
    Evidence: .sisyphus/evidence/task-12-mobile-listing.png

  Scenario: Mobile detail page (375px)
    Tool: Playwright
    Steps:
      1. Set viewport to 375x812
      2. Navigate to /engagement-rings/[first-ring-slug]
      3. Assert image gallery full-width at top
      4. Assert configurator below image, full-width
      5. Assert all dropdowns are full-width and tappable
      6. Screenshot
    Expected Result: Stacked mobile layout
    Evidence: .sisyphus/evidence/task-12-mobile-detail.png

  Scenario: Tablet layout (768px)
    Tool: Playwright
    Steps:
      1. Set viewport to 768x1024
      2. Navigate to /engagement-rings
      3. Assert ring grid shows 3 columns
      4. Navigate to detail page
      5. Assert two-column layout (gallery + config)
      6. Screenshot both pages
    Expected Result: Tablet layout correct
    Evidence: .sisyphus/evidence/task-12-tablet.png
  ```

  **Commit**: YES (groups with 11, 13)

- [ ] 13. Integration Tests + Build Verification

  **What to do**:
  - Create `src/__tests__/engagement-rings-integration.test.ts`:
    - Test: all rings in data have valid slugs (no duplicates, URL-safe)
    - Test: all rings have at least 1 image URL
    - Test: all rings have valid price > 0
    - Test: all filter options in ring-filters.ts have unique values
    - Test: filterRings with real data returns expected results for each category
    - Test: all gemstone recommended options have valid image URLs
    - Test: ring slug lookup returns correct ring
    - Test: invalid slug returns undefined/null
  - Run full test suite: `npx vitest run`
  - Run TypeScript check: `npx tsc --noEmit`
  - Run build: `npm run build`
  - Verify static generation works: `generateStaticParams` generates all slug routes

  **Must NOT do**:
  - Do NOT write Playwright tests here (Final Wave handles that)
  - Do NOT modify source files (test only)

  **Recommended Agent Profile**:
  - **Category**: `deep`
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Wave 4 (after Task 12)
  - **Blocks**: Final Wave (F1-F4)
  - **Blocked By**: Tasks 1, 8, 11, 12

  **References**:
  - `src/data/engagement-rings.ts` — Ring data to validate
  - `src/data/ring-filters.ts` — Filter options to validate
  - `src/data/gemstone-options.ts` — Gemstone data to validate
  - `src/lib/ring-filters.ts` — Filter functions to integration test
  - `src/lib/gemstone-utils.ts` — Gemstone filter to integration test

  **Acceptance Criteria**:
  - [ ] `npx vitest run` — ALL tests pass (unit + integration)
  - [ ] `npx tsc --noEmit` — exit code 0
  - [ ] `npm run build` — exit code 0, all routes generated

  **QA Scenarios:**
  ```
  Scenario: Full test suite passes
    Tool: Bash
    Steps:
      1. Run `npx vitest run`
      2. Assert exit code 0
      3. Assert output shows 0 failures
    Expected Result: All tests pass
    Evidence: .sisyphus/evidence/task-13-full-tests.txt

  Scenario: Production build succeeds
    Tool: Bash
    Steps:
      1. Run `npm run build`
      2. Assert exit code 0
      3. Assert output contains "Generating static pages"
      4. Assert engagement-rings routes generated
    Expected Result: Clean production build
    Evidence: .sisyphus/evidence/task-13-build.txt

  Scenario: TypeScript has zero errors
    Tool: Bash
    Steps:
      1. Run `npx tsc --noEmit`
      2. Assert exit code 0
    Expected Result: Zero type errors
    Evidence: .sisyphus/evidence/task-13-tsc.txt
  ```

  **Commit**: YES (groups with 11, 12)
## Final Verification Wave (MANDATORY — after ALL implementation tasks)

> 4 review agents run in PARALLEL. ALL must APPROVE. Rejection → fix → re-run.

- [ ] F1. **Plan Compliance Audit** — `oracle`
  Read the plan end-to-end. For each "Must Have": verify implementation exists (read file, curl endpoint, run command). For each "Must NOT Have": search codebase for forbidden patterns — reject with file:line if found. Check evidence files exist in .sisyphus/evidence/. Compare deliverables against plan.
  Output: `Must Have [N/N] | Must NOT Have [N/N] | Tasks [N/N] | VERDICT: APPROVE/REJECT`

- [ ] F2. **Code Quality Review** — `unspecified-high`
  Run `npx tsc --noEmit` + `npx vitest run` + check lint. Review all changed files for: `as any`/`@ts-ignore`, empty catches, console.log in prod, commented-out code, unused imports. Check AI slop: excessive comments, over-abstraction, generic variable names. Verify `text-[#D4AF37]` used instead of `text-gold`.
  Output: `Build [PASS/FAIL] | Tests [N pass/N fail] | Files [N clean/N issues] | VERDICT`

- [ ] F3. **Real QA via Playwright** — `unspecified-high` (+ `playwright` skill)
  Start from clean state. Open `/engagement-rings` — verify all 5 filter categories render. Click filters → verify URL updates + grid filters. Navigate to detail page → verify image gallery + Your Setting + Your Gemstone sections. Test mobile viewport. Test back button. Test invalid slug → 404. Save screenshots to `.sisyphus/evidence/final-qa/`.
  Output: `Scenarios [N/N pass] | Screenshots [N captured] | VERDICT`

- [ ] F4. **Scope Fidelity Check** — `deep`
  For each task: read "What to do", read actual code. Verify 1:1 — everything specified was built, nothing extra. Check NO enquiry form exists. Check NO Supabase imports in engagement-rings. Check NO CartContext usage. Check NO Navbar modifications. Flag any unaccounted files.
  Output: `Tasks [N/N compliant] | Forbidden [CLEAN/N issues] | VERDICT`

---

## Commit Strategy

| After Task(s) | Commit Message | Files |
|---|---|---|
| 1 | `chore: setup vitest test infrastructure` | `vitest.config.ts`, `package.json` |
| 2 | `feat(engagement-rings): add static ring, filter, and gemstone data` | `src/data/engagement-rings.ts`, `src/data/ring-filters.ts`, `src/data/gemstone-options.ts` |
| 3 | `chore: install missing shadcn components and update image domains` | `src/components/ui/*`, `next.config.ts` |
| 4-7 | `feat(engagement-rings): add filter logic, ring card, and gemstone components with tests` | `src/components/engagement-rings/*`, `__tests__/*` |
| 8-10 | `feat(engagement-rings): add listing page with filters, gallery, and configurator` | `src/app/engagement-rings/*`, `src/components/engagement-rings/*` |
| 11-13 | `feat(engagement-rings): add detail page, mobile optimization, and integration tests` | `src/app/engagement-rings/[slug]/*`, `__tests__/*` |

---

## Success Criteria

### Verification Commands
```bash
npm run build          # Expected: exit code 0, no errors
npx tsc --noEmit       # Expected: exit code 0, no type errors
npx vitest run         # Expected: all tests pass, 0 failures
```

### Final Checklist
- [ ] All 5 filter categories functional on listing page
- [ ] URL sync works two-way (filter ↔ URL ↔ back button)
- [ ] Detail page loads with image gallery + configurator
- [ ] "No results" empty state displays when filters match nothing
- [ ] 404 page for invalid ring slugs
- [ ] Mobile responsive (horizontal scroll filters, stacked detail)
- [ ] All images load from Cullen CDN
- [ ] Dark theme consistent throughout (no white backgrounds, no text-gold)
- [ ] Zero Supabase imports in engagement-rings directory
- [ ] Zero CartContext references in engagement-rings directory
- [ ] All tests pass
- [ ] Build succeeds
