# PEMOGRAMAN-MOBILE-2_RajzaMuhammadYasyfaFajriSidiq_23552011039


JAWABAN:
1
- Cubit adalah versi yang lebih sederhana dari Bloc. Cubit bekerja dengan cara memanggil fungsi (method) yang langsung mengubah state. Tidak ada event yang perlu didefinisikan, sehingga kode lebih singkat dan lebih mudah dipahami. Cocok untuk fitur dengan logika sederhana atau jumlah state yang tidak terlalu banyak.
- Bloc menggunakan pola Event → State. Untuk mengubah state, developer harus mengirim sebuah event, lalu Bloc akan memproses event tersebut di dalam mapEventToState (atau handler lain) dan menghasilkan state baru. Karena alurnya lebih terstruktur, Bloc lebih cocok untuk logika bisnis yang lebih kompleks, banyak kondisi, atau aplikasi yang harus scalable.

2
A. Memudahkan pemeliharaan (maintainability)
B. Reusable dan scalable
C. Menghindari bug dan membuat kode lebih bersih
D. Memudahkan pengujian (testability)
E. Mendukung kerja tim

3
#CartInitial
adalah state awal ketika fitur keranjang baru saja diinisialisasi. Pada kondisi ini, data keranjang biasanya belum dimuat atau masih kosong.

#CartLoaded
State ini menggambarkan bahwa aplikasi sudah memiliki data lengkap mengenai keranjang belanja

#CartError
State ini muncul ketika terjadi kegagalan dalam proses yang berkaitan dengan keranjang.
