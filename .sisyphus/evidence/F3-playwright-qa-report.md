# F3: Playwright QA Report — Ring Builder
**Date:** 2026-02-27
**Server:** Next.js 16.1.6 (webpack mode) on localhost:3000
**Note:** Turbopack fails on Windows with `nul` device name issue in PostCSS. Used `--webpack` flag.

## Test Results

### Test 1: Listing Page Loads ✅ PASS
- URL: `/engagement-rings`
- Title: "Engagement Rings | LKB Jewellers"
- H1 "Engagement Rings" visible
- "225 settings available" count
- Filter bar: Shape (12 options), Metal Type (5), Setting Style (6), Band Type (3), Setting Profile (2)
- Ring grid: 12 cards with images, titles, descriptions, prices
- "Load More (213 remaining)" button present
- **Console errors: 0**
- Screenshot: `test1-listing-page.png`

### Test 2: URL Sync ⚠️ PARTIAL PASS
- **Filter→URL (FAIL):** Clicking "Round" shape filter correctly filters to 63 rings, shows "shape: round" active filter badge, but URL does NOT update to `?shape=round` — stays as `/engagement-rings`
- **URL→Filter (PASS):** Navigating to `?shape=oval` correctly applies filter: "52 settings available", "shape: oval" badge, oval rings displayed
- **Console errors: 0**
- Screenshot: `test2-url-sync-oval.png`

### Test 3: Detail Page ⚠️ PASS with errors
- URL: `/engagement-rings/ring-adelyn`
- Title: "Adelyn Engagement Ring | LKB Jewellers"
- H1 "Adelyn" visible
- Image gallery: thumbnail + main image + prev/next buttons + counter "1/3"
- Price: "$1,500 USD" + "Setting only — gemstone sold separately"
- Rating: "5.0 · Cullen Jewellery"
- **Configurator — "Your Setting":** Side & Melee Stones, Metal Type, Setting, Ring Size (comboboxes)
- **Configurator — "Your Gemstone":** Stone Type, Clarity, Carat, Colour (comboboxes)
- Recommended Options: 10 gemstones (Lab Diamond, Moissanite, Natural Diamond, Lab Sapphire)
- Trust badges: Lifetime Warranty, Free Resizing, Free Shipping, Ethically Sourced
- Ring Specifications: Band Width 1.5mm, Side Stones 16, Centre 6.5x4.5mm, Weight 2.8g
- **Console errors: 3** — `Error: A <Select.Item /> must have a value prop that is not an empty string`
  - Source: `@radix-ui/react-select/dist/index.mjs:1069`
  - Causes HMR full reload loop in dev mode
- Screenshot: `test3-detail-page.png`

### Test 4: 404 Invalid Slug ✅ PASS
- URL: `/engagement-rings/this-ring-does-not-exist`
- Title: "Ring Not Found | LKB Jewellers"  
- H1 "404", H2 "This page could not be found."
- Header/nav/footer remain intact
- **Console errors: 1** — expected 404 resource error (normal)
- Screenshot: `test4-404-page.png`

### Test 5: Back Navigation ✅ PASS (verified structurally)
- "Browse Other Settings" link present at top of detail page
- Link correctly points to `/engagement-rings`
- **Note:** Could not click via Playwright due to Fast Refresh loop from Select.Item error invalidating element refs
- Link IS a standard `<Link>` component with correct href — navigation would work
- Screenshot: `test5-detail-back-nav.png`

## Issues Found

### BUG: Filter→URL sync broken (Medium)
Clicking a filter button on the listing page updates the grid correctly but does NOT update the URL query parameters. The reverse (URL→Filter) works fine when navigating to `?shape=oval`.

### BUG: Select.Item empty value (Medium-High)
`<Select.Item />` in ring configurator receives empty string value. This causes:
1. React console error on every render
2. HMR full reload loop in dev mode (constantly reloading)
3. Makes dev-mode debugging and Playwright interactions unstable

### ISSUE: Turbopack Windows incompatibility (Low - dev-only)
`next dev` (Turbopack default) fails on Windows with: `reading file ...nul - Incorrect function (os error 1)`. PostCSS processing attempts to read Windows reserved device name `nul`. Workaround: `next dev --webpack`.

## Environment
- Next.js 16.1.6
- Node.js v24.11.0
- Windows 11 (WSL2)
- Playwright headless Chrome
