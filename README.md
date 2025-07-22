# studi-kasus-database-penjualan-sql
Repositori ini berisi skrip SQL untuk membuat dan mengelola database sebuah toko elektronik. Proyek ini mendemonstrasikan operasi dasar **CRUD (Create, Read, Update, Delete)** serta penggunaan relasi antar tabel dengan `FOREIGN KEY` dan kueri `JOIN`.

## 📝 Abstrak Proyek
Proyek ini merupakan studi kasus untuk mata kuliah **Pemrograman Web Dasar**  yang berfokus pada desain dan implementasi database relasional menggunakan MySQL/MariaDB. Tujuannya adalah untuk membangun skema database yang logis untuk sebuah toko elektronik, lengkap dengan data pelanggan, produk, dan riwayat pesanan.

## 🏛️ Struktur Database
Database `toko_elektronik` terdiri dari tiga tabel utama.

| Tabel         | Kolom             | Tipe Data      | Keterangan          |
| ------------- | ----------------- | -------------- | ------------------- |
| **pelanggan** | `id_pelanggan`    | `INT(11)`      | **Primary Key** |
|               | `nama`            | `VARCHAR(60)`  | Nama lengkap        |
|               | `alamat`          | `VARCHAR(60)`  | Alamat pelanggan    |
|               | `no_telp`         | `VARCHAR(15)`  | Nomor telepon       |
| **produk** | `id_produk`       | `INT(11)`      | **Primary Key** |
|               | `nama_produk`     | `VARCHAR(60)`  | Nama barang         |
|               | `harga`           | `INT(15)`      | Harga satuan        |
|               | `stok`            | `INT(15)`      | Jumlah stok         |
| **pesanan** | `id_pesanan`      | `INT(11)`      | **Primary Key** |
|               | `id_pelanggan`    | `INT(11)`      | **Foreign Key** |
|               | `id_produk`       | `INT(11)`      | **Foreign Key** |
|               | `tgl_pesan`       | `DATE`         | Tanggal transaksi   |
|               | `total_bayar`     | `INT(15)`      | Total harga pesanan |

## 🔗 Relasi Antar Tabel
Diagram berikut mengilustrasikan hubungan antara tabel `pelanggan`, `pesanan`, dan `produk`.

<img width="940" height="378" alt="image" src="https://github.com/user-attachments/assets/8c63bca5-489c-4a2e-8343-03fe1dde9533" />

Diagram relasi yang menunjukkan `pesanan` sebagai tabel transaksi yang menghubungkan `pelanggan` dan `produk`.*

* `pesanan.id_pelanggan` terhubung ke `pelanggan.id_pelanggan`.
* `pesanan.id_produk` terhubung ke `produk.id_produk`. 

## 💡 Studi Kasus Kueri: JOIN
Berikut adalah contoh implementasi kueri `JOIN` untuk mendapatkan data spesifik.

**Pertanyaan**: Bagaimana cara menemukan semua pesanan yang berisi produk dengan harga di atas Rp25.000?

**Jawaban (Kueri SQL)**:
```sql
SELECT 
    p.id_pesanan,
    c.nama AS nama_pelanggan,
    pr.nama_produk,
    pr.harga
FROM pesanan p
JOIN pelanggan c ON p.id_pelanggan = c.id_pelanggan
JOIN produk pr ON p.id_produk = pr.id_produk
WHERE pr.harga > 25000;
```

**Hasil Output**:
| id_pesanan | nama_pelanggan | nama_produk | harga   |
| ---------- | -------------- | ----------- | ------- |
| 2          | Hakim          | Keyboard    | 150000  |
| 3          | Luqman         | Speaker     | 75000   |

## ⚙️ Cara Menggunakan
1.  Pastikan kamu memiliki *database server* seperti **XAMPP (MariaDB)** atau **MySQL Server**.
2.  Buka *SQL client* pilihanmu (misalnya phpMyAdmin, DBeaver, atau command line).
3.  Jalankan seluruh isi skrip dari file `database.sql` untuk membuat database, tabel, relasi, dan memasukkan data awal.

**luqmanaru**
