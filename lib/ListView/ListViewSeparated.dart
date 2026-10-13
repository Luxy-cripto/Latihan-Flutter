import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {


  // Data dummy untuk kontak
  final List<Map<String, String>> daftarKontak = [
    {'nama': 'Budi Santoso', 'telepon': '081234567890'},
    {'nama': 'Siti Rahma', 'telepon': '081987654321'},
    {'nama': 'Andi Pratama', 'telepon': '081122334455'},
    {'nama': 'Dewi Lestari', 'telepon': '085678901234'},
    {'nama': 'Joko Anwar', 'telepon': '087811223344'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar ListView.separated'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
        itemCount: daftarKontak.length, // Menentukan jumlah total item
        
        // 1. itemBuilder: Untuk merender tampilan setiap item data
        itemBuilder: (context, index) {
          final kontak = daftarKontak[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Text(
                kontak['nama']![0], // Mengambil huruf pertama nama
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(kontak['nama']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(kontak['telepon']!),
            trailing: const Icon(Icons.phone, color: Colors.green),
            onTap: () {
              print('Menghubungi ${kontak['nama']}');
            },
          );
        },

        // 2. separatorBuilder: Untuk menentukan widget pemisah antar item
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 70, // Memberikan jarak di sebelah kiri agar sejajar dengan teks
            endIndent: 16,
          );
        },
      ),
    );
  }
}