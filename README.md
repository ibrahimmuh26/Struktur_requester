# Question System Analyst
- Bisakah Anda menjelaskan alur kerja dari awal hingga akhir ketika pemohon mengajukan permintaan?
- Apa saja langkah-langkah yang diambil oleh divisi purchasing ketika menerima permintaan dari pemohon?
- Bagaimana proses pengecekan ketersediaan barang di gudang dilakukan?
- Bagaimana proses pencarian vendor dan pengelolaan tawaran dari vendor?
- Apakah ada hubungan antara permintaan dan pengadaan yang dilakukan kepada vendor?
- Apa kriteria yang digunakan untuk memberikan approval atau menolak permintaan?
- Apakah Ada batas waktu untuk approval dari pemohon?

# Structure Database
![db_requester drawio](https://github.com/ibrahimmuh26/Struktur_requester/assets/73787745/956751dd-9467-47df-90aa-791df2ca2bfa)

1. Tabel employee
```   
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    nama VARCHAR(100),
    jabatan VARCHAR(100),
    email VARCHAR(100)
);
```
- employee_id: Id untuk setiap karyawan.
- nama: Nama karyawan.
- jabatan: Jabatan atau posisi karyawan.
- email: Alamat email karyawan.

2. Tabel product
```
CREATE TABLE product (
    produk_id SERIAL PRIMARY KEY,
    nama_produk VARCHAR(255),
    qty Int,
    deskripsi_produk TEXT
);
```
- produk_id: Id untuk setiap produk.
- nama_produk: Nama produk.
- deskripsi_produk: Deskripsi produk.

3. Tabel pemohon
```
CREATE TABLE pemohon (
    pemohon_id SERIAL PRIMARY KEY,
    nama VARCHAR(100),
    email VARCHAR(100),
    alamat VARCHAR(100)
);
```
- pemohon_id: Id untuk setiap pemohon.
- nama: Nama pemohon.
- email: Alamat Email pemohon.
- alamat: Alamat  pemohon.

4. Tabel permintaan
```
CREATE TABLE permintaan (
    permintaan_id SERIAL PRIMARY KEY,
    pemohon_id INT REFERENCES pemohon(pemohon_id),
    deskripsi VARCHAR(100),
    tanggal_permintaan DATE,
    status VARCHAR(50)
);
```
- permintaan_id: Id untuk setiap permintaan.
- pemohon_id: Relasi terhadap tabel Pemohon untuk mengidentifikasi pembuatan permintaan.
- deskripsi : Berisikan deskripsi permintaan.
- tanggal_permintaan: Tanggal permintaan dibuat.
- status: Status permintaan (contoh, 'Menunggu Approval', 'Disetujui', 'Ditolak').

5. Tabel permintaan_product
```
CREATE TABLE permintaan_product (
    permintaan_product_id SERIAL PRIMARY KEY,
    permintaan_id INT REFERENCES permintaan(permintaan_id),
    product_id INT REFERENCES products(product_id),
    jumlah INT
);
```
- permintaan_product_id : Id untuk setiam permintaan produk.
- permintaan_id : Relasi terhadap tabel permintaan untuk mengidentifikasi detail dari permintaan.
- product_id : Relasi terhadap tabel product untuk mengidentifikasi product
- jumlah : Total permintaan.

6. Tabel persetujuan
```
CREATE TABLE persetujuan (
    persetujuan_id SERIAL PRIMARY KEY,
    permintaan_id INT REFERENCES permintaan(permintaan_id),
    employee_id INT REFERENCES employees(employee_id),
    tanggal_approval DATE,
    status VARCHAR(50)
);
```
- persetujuan: Id untuk setiap persetujuan.
- permintaan_id: Relasi ke tabel Permintaan untuk mengidentifikasi permintaan yang di-setujui.
- employee_id: relasi ke tabel Employee untuk mengidentifikasi siapa yang melakukan setujui.
- tanggal_approval: Tanggal approval diberikan.
- status: Status approval (contoh, 'Disetujui', 'Ditolak').

7. Tabel Pengadaan
```
CREATE TABLE pengadaan (
    pengadaan_id SERIAL PRIMARY KEY,
    permintaan_id INT REFERENCES permintaan(permintaan_id),
    vendor_id INT REFERENCES vendor(vendor_id),
    employee_id INT REFERENCES employees(employee_id),
    product_id INT REFERENCES products(product_id),
    tanggal_pengadaan DATE,
    status VARCHAR(50)
);
```
- pengadaan_id: Kunci utama untuk setiap pengadaan.
- permintaan_id: Referensi ke tabel Permintaan untuk mengidentifikasi permintaan yang diadakan.
- vendor_id: Referensi ke tabel Vendor untuk mengidentifikasi vendor yang dipilih.
- employee_id: relasi ke tabel Employee untuk mengidentifikasi siapa yang melakukan pengadaan.
- product_id : Relasi terhadap tabel product untuk mengidentifikasi product.
- tanggal_pengadaan: Tanggal pengadaan dilakukan.
- status: Status pengadaan (misalnya, 'Dalam Proses', 'Selesai').


# Query Laporan

1. Laporan Pemohon Terbanyak
```
SELECT 
    EXTRACT(YEAR FROM tanggal_permintaan) AS tahun,
    EXTRACT(MONTH FROM tanggal_permintaan) AS bulan,
    p3.nama AS Nama_Pemohon,
    COUNT(p2.permintaan_id) AS Jumlah_Permintaan
FROM 
    permintaan p2  
JOIN 
    pemohon p3   ON p2.pemohon_id = p3.pemohon_id
GROUP BY 
    tahun, bulan, p3.nama
ORDER BY 
    tahun, bulan, Jumlah_Permintaan DESC;
```
Query ini bertujuan untuk menghasilkan laporan yang menunjukkan jumlah permintaan yang diajukan oleh setiap pemohon per bulan dan per tahun

2. Laporan Produk Terbanyak
```
SELECT 
    TO_CHAR(p.tanggal_permintaan , 'YYYY-MM') AS Bulan,
    p2.nama_produk  AS Nama_Produk,
    SUM(pp.jumlah) AS Jumlah_Diminta
FROM 
    permintaan_product pp  
JOIN 
	permintaan p on pp.permintaan_id=p.permintaan_id
	join
    products p2   ON pp.product_id  = p2.product_id 
GROUP BY 
    TO_CHAR(p.tanggal_permintaan, 'YYYY-MM'), p2.nama_produk
ORDER BY 
    Bulan, Jumlah_Diminta DESC;
```
Query ini bertujuan untuk menghasilkan laporan yang menunjukkan jumlah produk yang diminta setiap bulan.

  


