import 'package:flutter/material.dart';

void main() {
  runApp(Listview());
}

class Listview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contoh ListView',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Belajar Basic ListView'),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.map, color: Colors.blue),
              title: const Text('Peta Lokasi'),
              subtitle: const Text('Lihat lokasi Anda saat ini'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Aksi saat item diklik
              },
            ),
            const Divider(), // Garis pemisah
            ListTile(
              leading: const Icon(Icons.photo, color: Colors.green),
              title: const Text('Galeri Foto'),
              subtitle: const Text('Lihat koleksi foto'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.orange),
              title: const Text('Kontak Penting'),
              subtitle: const Text('Hubungi layanan darurat'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}