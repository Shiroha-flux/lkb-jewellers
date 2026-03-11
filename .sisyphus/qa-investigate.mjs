import { chromium } from 'playwright';
import { mkdirSync } from 'fs';

const EVIDENCE_DIR = '.sisyphus/evidence/final-qa';
mkdirSync(EVIDENCE_DIR, { recursive: true });

async function run() {
  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 } });
  const page = await context.newPage();
  page.setDefaultTimeout(30000);

  // ===== INVESTIGATE SCENARIO 2: Where are D and E sizes? =====
  console.log('\n=== INVESTIGATING: Ring sizes D and E location ===');
  await page.goto('http://localhost:3000/engagement-rings/ring-adelyn', { waitUntil: 'load', timeout: 60000 });
  await page.waitForTimeout(5000);

  // Find where D and E appear
  const deLocation = await page.evaluate(() => {
    const results = [];
    const allEls = document.querySelectorAll('button, span, div, td, th, label, option');
    for (const el of allEls) {
      const text = el.textContent?.trim();
      if (text === 'D' || text === 'E') {
        // Get parent context
        let parent = el.parentElement;
        let parentText = '';
        for (let i = 0; i < 3 && parent; i++) {
          parentText = parent.className || parent.tagName;
          parent = parent.parentElement;
        }
        results.push({
          letter: text,
          tag: el.tagName,
          className: el.className?.substring(0, 80),
          parentContext: parentText?.substring(0, 80),
          isButton: el.tagName === 'BUTTON',
          nearbyText: el.parentElement?.textContent?.trim()?.substring(0, 100)
        });
      }
    }
    return results;
  });
  
  console.log('D and E locations:');
  for (const loc of deLocation) {
    console.log(`  ${loc.letter}: <${loc.tag}> class="${loc.className}" parent="${loc.parentContext}" nearby="${loc.nearbyText}"`);
  }

  // Now check specifically in the configurator section
  const configuratorSizes = await page.evaluate(() => {
    // Find the Ring Configurator section
    let configuratorSection = null;
    const headings = document.querySelectorAll('h1, h2, h3, h4, h5, h6');
    for (const h of headings) {
      if (/ring\s*configurator/i.test(h.textContent || '')) {
        configuratorSection = h.parentElement;
        break;
      }
    }
    
    if (!configuratorSection) {
      // Try broader search
      const allEls = document.querySelectorAll('section, div');
      for (const el of allEls) {
        if (/ring\s*configurator/i.test(el.textContent || '') && el.querySelectorAll('button').length > 5) {
          configuratorSection = el;
          break;
        }
      }
    }
    
    if (!configuratorSection) return { found: false, sizes: [] };
    
    // Find Ring Size subsection within configurator
    let sizeSection = null;
    const labels = configuratorSection.querySelectorAll('label, h3, h4, h5, span, p, div');
    for (const l of labels) {
      if (/ring\s*size/i.test(l.textContent || '') && l.textContent.trim().length < 30) {
        sizeSection = l.parentElement;
        break;
      }
    }
    
    const searchIn = sizeSection || configuratorSection;
    const buttons = searchIn.querySelectorAll('button');
    const sizes = [];
    for (const btn of buttons) {
      const text = btn.textContent?.trim();
      if (text && /^[A-Z](\s*[½¼¾])?$/.test(text) && text.length <= 3) {
        sizes.push(text);
      }
    }
    
    return { found: true, hasSizeSection: !!sizeSection, sizes, configuratorHTML: configuratorSection?.className?.substring(0, 100) };
  });
  
  console.log('\nConfigurator sizes (buttons only):', configuratorSizes);

  // Screenshot the configurator section with sizes visible
  await page.evaluate(() => {
    const headings = document.querySelectorAll('h1, h2, h3, h4, h5, h6, span, p, label');
    for (const h of headings) {
      if (/ring\s*size/i.test(h.textContent || '') && h.textContent.trim().length < 30) {
        h.scrollIntoView({ block: 'start' });
        return;
      }
    }
  });
  await page.waitForTimeout(500);
  await page.screenshot({ path: `${EVIDENCE_DIR}/f3-ring-sizes.png`, fullPage: false });

  // ===== INVESTIGATE SCENARIO 6: Pear filter =====
  console.log('\n\n=== INVESTIGATING: Pear filter results ===');
  await page.goto('http://localhost:3000/engagement-rings', { waitUntil: 'load', timeout: 60000 });
  await page.waitForTimeout(5000);

  // Get all ring card info before filter
  const beforeInfo = await page.evaluate(() => {
    const cards = document.querySelectorAll('a[href*="/engagement-rings/ring-"]');
    const rings = [];
    for (const card of cards) {
      const href = card.getAttribute('href');
      // Get the ring name from the card
      const nameEl = card.querySelector('h2, h3, h4, [class*="name"], [class*="title"], p');
      const name = nameEl ? nameEl.textContent?.trim() : card.textContent?.trim()?.substring(0, 50);
      const slug = href?.split('/').pop();
      rings.push({ name, slug, href });
    }
    return rings;
  });
  
  console.log(`Before filter: ${beforeInfo.length} ring cards`);
  console.log('Sample:', beforeInfo.slice(0, 3));

  // Click Pear
  await page.getByText('Pear', { exact: true }).first().click();
  await page.waitForTimeout(2000);

  // Get ring info after filter
  const afterInfo = await page.evaluate(() => {
    const cards = document.querySelectorAll('a[href*="/engagement-rings/ring-"]');
    const rings = [];
    for (const card of cards) {
      const href = card.getAttribute('href');
      const slug = href?.split('/').pop();
      // Get all text content
      const allText = card.textContent?.trim();
      rings.push({ slug, text: allText?.substring(0, 80) });
    }
    return rings;
  });
  
  console.log(`\nAfter Pear filter: ${afterInfo.length} ring cards`);
  console.log('Slugs:', afterInfo.map(r => r.slug));
  
  // Check for expected pear rings by slug
  const expectedPearSlugs = ['ring-ainsley', 'ring-brooke', 'ring-jacinta', 'ring-polly'];
  const foundSlugs = expectedPearSlugs.filter(s => afterInfo.some(r => r.slug === s));
  console.log('Expected pear slugs found:', foundSlugs);
  console.log('Missing:', expectedPearSlugs.filter(s => !afterInfo.some(r => r.slug === s)));

  // Check what shapes are in the data
  const pageShapeInfo = await page.evaluate(() => {
    // Look for shape data in the page
    const bodyText = document.body.innerHTML;
    const shapeMatches = bodyText.match(/shape['":\s]+(pear|round|oval|cushion|emerald|marquise|princess|radiant|heart|asscher)/gi);
    return { shapeMatches: [...new Set(shapeMatches || [])].slice(0, 20) };
  });
  console.log('Shape references in page:', pageShapeInfo);

  await page.screenshot({ path: `${EVIDENCE_DIR}/f3-pear-filter.png`, fullPage: false });

  // Also check: is the URL updated?
  console.log('Current URL:', page.url());

  await browser.close();
}

run().catch(e => {
  console.error('Fatal error:', e);
  process.exit(1);
});
