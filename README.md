# Question System Analyst
- Bisakah Anda menjelaskan alur kerja dari awal hingga akhir ketika pemohon mengajukan permintaan?
- Apa saja langkah-langkah yang diambil oleh divisi purchasing ketika menerima permintaan dari pemohon?
- Bagaimana proses pengecekan ketersediaan barang di gudang dilakukan?
- Bagaimana proses pencarian vendor dan pengelolaan tawaran dari vendor?
- Apakah ada hubungan antara permintaan dan pengadaan yang dilakukan kepada vendor?
- Apa kriteria yang digunakan untuk memberikan approval atau menolak permintaan?
- Apakah Ada batas waktu untuk approval dari pemohon?

# Structure Database
![map](https://github.com/ibrahimmuh26/Struktur_requester/assets/73787745/deaabe1a-7bc4-494c-8ec1-f97cfed2e631)

1. Tabel employee
```   
CREATE TABLE Employee (
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

4. Tabel Permintaan
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

6. Tabel Approval
```
CREATE TABLE Approval (
    approval_id SERIAL PRIMARY KEY,
    permintaan_id INT REFERENCES Permintaan(permintaan_id),
    employee_id INT REFERENCES Employee(employee_id),
    tanggal_approval DATE,
    status VARCHAR(50)
);
```
approval_id: Kunci utama untuk setiap approval.
permintaan_id: Referensi ke tabel Permintaan untuk mengidentifikasi permintaan yang di-approve.
employee_id: Referensi ke tabel Employee untuk mengidentifikasi siapa yang melakukan approval.
tanggal_approval: Tanggal approval diberikan.
status: Status approval (misalnya, 'Disetujui', 'Ditolak').
  


