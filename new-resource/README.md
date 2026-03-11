# New Resource — Reference Images untuk AI Generation

Folder ini berisi **reference images** yang didownload dari Supabase untuk digunakan sebagai referensi saat generate foto baru di **OpenArt**.

---

## Struktur Folder

```
new-resource/
└── openart-reference/
    ├── adina/          ← Universal reference (3 warna lengkap) — pakai untuk ring BARU
    │   ├── yellow_2.jpg
    │   ├── white_2.jpg
    │   └── rose_2.jpg
    ├── adelyn/         ← Reference untuk generate: adelyn/yellow_2.jpg
    │   ├── rose_2.jpg
    │   └── white_2.jpg
    ├── arlo/           ← Reference untuk generate: arlo/rose_2.jpg
    │   ├── white_2.jpg
    │   └── yellow_2.jpg
    ├── ayla/           ← Reference untuk generate: ayla/rose_2.jpg
    │   ├── white_2.jpg
    │   └── yellow_2.jpg
    ├── chantelle/      ← Reference untuk generate: chantelle/white_1.jpg
    │   ├── rose_1.jpg
    │   └── yellow_1.jpg
    ├── daya/           ← Reference untuk generate: daya/white_2.jpg
    │   ├── rose_2.jpg
    │   └── yellow_2.jpg
    ├── ella/           ← Reference untuk generate: ella/white_2.jpg
    │   ├── rose_2.jpg
    │   └── yellow_2.jpg
    ├── penelope/       ← Reference untuk generate: penelope/yellow_2.jpg
    │   ├── rose_2.jpg
    │   └── white_2.jpg
    ├── poppy/          ← Reference untuk generate: poppy/white_2.jpg
    │   ├── rose_2.jpg
    │   └── yellow_2.jpg
    └── shai/           ← Reference untuk generate: shai/white_2.jpg
        ├── rose_2.jpg
        └── yellow_2.jpg
```

---

## Cara Pakai di OpenArt

1. Buka [openart.ai](https://openart.ai)
2. Pilih mode **Image Reference** atau **Style Reference**
3. Upload foto dari folder ring yang sesuai (2 foto sekaligus)
4. Set **Reference Strength: 70–80%**
5. Paste prompt dari panduan → Generate
6. Simpan hasil dengan nama yang benar (lihat tabel di bawah)

---

## Tabel: Ring → Reference Folder → Target File

| Ring | Folder Reference | Foto yang Perlu Di-generate |
|------|-----------------|----------------------------|
| adelyn | `adelyn/` (rose_2 + white_2) | `adelyn/yellow_2.jpg` |
| arlo | `arlo/` (white_2 + yellow_2) | `arlo/rose_2.jpg` |
| ayla | `ayla/` (white_2 + yellow_2) | `ayla/rose_2.jpg` |
| chantelle | `chantelle/` (rose_1 + yellow_1) | `chantelle/white_1.jpg` |
| daya | `daya/` (rose_2 + yellow_2) | `daya/white_2.jpg` |
| ella | `ella/` (rose_2 + yellow_2) | `ella/white_2.jpg` |
| penelope | `penelope/` (rose_2 + white_2) | `penelope/yellow_2.jpg` |
| poppy | `poppy/` (rose_2 + yellow_2) | `poppy/white_2.jpg` |
| shai | `shai/` (rose_2 + yellow_2) | `shai/white_2.jpg` |
| alina (baru) | `adina/` (semua 3 warna) | `alina/yellow_2.jpg`, `alina/white_2.jpg`, `alina/rose_2.jpg` |
| ava (baru) | `adina/` (semua 3 warna) | `ava/yellow_2.jpg`, `ava/white_2.jpg`, `ava/rose_2.jpg` |
| ember (baru) | `adina/` (semua 3 warna) | `ember/yellow_2.jpg`, `ember/white_2.jpg`, `ember/rose_2.jpg` |
| rose (baru) | `adina/` (semua 3 warna) | `rose/yellow_2.jpg`, `rose/white_2.jpg`, `rose/rose_2.jpg` |

---

## Setelah Generate

Setelah semua foto selesai di-generate dan di-upload ke Supabase, beritahu developer untuk:
1. Update `src/data/ring-hover-box-map.json` — tambah entry baru
2. Fix shape data di `src/data/engagement-rings.ts` untuk 8 ring yang salah
3. Update thumbnail URLs untuk 8 ring tersebut
