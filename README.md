# H1D023059_Tugas 6

## Aplikasi Flutter - Form Input dan Tampilan Data

Aplikasi sederhana yang menunjukkan cara mengirim data dari satu halaman ke halaman lain di Flutter.

## Cara Kerja Passing Data

### 1. **File-file yang Digunakan**

- `main.dart` - Titik awal aplikasi
- `form_data.dart` - Halaman form untuk input data
- `tampil_data.dart` - Halaman untuk menampilkan data

### 2. **Proses Passing Data**

#### **Langkah 1: Ambil Data dari Form**

Di `form_data.dart`, kita pakai **TextEditingController** untuk ambil isi dari TextField:

```dart
final _namaController = TextEditingController();
final _nimController = TextEditingController();
final _tahunLahirController = TextEditingController();
```

Controller ini seperti "wadah" yang nampung apa yang user ketik.

#### **Langkah 2: Kirim Data Saat Tombol Diklik**

Pas tombol "Simpan" diklik, kita ambil data dari controller terus kirim ke halaman berikutnya:

```dart
String nama = _namaController.text;
String nim = _nimController.text;
int tahunLahir = int.tryParse(_tahunLahirController.text) ?? 0;

Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => TampilData(
      nama: nama,
      nim: nim,
      tahunLahir: tahunLahir
    ),
  ),
);
```

**Sederhananya:** Kita ambil data dari form, terus langsung kasih ke halaman `TampilData` pas buka halaman itu.

#### **Langkah 3: Terima Data di Halaman Tujuan**

Di `tampil_data.dart`, kita terima data lewat constructor:

```dart
class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahunLahir;

  const TampilData({
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  });
}
```

`required` artinya data ini wajib dikasih pas bikin widget `TampilData`.

#### **Langkah 4: Tampilkan Data**

Setelah data diterima, tinggal pakai buat ditampilkan:

```dart
final int umur = DateTime.now().year - tahunLahir;

Text("Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun")
```

## Alur Singkat

User isi form → Data masuk ke Controller → Klik Simpan →
Data dikirim lewat Navigator → TampilData terima data → Tampilkan ke layar

## Kenapa Pakai Cara Ini?

Metode **Constructor Parameter** ini paling simple dan cocok untuk:

- Kirim data sederhana antar halaman
- Data cuma dipake sekali
- Gak perlu ribet pakai state management

## Cara Jalankan

```bash
flutter pub get
flutter run
```

## Dibuat oleh

**Tsaqif Hasbi Aghna Syarief**  
NIM: H1D023059
