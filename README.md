# berita

Aplikasi ini dibuat untuk menampilkan daftar produk online dalam bentuk GridView, dan ketika salah satu produk ditekan, pengguna akan diarahkan ke halaman baru yang menampilkan deskripsi lengkap produk.
Selain itu, project ini juga mengimplementasikan local persistence (penyimpanan lokal) agar data produk dapat tersimpan secara permanen di dalam perangkat.

## Fitur Utama

1. Menampilkan Daftar Produk (GridView)
- Produk ditampilkan dalam bentuk grid agar terlihat rapi dan efisien.
- Setiap produk memiliki gambar, nama, dan harga.

2. Halaman Detail Produk
- Saat salah satu produk ditekan, pengguna diarahkan ke halaman detail yang berisi informasi lengkap produk seperti nama, harga, dan deskripsi.

3. Penyimpanan Data Lokal (Local Database)
- Menggunakan SQLite atau Sembast untuk menyimpan data.
- Data produk akan tersimpan di dalam database, sehingga tetap tersedia meskipun aplikasi ditutup.

4. UI Responsif dan Ringan
- Tampilan menggunakan GridView.builder agar jumlah produk bisa menyesuaikan ukuran layar.
- Desain sederhana dan mudah digunakan.

## Komponen Utama

1. main.dart -> Menjalankan aplikasi dan memanggil halaman utama.
2. api_service.dart -> Kelas service yang menangani permintaan HTTP (GET) ke API dan mengubah data JSON menjadi objek Product.
3. model.dart -> Model data yang merepresentasikan atribut produk.
4. home_pages.dart -> Menampilkan daftar produk dalam bentuk GridView.
5. detail_pages.dart -> Menampilkan deskripsi lengkap dari produk yang dipilih.
