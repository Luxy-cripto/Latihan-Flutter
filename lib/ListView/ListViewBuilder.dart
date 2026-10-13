import 'package:flutter/material.dart';


class ListViewBuilder extends StatelessWidget {
  

  // Contoh data list yang akan ditampilkan (bisa dari API/Database)
  final List<String> daftarBuah = [
    'Apel',
    'Pisang',
    'Jeruk',
    'Mangga',
    'Anggur',
    'Semangka',
    'Melon',
    'Stroberi',
    'Nanas',
    'Pepaya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar ListView.builder'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: daftarBuah.length, // Menentukan jumlah total item dalam list
        itemBuilder: (context, index) {
          // itemBuilder dipanggil berulang kali sebanyak itemCount
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 255, 0, 212),
                child: Text(
                  daftarBuah[index][0], // Mengambil huruf depan nama buah
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(daftarBuah[index]),
              subtitle: Text('Ini adalah buah ke-${index + 1}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Aksi saat item diklik
                print('Anda memilih: ${daftarBuah[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}