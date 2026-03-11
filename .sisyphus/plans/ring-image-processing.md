# Ring Image Processing — Ganti Box Hijau → Hitam + Logo LKB

## TL;DR

> **Quick Summary**: Script Python untuk memproses gambar ring Cullen Jewellery:
> (1) ganti warna box hijau → hitam via OpenCV HSV masking (sudah bekerja),
> (2) hapus teks CULLEN di interior kotak → overlay logo LKB via PIL alpha compositing.
>
> **Deliverables**:
> - `scripts/step2_logo_overlay.py` — script step 2 (inpaint + logo overlay)
> - `scripts/full_pipeline.py` — gabungan step 1 + step 2
> - `scripts/output_step2.jpg` — hasil test 1 gambar yang sudah OK
>
> **Estimated Effort**: Short (1-2 jam)
> **Parallel Execution**: NO — sequential (test 1 gambar dulu, baru batch)
> **Critical Path**: Task 1 → Task 2 → Task 3

---

## Context

### Original Request
"Gimana caranya agar gambar yang saya kasih Cullennya diapus lalu boxnya ganti warna jadi hitam?
Logo cullennya ganti ke logo LKB. Test satu gambar dulu."

### Interview Summary
**Key Discussions**:
- User ingin test 1 gambar dulu sebelum batch processing
- User ingin pakai PIL/Python approach (bukan Gemini, free tier habis)
- Logo LKB ada di `public/white-logo.png` — background hitam solid, perlu dibuat transparan
- Step 1 (green→black) sudah selesai dan bekerja sempurna

**Research Findings**:
- `public/white-logo.png` ADA di filesystem lokal (belum di-commit ke git)
- Python 3.11.9 + PIL + OpenCV + NumPy sudah terinstall
- `scripts/output_step1.jpg` sudah ada (hasil step 1, siap untuk step 2)
- Posisi CULLEN: center ~50% horizontal, ~42% vertikal dari gambar
- Warna beige interior: #C2B9AA – #BDB4A5

### Metis Review
**Identified Gaps** (addressed):
- Logo file tidak ada di Git repo → dikonfirmasi ada di filesystem lokal ✅
- Service role key belum ada → user minta test 1 gambar dulu, upload belum relevan ✅
- 3.554 gambar total → scope dibatasi ke "test 1 gambar dulu" sesuai permintaan user ✅

---

## Work Objectives

### Core Objective
Buat script Python yang berhasil mengolah `scripts/output_step1.jpg`:
1. Inpaint area teks CULLEN dengan warna beige median dari sekitar area
2. Overlay logo LKB (transparan) di posisi yang sama

### Concrete Deliverables
- `scripts/step2_logo_overlay.py` — script step 2 yang berdiri sendiri
- `scripts/full_pipeline.py` — gabungan step 1 + step 2 dalam satu script
- `scripts/output_step2.jpg` — hasil visual yang disetujui user

### Definition of Done
- [ ] `python scripts/step2_logo_overlay.py` berjalan tanpa error
- [ ] File `scripts/output_step2.jpg` ada dan bisa dibuka
- [ ] Visual: teks CULLEN tidak terlihat, logo LKB terlihat jelas di area beige

### Must Have
- Hapus background hitam dari logo (pixel rgb < 40 → alpha = 0)
- Inpaint area CULLEN dengan median warna beige sekitar area
- Overlay logo LKB transparan di center koordinat (50%, 42%)
- Soft blending di tepi inpaint agar tidak terlihat "kotak"
- Output JPEG quality 95

### Must NOT Have (Guardrails)
- TIDAK resize/compress gambar
- TIDAK update database Supabase
- TIDAK upload apapun ke Supabase (hanya simpan lokal)
- TIDAK proses gambar `_1.jpg` (tidak punya box)
- TIDAK gunakan Gemini API (free tier limit habis)
- TIDAK menyentuh file proyek Next.js (Navbar, Footer, dll)

---

## Verification Strategy

### Test Decision
- **Automated tests**: None (visual output, bukan unit test)
- **Verification**: Agent membuka file output dan describe visual hasilnya

### QA Policy
Setiap task diverifikasi dengan membaca/analyze file output.

---

## Execution Strategy

### Parallel Execution Waves

```
Wave 1 (Sequential — satu per satu sesuai permintaan user):
└── Task 1: Buat scripts/step2_logo_overlay.py [quick]

Wave 2 (Setelah Task 1 verified):
└── Task 2: Test jalankan script + verify output visual [quick]

Wave 3 (Setelah Task 2 approved):
└── Task 3: Buat scripts/full_pipeline.py (step1 + step2 gabungan) [quick]

Critical Path: Task 1 → Task 2 → Task 3
```

