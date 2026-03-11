import { chromium } from 'playwright';
import { mkdirSync } from 'fs';

const EVIDENCE_DIR = '.sisyphus/evidence/final-qa';
mkdirSync(EVIDENCE_DIR, { recursive: true });

const results = [];

async function run() {
  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 } });
  const page = await context.newPage();
  page.setDefaultTimeout(30000);

  // ===== SCENARIO 1: No price text on ring cards =====
  console.log('\n=== SCENARIO 1: No price text on ring cards ===');
  try {
    await page.goto('http://localhost:3000/engagement-rings', { waitUntil: 'load', timeout: 60000 });
    await page.waitForTimeout(5000);
    
    const priceTexts = await page.$$eval('*', els => {
      const matches = [];
      for (const el of els) {
        const text = el.textContent || '';
        if (/Starting\s+\$[\d,]+\s*USD/i.test(text) && el.children.length === 0) {
          matches.push(text.trim().substring(0, 100));
        }
      }
      return matches;
    });
    
    const hasPriceText = priceTexts.length > 0;
    console.log(`Price texts found: ${priceTexts.length}`);
    if (hasPriceText) console.log('FOUND:', priceTexts);
    
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-no-price.png`, fullPage: false });
    results.push({ scenario: 1, name: 'No price text on ring cards', pass: !hasPriceText, detail: hasPriceText ? `Found ${priceTexts.length} price texts` : 'No price text found on any card' });
  } catch (e) {
    console.error('Scenario 1 error:', e.message);
    results.push({ scenario: 1, name: 'No price text on ring cards', pass: false, detail: e.message });
  }

  // ===== SCENARIO 2: Ring sizes F-Z in configurator =====
  console.log('\n=== SCENARIO 2: Ring sizes F-Z in configurator ===');
  try {
    await page.goto('http://localhost:3000/engagement-rings/ring-adelyn', { waitUntil: 'load', timeout: 60000 });
    await page.waitForTimeout(5000);
    
    // Specifically check the Ring Size ConfigRow section
    const sizeInfo = await page.evaluate(() => {
      // Find the "Ring Size" label in the configurator
      const labels = document.querySelectorAll('span');
      let ringSizeContainer = null;
      
      for (const label of labels) {
        if (/^ring\s*size$/i.test(label.textContent?.trim() || '')) {
          // Walk up to find the ConfigRow container
          let parent = label.parentElement;
          for (let i = 0; i < 5 && parent; i++) {
            // ConfigRow has flex-col sm:flex-row layout
            if (parent.classList.contains('py-4') || parent.querySelector('[class*="flex-wrap"]')) {
              ringSizeContainer = parent;
              break;
            }
            parent = parent.parentElement;
          }
          break;
        }
      }
      
      if (!ringSizeContainer) {
        return { found: false, sizes: [], error: 'Ring Size container not found' };
      }
      
      // Get all pill buttons within this container
      const buttons = ringSizeContainer.querySelectorAll('button');
      const sizes = [];
      for (const btn of buttons) {
        const text = btn.textContent?.trim();
        // Ring sizes are single uppercase letters
        if (text && /^[A-Z]$/.test(text)) {
          sizes.push(text);
        }
      }
      
      return { 
        found: true, 
        sizes,
        first: sizes[0],
        last: sizes[sizes.length - 1],
        hasD: sizes.includes('D'), 
        hasE: sizes.includes('E'), 
        hasF: sizes.includes('F'), 
        hasZ: sizes.includes('Z'),
        count: sizes.length
      };
    });
    
    console.log('Ring Size section found:', sizeInfo.found);
    console.log('Sizes:', sizeInfo.sizes);
    console.log(`First: ${sizeInfo.first}, Last: ${sizeInfo.last}`);
    console.log(`Has F: ${sizeInfo.hasF}, Has Z: ${sizeInfo.hasZ}, Has D: ${sizeInfo.hasD}, Has E: ${sizeInfo.hasE}`);
    
    const sizesPass = sizeInfo.found && sizeInfo.hasF && sizeInfo.hasZ && !sizeInfo.hasD && !sizeInfo.hasE;
    
    // Scroll to Ring Size section for screenshot
    await page.evaluate(() => {
      const labels = document.querySelectorAll('span');
      for (const label of labels) {
        if (/^ring\s*size$/i.test(label.textContent?.trim() || '')) {
          label.scrollIntoView({ block: 'center' });
          break;
        }
      }
    });
    await page.waitForTimeout(500);
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-ring-sizes.png`, fullPage: false });
    
    results.push({ scenario: 2, name: 'Ring sizes F-Z', pass: sizesPass, detail: `${sizeInfo.count} sizes: ${sizeInfo.first}..${sizeInfo.last} | D:${sizeInfo.hasD} E:${sizeInfo.hasE}` });
  } catch (e) {
    console.error('Scenario 2 error:', e.message);
    results.push({ scenario: 2, name: 'Ring sizes F-Z', pass: false, detail: e.message });
  }

  // ===== SCENARIO 3: No Moissanite in configurator =====
  console.log('\n=== SCENARIO 3: No Moissanite in configurator ===');
  try {
    // Check Side Stone options specifically
    const stoneInfo = await page.evaluate(() => {
      // Find "Side & Melee Stones" section
      const labels = document.querySelectorAll('span');
      let sideStoneContainer = null;
      
      for (const label of labels) {
        if (/side.*melee.*stones/i.test(label.textContent?.trim() || '')) {
          let parent = label.parentElement;
          for (let i = 0; i < 5 && parent; i++) {
            if (parent.classList.contains('py-4')) {
              sideStoneContainer = parent;
              break;
            }
            parent = parent.parentElement;
          }
          break;
        }
      }
      
      const sideStoneOptions = [];
      if (sideStoneContainer) {
        const buttons = sideStoneContainer.querySelectorAll('button');
        for (const btn of buttons) {
          const text = btn.textContent?.trim();
          if (text && text.length > 2) sideStoneOptions.push(text);
        }
      }
      
      // Also check Stone Type section
      let stoneTypeContainer = null;
      for (const label of labels) {
        if (/^stone\s*type$/i.test(label.textContent?.trim() || '')) {
          let parent = label.parentElement;
          for (let i = 0; i < 5 && parent; i++) {
            if (parent.classList.contains('py-4')) {
              stoneTypeContainer = parent;
              break;
            }
            parent = parent.parentElement;
          }
          break;
        }
      }
      
      const stoneTypeOptions = [];
      if (stoneTypeContainer) {
        const buttons = stoneTypeContainer.querySelectorAll('button');
        for (const btn of buttons) {
          const text = btn.textContent?.trim();
          if (text && text.length > 2) stoneTypeOptions.push(text);
        }
      }
      
      const allOptions = [...sideStoneOptions, ...stoneTypeOptions];
      const hasMoissanite = allOptions.some(o => /moissanite/i.test(o));
      const hasLabGrown = allOptions.some(o => /lab\s*grown\s*diamond/i.test(o));
      const hasNatural = allOptions.some(o => /natural\s*diamond/i.test(o));
      
      return { sideStoneOptions, stoneTypeOptions, hasMoissanite, hasLabGrown, hasNatural };
    });
    
    console.log('Side Stone options:', stoneInfo.sideStoneOptions);
    console.log('Stone Type options:', stoneInfo.stoneTypeOptions);
    console.log(`Moissanite: ${stoneInfo.hasMoissanite}, Lab Grown: ${stoneInfo.hasLabGrown}, Natural: ${stoneInfo.hasNatural}`);
    
    const noMoissanitePass = !stoneInfo.hasMoissanite && stoneInfo.hasLabGrown && stoneInfo.hasNatural;
    
    // Scroll to side stone section
    await page.evaluate(() => {
      const labels = document.querySelectorAll('span');
      for (const label of labels) {
        if (/side.*melee.*stones/i.test(label.textContent?.trim() || '')) {
          label.scrollIntoView({ block: 'center' });
          break;
        }
      }
    });
    await page.waitForTimeout(500);
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-no-moissanite.png`, fullPage: false });
    
    results.push({ scenario: 3, name: 'No Moissanite in configurator', pass: noMoissanitePass, detail: `Side stones: [${stoneInfo.sideStoneOptions.join(', ')}] | Stone types: [${stoneInfo.stoneTypeOptions.join(', ')}]` });
  } catch (e) {
    console.error('Scenario 3 error:', e.message);
    results.push({ scenario: 3, name: 'No Moissanite in configurator', pass: false, detail: e.message });
  }

  // ===== SCENARIO 4: Clarity education section =====
  console.log('\n=== SCENARIO 4: Clarity education section ===');
  try {
    const clarityInfo = await page.evaluate(() => {
      const bodyText = document.body.innerText;
      const hasClaritySection = /understanding\s+diamond\s+clarity/i.test(bodyText);
      
      const grades = ['FL', 'IF', 'VVS1', 'VVS2', 'VS1', 'VS2', 'SI1', 'SI2'];
      const foundGrades = grades.filter(g => bodyText.includes(g));
      
      return { hasClaritySection, foundGrades, gradeCount: foundGrades.length };
    });
    
    console.log('Clarity section:', clarityInfo.hasClaritySection);
    console.log(`Grades: ${clarityInfo.gradeCount}/8 — ${clarityInfo.foundGrades.join(', ')}`);
    
    await page.evaluate(() => {
      const headings = document.querySelectorAll('h3');
      for (const h of headings) {
        if (/understanding\s+diamond\s+clarity/i.test(h.textContent || '')) {
          h.scrollIntoView({ block: 'start' });
          return;
        }
      }
    });
    await page.waitForTimeout(500);
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-clarity-section.png`, fullPage: false });
    
    const clarityPass = clarityInfo.hasClaritySection && clarityInfo.gradeCount === 8;
    results.push({ scenario: 4, name: 'Clarity education section', pass: clarityPass, detail: `${clarityInfo.gradeCount}/8 grades (${clarityInfo.foundGrades.join(', ')})` });
  } catch (e) {
    console.error('Scenario 4 error:', e.message);
    results.push({ scenario: 4, name: 'Clarity education section', pass: false, detail: e.message });
  }

  // ===== SCENARIO 5: Ring size guide section =====
  console.log('\n=== SCENARIO 5: Ring size guide section ===');
  try {
    const sizeGuideInfo = await page.evaluate(() => {
      const bodyText = document.body.innerText;
      const hasSizeGuide = /ring\s+size\s+guide/i.test(bodyText);
      const hasUK = /\bUK\s+Size\b/.test(bodyText);
      const hasUS = /\bUS\s+Size\b/.test(bodyText);
      const hasEU = /\bEU\s+Size\b/.test(bodyText);
      
      // Check table has F-Z conversion
      const hasConversionTable = /\bF\b.*\b3\b.*\b46\b/.test(bodyText) && /\bZ\b.*\b13\b.*\b67/.test(bodyText);
      
      return { hasSizeGuide, hasUK, hasUS, hasEU, hasConversionTable };
    });
    
    console.log('Size guide:', sizeGuideInfo.hasSizeGuide);
    console.log(`UK: ${sizeGuideInfo.hasUK}, US: ${sizeGuideInfo.hasUS}, EU: ${sizeGuideInfo.hasEU}`);
    console.log('Conversion table:', sizeGuideInfo.hasConversionTable);
    
    await page.evaluate(() => {
      const headings = document.querySelectorAll('h3');
      for (const h of headings) {
        if (/ring\s+size\s+guide/i.test(h.textContent || '')) {
          h.scrollIntoView({ block: 'start' });
          return;
        }
      }
    });
    await page.waitForTimeout(500);
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-size-guide.png`, fullPage: false });
    
    const sizeGuidePass = sizeGuideInfo.hasSizeGuide && sizeGuideInfo.hasUK && sizeGuideInfo.hasUS && sizeGuideInfo.hasEU;
    results.push({ scenario: 5, name: 'Ring size guide section', pass: sizeGuidePass, detail: `Guide: ${sizeGuideInfo.hasSizeGuide}, UK/US/EU headers: ${sizeGuideInfo.hasUK}/${sizeGuideInfo.hasUS}/${sizeGuideInfo.hasEU}` });
  } catch (e) {
    console.error('Scenario 5 error:', e.message);
    results.push({ scenario: 5, name: 'Ring size guide section', pass: false, detail: e.message });
  }

  // ===== SCENARIO 6: Shape filters work correctly =====
  console.log('\n=== SCENARIO 6: Shape filters (Pear) ===');
  try {
    await page.goto('http://localhost:3000/engagement-rings', { waitUntil: 'load', timeout: 60000 });
    await page.waitForTimeout(5000);
    
    // Count rings before filter
    const beforeCount = await page.evaluate(() => {
      return document.querySelectorAll('a[href*="/engagement-rings/ring-"]').length;
    });
    console.log('Rings before filter:', beforeCount);
    
    // Click Pear filter
    await page.getByText('Pear', { exact: true }).first().click();
    await page.waitForTimeout(3000);
    
    // Get filtered results
    const afterInfo = await page.evaluate(() => {
      const links = document.querySelectorAll('a[href*="/engagement-rings/ring-"]');
      const slugs = [];
      for (const link of links) {
        const href = link.getAttribute('href') || '';
        const slug = href.split('/').pop();
        if (slug && !slugs.includes(slug)) slugs.push(slug);
      }
      
      // Check URL
      const url = window.location.href;
      
      // Check if "Shape: Pear" active filter badge is visible
      const hasActiveFilter = document.body.innerText.includes('Shape: Pear');
      
      // Check page title
      const title = document.querySelector('h1')?.textContent?.trim();
      
      return { slugs, count: slugs.length, url, hasActiveFilter, title };
    });
    
    console.log(`After Pear filter: ${afterInfo.count} rings`);
    console.log('URL:', afterInfo.url);
    console.log('Active filter badge:', afterInfo.hasActiveFilter);
    console.log('Page title:', afterInfo.title);
    console.log('Sample slugs:', afterInfo.slugs.slice(0, 5));
    
    // Verify all results are pear-shaped by checking API
    const allPear = afterInfo.url.includes('shape=pear');
    const filterWorking = afterInfo.count > 0 && afterInfo.count < beforeCount && allPear && afterInfo.hasActiveFilter;
    
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-pear-filter.png`, fullPage: false });
    
    results.push({ scenario: 6, name: 'Shape filters (Pear)', pass: filterWorking, detail: `${beforeCount}→${afterInfo.count} rings, URL has shape=pear: ${allPear}, Active badge: ${afterInfo.hasActiveFilter}, Title: "${afterInfo.title}"` });
  } catch (e) {
    console.error('Scenario 6 error:', e.message);
    results.push({ scenario: 6, name: 'Shape filters (Pear)', pass: false, detail: e.message });
  }

  // ===== SUMMARY =====
  console.log('\n\n========== QA RESULTS ==========');
  const passed = results.filter(r => r.pass).length;
  const total = results.length;
  for (const r of results) {
    console.log(`${r.pass ? 'PASS' : 'FAIL'} | Scenario ${r.scenario}: ${r.name}`);
    console.log(`       ${r.detail}`);
  }
  console.log(`\nTotal: ${passed}/${total} passed`);
  console.log(`VERDICT: ${passed === total ? 'APPROVE' : 'REJECT'}`);
  console.log('================================');

  await browser.close();
}

run().catch(e => {
  console.error('Fatal error:', e);
  process.exit(1);
});
