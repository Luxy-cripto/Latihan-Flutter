import 'package:flutter/material.dart';


class GridviewBuilder extends StatelessWidget {

  // Contoh data dummy produk
  final List<Map<String, dynamic>> daftarProduk = [
    {'nama': 'Sepatu Sneakers', 'harga': 'Rp 350.000', 'icon': Icons.shopping_bag},
    {'nama': 'Jam Tangan', 'harga': 'Rp 750.000', 'icon': Icons.watch},
    {'nama': 'Tas Ransel', 'harga': 'Rp 250.000', 'icon': Icons.backpack},
    {'nama': 'Kacamata Hitam', 'harga': 'Rp 150.000', 'icon': Icons.visibility},
    {'nama': 'Topi Baseball', 'harga': 'Rp 75.000', 'icon': Icons.sports_baseball},
    {'nama': 'Headphone', 'harga': 'Rp 500.000', 'icon': Icons.headset},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk (GridView.builder)'),
        backgroundColor: Colors.deepOrange,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        // 1. Menentukan total item berdasarkan panjang data
        itemCount: daftarProduk.length,
        
        // 2. Mengatur tata letak grid (jumlah kolom, jarak, dll)
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,          // Menampilkan 2 kolom ke samping
          crossAxisSpacing: 12.0,     // Jarak horizontal antar kolom
          mainAxisSpacing: 12.0,      // Jarak vertikal antar baris
          childAspectRatio: 0.85,     // Rasio lebar banding tinggi item
        ),
        
        // 3. Membangun tampilan setiap item berdasarkan index
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon produk
                  Icon(
                    produk['icon'],
                    size: 60,
                    color: Colors.deepOrange,
                  ),
                  const SizedBox(height: 12),
                  // Nama produk
                  Text(
                    produk['nama'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  // Harga produk
                  Text(
                    produk['harga'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}