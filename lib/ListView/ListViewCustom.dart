import 'package:flutter/material.dart';

class ListViewCustom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar ListView.custom'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.custom(
        // Menggunakan SliverChildBuilderDelegate untuk suplai data secara dinamis
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.deepOrange.shade200),
              ),
              alignment: Alignment.center,
              child: Text(
                'Item Custom ke-${index + 1}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            );
          },
          childCount: 16, // Menentukan jumlah total item (16 item)
        ),
      ),
    );
  }
}