---

## TODOs

- [ ] 1. Buat `scripts/step2_logo_overlay.py`

  **What to do**:
  - Buat file Python baru: `scripts/step2_logo_overlay.py`
  - Import: `numpy`, `PIL.Image`, `cv2`
  - Fungsi `make_logo_transparent(logo_path)`:
    - Buka `public/white-logo.png` dengan `.convert("RGBA")`
    - Convert ke numpy array
    - Buat mask: pixel dengan `r < 40 AND g < 40 AND b < 40` → set `alpha = 0`
    - Return `Image.fromarray(data)`
  - Fungsi `inpaint_cullen_area(img_rgb)`:
    - Hitung bounding box CULLEN dalam pixel dari konstanta persen:
      - `CULLEN_CENTER_X = 0.50`, `CULLEN_CENTER_Y = 0.42`
      - `CULLEN_WIDTH = 0.28`, `CULLEN_HEIGHT = 0.06`
    - Ambil sampel warna beige dari 15px DI ATAS dan DI BAWAH bounding box
    - Hitung `fill_color = np.median(samples, axis=0)` dari gabungan sample
    - Isi bounding box dengan patch warna beige + gaussian noise kecil (std=3) untuk tekstur natural
    - Soft blend di tepi (8px margin) dengan gambar original menggunakan alpha linear
    - Return result array
  - Fungsi `overlay_logo(img_pil, logo_transparent)`:
    - `LOGO_WIDTH_RATIO = 0.18` (18% dari lebar gambar)
    - Resize logo proporsional
    - Hitung paste position: center di `(CULLEN_CENTER_X * w, CULLEN_CENTER_Y * h)`
    - Apply opacity 80%: multiply alpha channel × 0.80
    - `img_rgba.paste(logo_resized, (paste_x, paste_y), logo_resized)`
    - Return `.convert("RGB")`
  - `main()`:
    - Input: `scripts/output_step1.jpg`
    - Logo: `public/white-logo.png`
    - Output: `scripts/output_step2.jpg`
    - Print progress di setiap step
    - Simpan juga debug: `scripts/output_step2_debug_inpaint.jpg` (tanpa logo, hanya inpaint)

  **Must NOT do**:
  - TIDAK resize gambar output
  - TIDAK upload ke Supabase
  - TIDAK import google-genai atau Gemini apapun

  **Recommended Agent Profile**:
  > Task ini adalah menulis satu file Python sederhana dengan library yang sudah familiar.
  - **Category**: `quick`
    - Reason: Single file Python script, logika linear, tidak ada ambiguitas arsitektur
  - **Skills**: []
    - Tidak ada skill khusus diperlukan, PIL/NumPy/OpenCV adalah pengetahuan umum

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Wave 1 — harus selesai sebelum Task 2
  - **Blocks**: Task 2, Task 3
  - **Blocked By**: None (dapat dimulai sekarang)

  **References**:

  **Pattern References** (kode Step 1 yang sudah bekerja — ikuti style yang sama):
  - Kode step 1 yang bekerja sempurna:
    ```python
    def replace_green_with_black(img_rgb):
        hsv = cv2.cvtColor(img_rgb, cv2.COLOR_RGB2HSV)
        lower = np.array([55, 60, 15])
        upper = np.array([90, 255, 160])
        mask = cv2.inRange(hsv, lower, upper)
        kernel = np.ones((5, 5), np.uint8)
        mask = cv2.dilate(mask, kernel, iterations=1)
        result = img_rgb.copy()
        result[mask > 0] = [0, 0, 0]
        return result
    ```

  **File References**:
  - `scripts/output_step1.jpg` — INPUT gambar (ring dengan box HITAM, CULLEN masih ada)
  - `public/white-logo.png` — Logo LKB, background hitam solid, perlu dibuat transparan
  - `scripts/sample2.jpg` — gambar original (sebelum step 1) untuk referensi
  - `scripts/output_final_v3.jpg` — percobaan sebelumnya yang GAGAL (jangan ikuti approach ini)

  **Informasi Visual yang Sudah Diketahui**:
  - Teks CULLEN: emas/gold, posisi center ~50% horizontal, ~42% vertikal
  - Interior beige: x 18%–82%, y 22%–68%
  - Warna beige: ~RGB(194, 185, 170) — warm greige matte
  - Logo LKB: monogram putih (KB/LKB), background hitam solid

  **Acceptance Criteria**:

  - [ ] File `scripts/step2_logo_overlay.py` dibuat
  - [ ] `python scripts/step2_logo_overlay.py` berjalan tanpa exception
  - [ ] File `scripts/output_step2.jpg` dan `scripts/output_step2_debug_inpaint.jpg` dibuat

  **QA Scenarios**:

  ```
  Scenario: Script berjalan tanpa error
    Tool: Bash
    Steps:
      1. cd ke root project
      2. Jalankan: python scripts/step2_logo_overlay.py
      3. Cek exit code: echo $?
    Expected Result: exit code 0, print progress terlihat di terminal
    Evidence: terminal output (text)

  Scenario: Output file dibuat dan valid
    Tool: Bash
    Steps:
      1. python -c "from PIL import Image; img=Image.open('scripts/output_step2.jpg'); print(img.size, img.mode)"
    Expected Result: print ukuran gambar (misal "(800, 533) RGB") tanpa error
    Evidence: terminal output
  ```

  **Commit**: NO (belum commit sebelum visual diverifikasi user)

