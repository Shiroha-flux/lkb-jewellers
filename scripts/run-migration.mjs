#!/usr/bin/env node
/**
 * Script untuk menjalankan migrasi gambar ke Supabase Storage
 * Memanggil Edge Function migrate-ring-images secara bertahap
 * 
 * Usage: node scripts/run-migration.mjs [mode] [startOffset]
 *   mode: 'failed' (default) = hanya ring yang masih Cullen CDN, 'all' = semua
 *   startOffset: offset awal (default 0)
 */

const EDGE_FUNCTION_URL = 'https://kehdxvjhlkxgzpehnjlv.supabase.co/functions/v1/migrate-ring-images';
const BATCH_SIZE = 3; // Kecil agar tidak timeout
const TOTAL_RINGS = 225;
const TOTAL_GEMSTONES = 10;
const DELAY_MS = 5000; // 5 detik antar batch
const MAX_RETRIES = 3;

const mode = process.argv[2] || 'failed';
const startOffset = parseInt(process.argv[3] || '0', 10);
const total = 225; // total rings

async function runBatch(offset, retryCount = 0) {
  try {
    const res = await fetch(EDGE_FUNCTION_URL, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ batchSize: BATCH_SIZE, offset, mode }),
      signal: AbortSignal.timeout(90000),
    });

    if (!res.ok) {
      const text = await res.text();
      if (res.status === 502 && retryCount < MAX_RETRIES) {
        console.log(`   Retry ${retryCount + 1}/${MAX_RETRIES} after 502...`);
        await sleep(10000);
        return runBatch(offset, retryCount + 1);
      }
      throw new Error(`HTTP ${res.status}: ${text.substring(0, 200)}`);
    }

    return res.json();
  } catch (err) {
    if (err.name === 'TimeoutError' && retryCount < MAX_RETRIES) {
      console.log(`   Retry ${retryCount + 1}/${MAX_RETRIES} after timeout...`);
      await sleep(10000);
      return runBatch(offset, retryCount + 1);
    }
    throw err;
  }
}

async function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function main() {
  console.log(`\n🚀 Memulai migrasi gambar ke Supabase Storage`);
  console.log(`   Mode: ${mode}`);
  console.log(`   Total: ${total} items`);
  console.log(`   Batch size: ${BATCH_SIZE}`);
  console.log(`   Start offset: ${startOffset}\n`);

  let totalProcessed = 0;
  let totalSucceeded = 0;
  let totalFailed = 0;
  let totalSkipped = 0;
  const allErrors = [];

  for (let offset = startOffset; offset < total; offset += BATCH_SIZE) {
    const batchNum = Math.floor((offset - startOffset) / BATCH_SIZE) + 1;
    const totalBatches = Math.ceil((total - startOffset) / BATCH_SIZE);
    
    process.stdout.write(`Batch ${batchNum}/${totalBatches} (offset ${offset})... `);
    
    try {
      const result = await runBatch(offset);
      
      totalProcessed += result.processed;
      totalSucceeded += result.succeeded;
      totalFailed += result.failed;
      totalSkipped += result.skipped || 0;
      allErrors.push(...(result.errors || []));
      
      console.log(`✅ ${result.succeeded} berhasil, ${result.failed} gagal, ${result.skipped || 0} dilewati`);
      
      if (result.errors?.length > 0) {
        console.log(`   ⚠️  Errors: ${result.errors.join(', ')}`);
      }
    } catch (err) {
      console.log(`❌ Error: ${err.message}`);
      allErrors.push(`batch-${offset}: ${err.message}`);
    }

    // Delay antar batch untuk menghindari rate limiting
    if (offset + BATCH_SIZE < total) {
      await sleep(DELAY_MS);
    }
  }

  console.log(`\n📊 HASIL MIGRASI:`);
  console.log(`   Total diproses: ${totalProcessed}`);
  console.log(`   Berhasil: ${totalSucceeded}`);
  console.log(`   Gagal: ${totalFailed}`);
  console.log(`   Dilewati: ${totalSkipped}`);
  
  if (allErrors.length > 0) {
    console.log(`\n⚠️  Errors (${allErrors.length}):`);
    allErrors.forEach(e => console.log(`   - ${e}`));
  }
  
  console.log(`\n✨ Migrasi selesai!`);
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
