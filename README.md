# UTS Pemograman Mobile 2
**Nama:** Liesna Nur Aeni Aprliani  
**NIM:** 23552011394  

## Aplikasi Warung Makan (Flutter + Cubit)

Project ini merupakan implementasi kasir sederhana menggunakan **Flutter**. Aplikasi dilengkapi perhitungan diskon per item, total belanja, dan manajemen transaksi menggunakan **Cubit** (*state management*).

### Tujuan Project
Mengimplementasikan Cubit sebagai *state management* pada transaksi yang memiliki logika diskon dinamis.
- Membuat aplikasi kasir untuk warung makan dengan fitur perhitungan diskon otomatis.
- Menampilkan kategori menu menggunakan widget `Stack`.
- Memisahkan struktur kode menjadi model, bloc (Cubit), page, dan widget secara modular.

---

## Pembahasan Soal

### 1. Jelaskan bagaimana state management dengan Cubit dapat membantu dalam pengelolaan transaksi yang memiliki logika diskon dinamis.

**Jawab:**
State management dengan Cubit membantu mengatur alur data pada aplikasi sehingga setiap perubahan pada transaksi—seperti menambah menu, mengubah kuantitas, atau menghitung diskon—dapat diperbarui secara konsisten dan otomatis pada UI.

**Keuntungan untuk logika diskon dinamis:**
- **Akurasi:** Perhitungan diskon lebih akurat karena dilakukan di dalam Cubit (bukan di UI).
- **Reaktif:** UI otomatis update ketika state berubah, misalnya total harga setelah diskon langsung muncul tanpa harus refresh manual.
- **Terstruktur:** Kode lebih rapi dan terstruktur karena logika transaksi ditempatkan di Cubit, bukan tersebar di widget.
- **Scalable:** Mudah dikembangkan jika logika diskon berubah (misalnya diskon per item + diskon total).

### 2. Apa perbedaan antara diskon per item dan diskon total transaksi? Berikan contoh penerapannya pada aplikasi kasir.

**Jawab:**

* **Diskon Per Item**
    Diskon diterapkan pada setiap barang/menu secara individual.
    *Contoh aplikasi:*
    - Menu "Ayam Goreng" harga 20.000 → diskon 10% → harga menjadi 18.000.
    - Jika beli 3 pcs → 3 × 18.000 = 54.000.

* **Diskon Total Transaksi**
    Diskon diberikan setelah semua harga dijumlahkan.
    *Contoh:*
    - Total belanja = 100.000 → diskon 20% → bayar 80.000.

### 3. Jelaskan manfaat penggunaan widget Stack pada tampilan kategori menu di aplikasi Flutter.

**Jawab:**
Widget `Stack` memungkinkan menumpuk beberapa widget di atas satu sama lain.

**Manfaat untuk tampilan kategori menu:**
- **Visual Menarik:** Membuat tampilan visual lebih menarik, contoh gambar *background* dengan teks kategori di atasnya.
- **Badge Indikator:** Mudah menambahkan badge indikator, misalnya label "Promo", "Best Seller", dsb.
- **Fleksibilitas Desain:** Fleksibel dalam desain, karena bisa menempatkan widget di posisi bebas (*top*, *bottom*, *center*).
- **Overlay:** Cocok untuk membuat *menu card* dengan *cover image* + *gradient overlay* + tombol.

### Link Rekaman Pengerjaan
https://drive.google.com/drive/folders/1gpiuJJU8dMtf4g_yRj0e9mug1qzkhTcq