---

- [ ] 2. Jalankan script dan analyze hasil visual

  **What to do**:
  - Jalankan `python scripts/step2_logo_overlay.py`
  - Analyze file `scripts/output_step2.jpg` menggunakan `mcp_look_at`
  - Analyze juga `scripts/output_step2_debug_inpaint.jpg` (hanya inpaint, tanpa logo)
  - **Jika hasil BAGUS** (CULLEN hilang, logo terlihat, tidak ada artefak kotak): lanjut Task 3
  - **Jika hasil KURANG BAGUS**: diagnosa masalah dan perbaiki script (iterasi di Task 2 ini)

  **Common Issues & Fix**:

  | Masalah | Kemungkinan Penyebab | Fix |
  |---------|----------------------|-----|
  | Area inpaint terlihat seperti kotak/patch | Blend margin terlalu kecil | Tingkatkan blend_margin dari 8 → 15 |
  | Inpaint terlalu terang/gelap | Median color salah | Cek apakah sample diambil dari luar area CULLEN |
  | Logo tidak terlihat | Opacity terlalu rendah / ukuran terlalu kecil | Naikkan LOGO_WIDTH_RATIO dari 0.18 → 0.22 |
  | Logo ada tapi hitam kotak | Background hitam tidak dihapus | Cek threshold alpha (< 40 vs < 60) |
  | Logo posisi salah | Koordinat center meleset | Adjust CULLEN_CENTER_X/Y |
  | Teks CULLEN masih terlihat | Area inpaint terlalu kecil | Perbesar CULLEN_HEIGHT dari 0.06 → 0.08 |

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Eksekusi + analisis visual + iterasi kecil jika perlu
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Wave 2
  - **Blocks**: Task 3
  - **Blocked By**: Task 1

  **References**:
  - `scripts/step2_logo_overlay.py` — script yang baru dibuat di Task 1
  - Gunakan `mcp_look_at` untuk analyze gambar output secara visual

  **Acceptance Criteria**:

  **QA Scenarios**:

  ```
  Scenario: Hasil visual — CULLEN hilang, logo LKB muncul
    Tool: mcp_look_at (analyze image)
    File: scripts/output_step2.jpg
    Goal: "Apakah teks CULLEN sudah tidak terlihat? Apakah ada logo/simbol LKB di area beige? Apakah ada artefak aneh (kotak, garis, perbedaan warna mencolok) di area inpaint?"
    Expected Result:
      - CULLEN tidak terlihat (atau sangat samar)
      - Ada simbol putih/terang di area beige yang sebelumnya ada teks CULLEN
      - Tidak ada "kotak" patch yang terlihat aneh
    Failure: Jika CULLEN masih terlihat jelas → iterasi fix di task ini

  Scenario: Debug inpaint saja (tanpa logo)
    Tool: mcp_look_at
    File: scripts/output_step2_debug_inpaint.jpg
    Goal: "Apakah area di mana teks CULLEN ada terlihat bersih/mulus? Ada artefak?"
    Expected Result: Area beige terlihat mulus, warna konsisten, tidak ada bekas teks
  ```

  **Commit**: NO

---

