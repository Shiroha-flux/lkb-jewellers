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
    results.push({ scenario: 1, name: 'No price text on ring cards', pass: !hasPriceText, detail: hasPriceText ? `Found ${priceTexts.length} price texts` : 'No price text found' });
  } catch (e) {
    console.error('Scenario 1 error:', e.message);
    results.push({ scenario: 1, name: 'No price text on ring cards', pass: false, detail: e.message });
  }

  // ===== SCENARIO 2: Ring sizes F-Z in configurator =====
  console.log('\n=== SCENARIO 2: Ring sizes F-Z in configurator ===');
  try {
    await page.goto('http://localhost:3000/engagement-rings/ring-adelyn', { waitUntil: 'load', timeout: 60000 });
    await page.waitForTimeout(5000);
    
    // Scroll to configurator
    await page.evaluate(() => {
      const els = document.querySelectorAll('h1, h2, h3, h4, h5, h6, p, span, div');
      for (const el of els) {
        if (/ring\s*configurator/i.test(el.textContent || '') && el.children.length < 5) {
          el.scrollIntoView({ block: 'center' });
          break;
        }
      }
    });
    await page.waitForTimeout(1000);
    
    const sizeInfo = await page.evaluate(() => {
      const sizeLabels = [];
      
      // Check all interactive elements for single-letter sizes
      const allEls = document.querySelectorAll('button, [role="option"], label, [data-size], span, div');
      for (const el of allEls) {
        const text = el.textContent?.trim();
        if (text && /^[A-Z](\s*[½¼¾])?$/.test(text) && text.length <= 3) {
          if (!sizeLabels.includes(text)) sizeLabels.push(text);
        }
      }
      
      // Check select options
      const selects = document.querySelectorAll('select');
      for (const sel of selects) {
        for (const opt of sel.options) {
          const text = opt.textContent?.trim();
          if (text && /^[A-Z](\s*[½¼¾])?$/.test(text) && text.length <= 3) {
            if (!sizeLabels.includes(text)) sizeLabels.push(text);
          }
        }
      }
      
      return { sizeLabels, hasD: sizeLabels.includes('D'), hasE: sizeLabels.includes('E'), hasF: sizeLabels.includes('F'), hasZ: sizeLabels.includes('Z') };
    });
    
    console.log('Size labels found:', sizeInfo.sizeLabels);
    console.log(`Has F: ${sizeInfo.hasF}, Has Z: ${sizeInfo.hasZ}, Has D: ${sizeInfo.hasD}, Has E: ${sizeInfo.hasE}`);
    
    const sizesPass = sizeInfo.hasF && sizeInfo.hasZ && !sizeInfo.hasD && !sizeInfo.hasE;
    
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-ring-sizes.png`, fullPage: false });
    results.push({ scenario: 2, name: 'Ring sizes F-Z', pass: sizesPass, detail: `Sizes: ${sizeInfo.sizeLabels.join(', ')} | F:${sizeInfo.hasF} Z:${sizeInfo.hasZ} D:${sizeInfo.hasD} E:${sizeInfo.hasE}` });
  } catch (e) {
    console.error('Scenario 2 error:', e.message);
    results.push({ scenario: 2, name: 'Ring sizes F-Z', pass: false, detail: e.message });
  }

  // ===== SCENARIO 3: No Moissanite in configurator =====
  console.log('\n=== SCENARIO 3: No Moissanite in configurator ===');
  try {
    // Still on ring-adelyn page - scroll to side stone section
    await page.evaluate(() => {
      const els = document.querySelectorAll('h1, h2, h3, h4, h5, h6, p, span, div, label');
      for (const el of els) {
        if (/side\s*stone/i.test(el.textContent || '') && el.children.length < 5) {
          el.scrollIntoView({ block: 'center' });
          break;
        }
      }
    });
    await page.waitForTimeout(500);
    
    const stoneInfo = await page.evaluate(() => {
      const bodyText = document.body.innerText;
      
      // Check for moissanite in interactive elements
      let configuratorMoissanite = false;
      const interactiveEls = document.querySelectorAll('button, select option, label, [role="radio"], [role="option"], [role="tab"]');
      for (const el of interactiveEls) {
        if (/moissanite/i.test(el.textContent || '')) {
          configuratorMoissanite = true;
          break;
        }
      }
      
      const hasLabGrown = /lab\s*grown\s*diamond/i.test(bodyText);
      const hasNatural = /natural\s*diamond/i.test(bodyText);
      
      // Collect all stone-related option texts
      const stoneOptions = [];
      const allEls = document.querySelectorAll('button, label, [role="radio"], [role="option"], [role="tab"], span');
      for (const el of allEls) {
        const text = el.textContent?.trim();
        if (text && /(diamond|moissanite)/i.test(text) && text.length < 50) {
          if (!stoneOptions.includes(text)) stoneOptions.push(text);
        }
      }
      
      return { configuratorMoissanite, hasLabGrown, hasNatural, stoneOptions };
    });
    
    console.log('Moissanite in configurator:', stoneInfo.configuratorMoissanite);
    console.log('Lab Grown Diamond:', stoneInfo.hasLabGrown);
    console.log('Natural Diamond:', stoneInfo.hasNatural);
    console.log('Stone options:', stoneInfo.stoneOptions);
    
    const noMoissanitePass = !stoneInfo.configuratorMoissanite && stoneInfo.hasLabGrown && stoneInfo.hasNatural;
    
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-no-moissanite.png`, fullPage: false });
    results.push({ scenario: 3, name: 'No Moissanite in configurator', pass: noMoissanitePass, detail: `Moissanite: ${stoneInfo.configuratorMoissanite}, Lab Grown: ${stoneInfo.hasLabGrown}, Natural: ${stoneInfo.hasNatural}` });
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
    
    console.log('Clarity section found:', clarityInfo.hasClaritySection);
    console.log('Grades found:', clarityInfo.foundGrades);
    
    await page.evaluate(() => {
      const allEls = document.querySelectorAll('h1, h2, h3, h4, h5, h6');
      for (const el of allEls) {
        if (/understanding\s+diamond\s+clarity/i.test(el.textContent || '')) {
          el.scrollIntoView({ block: 'start' });
          return;
        }
      }
    });
    await page.waitForTimeout(500);
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-clarity-section.png`, fullPage: false });
    
    const clarityPass = clarityInfo.hasClaritySection && clarityInfo.gradeCount === 8;
    results.push({ scenario: 4, name: 'Clarity education section', pass: clarityPass, detail: `Section: ${clarityInfo.hasClaritySection}, Grades: ${clarityInfo.gradeCount}/8 (${clarityInfo.foundGrades.join(', ')})` });
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
      const hasUK = /\bUK\b/.test(bodyText);
      const hasUS = /\bUS\b/.test(bodyText);
      const hasEU = /\bEU\b/.test(bodyText);
      
      return { hasSizeGuide, hasUK, hasUS, hasEU };
    });
    
    console.log('Size guide found:', sizeGuideInfo.hasSizeGuide);
    console.log(`UK: ${sizeGuideInfo.hasUK}, US: ${sizeGuideInfo.hasUS}, EU: ${sizeGuideInfo.hasEU}`);
    
    await page.evaluate(() => {
      const allEls = document.querySelectorAll('h1, h2, h3, h4, h5, h6');
      for (const el of allEls) {
        if (/ring\s+size\s+guide/i.test(el.textContent || '')) {
          el.scrollIntoView({ block: 'start' });
          return;
        }
      }
    });
    await page.waitForTimeout(500);
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-size-guide.png`, fullPage: false });
    
    const sizeGuidePass = sizeGuideInfo.hasSizeGuide && sizeGuideInfo.hasUK && sizeGuideInfo.hasUS && sizeGuideInfo.hasEU;
    results.push({ scenario: 5, name: 'Ring size guide section', pass: sizeGuidePass, detail: `Guide: ${sizeGuideInfo.hasSizeGuide}, UK: ${sizeGuideInfo.hasUK}, US: ${sizeGuideInfo.hasUS}, EU: ${sizeGuideInfo.hasEU}` });
  } catch (e) {
    console.error('Scenario 5 error:', e.message);
    results.push({ scenario: 5, name: 'Ring size guide section', pass: false, detail: e.message });
  }

  // ===== SCENARIO 6: Shape filters work correctly =====
  console.log('\n=== SCENARIO 6: Shape filters (Pear) ===');
  try {
    await page.goto('http://localhost:3000/engagement-rings', { waitUntil: 'load', timeout: 60000 });
    await page.waitForTimeout(5000);
    
    // Get all ring names before filter
    const beforeFilter = await page.evaluate(() => {
      const links = document.querySelectorAll('a[href*="ring-"]');
      return Array.from(links).map(l => l.textContent?.trim()).filter(t => t && t.length < 80);
    });
    console.log('Rings before filter:', beforeFilter.length);
    
    // Click Pear filter
    const pearBtn = page.getByText('Pear', { exact: true });
    const pearCount = await pearBtn.count();
    console.log('Pear buttons found:', pearCount);
    
    if (pearCount > 0) {
      await pearBtn.first().click();
      console.log('Clicked Pear filter');
      await page.waitForTimeout(2000);
    } else {
      // Try clicking by evaluating
      await page.evaluate(() => {
        const allEls = document.querySelectorAll('button, div, span, a, label');
        for (const el of allEls) {
          if (/^pear$/i.test(el.textContent?.trim() || '')) {
            el.click();
            return true;
          }
        }
        // Try parent click
        for (const el of allEls) {
          if (/pear/i.test(el.textContent?.trim() || '') && el.textContent.trim().length < 20) {
            el.click();
            return true;
          }
        }
        return false;
      });
      await page.waitForTimeout(2000);
    }
    
    // Check visible ring names after filter
    const afterFilter = await page.evaluate(() => {
      const links = document.querySelectorAll('a[href*="ring-"]');
      const names = [];
      for (const link of links) {
        const href = link.getAttribute('href') || '';
        const text = link.textContent?.trim();
        if (text && text.length < 80 && href.includes('/engagement-rings/ring-')) {
          names.push(text);
        }
      }
      // Deduplicate
      return [...new Set(names)];
    });
    
    console.log('Visible rings after Pear filter:', afterFilter);
    
    const expectedPear = ['ainsley', 'brooke', 'jacinta', 'polly'];
    const visibleLower = afterFilter.map(n => n?.toLowerCase() || '');
    const foundExpected = expectedPear.filter(name => visibleLower.some(v => v.includes(name)));
    
    console.log('Expected pear rings found:', foundExpected);
    
    await page.screenshot({ path: `${EVIDENCE_DIR}/f3-pear-filter.png`, fullPage: false });
    
    // Pass if filtered results are fewer than all AND contain expected pear rings
    const filterPass = foundExpected.length >= 2 && afterFilter.length < beforeFilter.length;
    results.push({ scenario: 6, name: 'Shape filters (Pear)', pass: filterPass, detail: `Before: ${beforeFilter.length} rings, After: ${afterFilter.length} rings. Found ${foundExpected.length}/4 expected: ${foundExpected.join(', ')}` });
  } catch (e) {
    console.error('Scenario 6 error:', e.message);
    results.push({ scenario: 6, name: 'Shape filters (Pear)', pass: false, detail: e.message });
  }

  // ===== SUMMARY =====
  console.log('\n\n========== QA RESULTS ==========');
  const passed = results.filter(r => r.pass).length;
  const total = results.length;
  for (const r of results) {
    console.log(`${r.pass ? 'PASS' : 'FAIL'} | Scenario ${r.scenario}: ${r.name} — ${r.detail}`);
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
