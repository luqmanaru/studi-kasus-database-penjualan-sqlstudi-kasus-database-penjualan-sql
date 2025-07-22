-- ---------------------------------
-- Dibuat oleh: luqmanaru
-- Proyek: Database Toko Elektronik
-- ---------------------------------

-- 1. Membuat Database
CREATE DATABASE IF NOT EXISTS toko_elektronik;
USE toko_elektronik;

-- 2. Membuat Tabel
-- Tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT(11) NOT NULL PRIMARY KEY,
    nama VARCHAR(60) NOT NULL,
    alamat VARCHAR(60) NOT NULL,
    no_telp VARCHAR(15) NOT NULL -- Menggunakan VARCHAR untuk nomor telepon yang lebih fleksibel
);

-- Tabel Produk
CREATE TABLE produk (
    id_produk INT(11) NOT NULL PRIMARY KEY,
    nama_produk VARCHAR(60) NOT NULL,
    harga INT(15) NOT NULL,
    stok INT(15) NOT NULL
);

-- Tabel Pesanan
CREATE TABLE pesanan (
    id_pesanan INT(11) NOT NULL PRIMARY KEY,
    id_pelanggan INT(11) NOT NULL,
    id_produk INT(11) NOT NULL,
    tgl_pesan DATE,
    total_bayar INT(15) NOT NULL
);

-- 3. Membuat Relasi Antar Tabel (Foreign Keys)
ALTER TABLE pesanan
ADD CONSTRAINT fk_pelanggan
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan);

ALTER TABLE pesanan
ADD CONSTRAINT fk_produk
FOREIGN KEY (id_produk) REFERENCES produk(id_produk);


-- 4. Memasukkan Data (INSERT)
-- Data Pelanggan
INSERT INTO pelanggan (id_pelanggan, nama, alamat, no_telp) VALUES
(1, 'Hanif', 'Jl. Payung No. 32', '081234567892'),
(2, 'Luqman', 'Jl. Palung No. 44', '081234565561'),
(3, 'Hakim', 'Jl. Yaudah No. 57', '081234565454');

-- Data Produk
INSERT INTO produk (id_produk, nama_produk, harga, stok) VALUES
(11, 'Mouse', 25000, 78),
(12, 'Keyboard', 150000, 24),
(13, 'Speaker', 75000, 56);

-- Data Pesanan
INSERT INTO pesanan (id_pesanan, id_pelanggan, id_produk, tgl_pesan, total_bayar) VALUES
(1, 1, 11, '2023-11-19', 25000),
(2, 3, 12, '2023-11-23', 150000),
(3, 2, 13, '2023-11-25', 75000);


-- 5. Mengubah Data (UPDATE)
UPDATE pesanan
SET total_bayar = 155000 -- Contoh perubahan data
WHERE id_pesanan = 1;


-- 6. Menghapus Data (DELETE)
DELETE FROM pesanan
WHERE id_pesanan = 2;


-- 7. Menampilkan Data dengan JOIN (Contoh Studi Kasus)
-- Pertanyaan: Temukan semua pesanan yang berisi produk dengan harga di atas Rp25.000. [cite: 222]
SELECT 
    p.id_pesanan,
    p.tgl_pesan,
    c.nama AS nama_pelanggan,
    pr.nama_produk,
    pr.harga,
    p.total_bayar
FROM pesanan p
JOIN pelanggan c ON p.id_pelanggan = c.id_pelanggan
JOIN produk pr ON p.id_produk = pr.id_produk
WHERE pr.harga > 25000;