- [ ] 3. Buat `scripts/full_pipeline.py` (step 1 + step 2 gabungan)

  **What to do**:
  Buat script gabungan yang menjalankan step 1 dan step 2 secara berurutan untuk 1 gambar.
  - Import fungsi dari step 1 dan step 2 (atau inline function-nya)
  - Fungsi `replace_green_with_black(img_rgb)` — dari step 1 (copy paste, sudah proven bekerja)
  - Fungsi `make_logo_transparent(logo_path)` — dari step 2
  - Fungsi `inpaint_cullen_area(img_rgb)` — dari step 2
  - Fungsi `overlay_logo(img_pil, logo_transparent)` — dari step 2
  - Fungsi `process_single_image(input_path, logo_path, output_path)`:
    1. Load gambar → `img_rgb = np.array(Image.open(input_path).convert("RGB"))`
    2. Step 1: `img_rgb = replace_green_with_black(img_rgb)`
    3. Step 2a: `img_rgb = inpaint_cullen_area(img_rgb)`
    4. Step 2b: `img_final = overlay_logo(Image.fromarray(img_rgb), logo_transparent)`
    5. Save ke `output_path` dengan JPEG quality 95
  - `main()`:
    - Test dengan: input=`scripts/sample2.jpg`, output=`scripts/output_full_pipeline.jpg`
    - Print: "Processing: {input} → {output}"
    - Print: "Done! Saved to {output}"
  - Script harus bisa dijalankan langsung: `python scripts/full_pipeline.py`

  **Must NOT do**:
  - TIDAK ada upload logic (hanya simpan lokal)
  - TIDAK ada batch loop (hanya proses 1 gambar di main)

  **Recommended Agent Profile**:
  - **Category**: `quick`
    - Reason: Menggabungkan 2 script yang sudah ada, tidak ada logika baru
  - **Skills**: []

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Wave 3
  - **Blocks**: Tidak ada (ini task terakhir)
  - **Blocked By**: Task 1, Task 2

  **References**:
  - `scripts/step2_logo_overlay.py` — copy/import fungsi dari sini
  - Kode step 1 (green→black) — sudah tersedia di konteks

  **Acceptance Criteria**:

  **QA Scenarios**:

  ```
  Scenario: Full pipeline dari gambar original (sample2.jpg)
    Tool: Bash
    Steps:
      1. python scripts/full_pipeline.py
      2. echo $?  # cek exit code
    Expected Result: exit code 0, file scripts/output_full_pipeline.jpg dibuat

  Scenario: Verify output visual full pipeline
    Tool: mcp_look_at
    File: scripts/output_full_pipeline.jpg
    Goal: "Apakah (1) box hijau sudah hitam, (2) teks CULLEN tidak terlihat, (3) ada logo LKB di area beige? Describe kondisi gambar secara lengkap."
    Expected Result:
      - Box/frame ring berwarna hitam (bukan hijau)
      - Teks CULLEN tidak terlihat
      - Ada simbol LKB di interior kotak
      - Tidak ada artefak visual yang aneh
  ```

  **Commit**: YES (setelah user menyetujui hasil visual)
  - Message: `feat(scripts): add ring image processing pipeline (step1+2)`
  - Files: `scripts/step2_logo_overlay.py`, `scripts/full_pipeline.py`
  - Pre-commit: tidak ada (tidak ada test framework)

---

## Final Verification Wave

- [ ] F1. **Visual Review** — `unspecified-high`
  Buka `scripts/output_full_pipeline.jpg`. Describe detail: warna box, ada/tidaknya CULLEN text, posisi logo LKB, kualitas inpaint, ada artefak tidak. Bandingkan dengan `scripts/sample2.jpg` (original). Output: APPROVE jika semua kriteria terpenuhi, REJECT dengan penjelasan spesifik jika tidak.

---

## Commit Strategy

- **Task 3**: `feat(scripts): add ring image processing pipeline (step1+2)` — scripts/step2_logo_overlay.py, scripts/full_pipeline.py

---

## Success Criteria

### Verification Commands
```bash
python scripts/full_pipeline.py
# Expected: "Done! Saved to scripts/output_full_pipeline.jpg"

python -c "from PIL import Image; img=Image.open('scripts/output_full_pipeline.jpg'); print('OK:', img.size)"
# Expected: "OK: (width, height)"
```

### Final Checklist
- [ ] Box ring berwarna hitam (bukan hijau)
- [ ] Teks "CULLEN" tidak terlihat
- [ ] Logo LKB (monogram putih) terlihat di area beige interior kotak
- [ ] Tidak ada artefak visual yang mencolok
- [ ] Script berjalan dari root project tanpa error

---

## Catatan: Next Steps Setelah Test Berhasil

Setelah 1 gambar berhasil dan disetujui user, **step selanjutnya adalah batch processing**.
Namun scope tersebut **TIDAK termasuk dalam plan ini** — akan dibuat plan terpisah.

Untuk batch processing, akan dibutuhkan:
1. Supabase Service Role Key (untuk upload)
2. List semua URL gambar dari tabel `engagement_ring_images`
3. Script batch download → process → upload dengan retry logic
4. Checkpoint file agar bisa resume jika terputus
