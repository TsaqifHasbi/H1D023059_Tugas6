import 'package:flutter/material.dart';
import 'tampil_data.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            _textboxNama(),
            _textboxNIM(),
            _textboxTahunLahir(),
            const SizedBox(height: 20),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Nama",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "NIM",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      controller: _nimController,
    );
  }

  _textboxTahunLahir() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Tahun Lahir",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      controller: _tahunLahirController,
      keyboardType: TextInputType.number,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahunLahir = int.tryParse(_tahunLahirController.text) ?? 0;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                TampilData(nama: nama, nim: nim, tahunLahir: tahunLahir),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: const Text('Simpan'),
    );
  }
}
