import 'package:flutter/material.dart';

class GridViewCount extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar GridView.count'),
        backgroundColor: Colors.purple,
      ),
      body: GridView.count(
        crossAxisCount: 2, // Menentukan jumlah kolom (2 kolom ke samping)
        crossAxisSpacing: 10, // Jarak horizontal antar kolom
        mainAxisSpacing: 10,  // Jarak vertikal antar baris
        padding: const EdgeInsets.all(10), // Padding di sekeliling grid
        children: <Widget>[
          _buildGridItem('Menu 1', Icons.home, Colors.red),
          _buildGridItem('Menu 2', Icons.camera, Colors.green),
          _buildGridItem('Menu 3', Icons.chat, Colors.blue),
          _buildGridItem('Menu 4', Icons.settings, Colors.orange),
          _buildGridItem('Menu 5', Icons.favorite, Colors.pink),
          _buildGridItem('Menu 6', Icons.person, Colors.teal),
          _buildGridItem('Menu 7', Icons.shopping_cart, Colors.brown),
          _buildGridItem('Menu 8', Icons.apple,Colors.black)
        ],
      ),
    );
  }

  // Fungsi helper untuk membuat kotak item agar kode lebih rapi
  Widget _buildGridItem(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}