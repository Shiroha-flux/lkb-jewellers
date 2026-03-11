# Learnings — ring-filter-hover-remediation

## [2026-03-10] Plan Start
- Working directory: C:/Users/Imam/Documents/project/KERJAAN/flux/lkb-jewellers
- Build command: npm run build (or bun run build)
- Test command: bun test
- TypeScript check: bunx tsc --noEmit
- ring-image-dashboard plan COMPLETE — merged to main
- All changes are in main branch (no worktree)

## [2026-03-10] Task 7 & 8: Clarity Education + Ring Size Guide

### Pattern: Adding Education Sections to Detail Page
- Insert new sections AFTER the conditional specs block and BEFORE closing right-column div
- Each section preceded by `<Separator className="bg-zinc-800" />`
- `clarityOptions` imported from `@/data/gemstone-options` — 8 entries (SI1 to FL)
- Ring size table hardcoded inline (UK+US+EU) since RING_SIZES only contains UK values

### Design System Tokens Used
- `text-[#D4AF37]` — gold accent (grade labels)
- `text-white` + `font-heading` — section headings
- `text-gray-400` — body copy, `text-gray-500` — helper text, table headers
- `border-zinc-800` — borders/separators, `border-zinc-800/50` — row dividers

### Pre-existing TSC Errors
- `src/__tests__/ring-filters.test.ts` 6 errors about `metalOptions` — pre-existing, unrelated
