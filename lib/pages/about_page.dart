import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:latihan_1/routes/app_routes.dart'; // Impor AppRoutes agar bisa memanggil rutenya

class AbouPage extends StatelessWidget {
  const AbouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Halaman Page'),
              const SizedBox(height: 16),

              // === TOMBOL PINTASAN KE LATIHAN GRID ===
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(220, 50),
                ),
                onPressed: () {
                  // Langsung lompat ke halaman Latihan Grid lewat rute
                  Navigator.pushNamed(context, AppRoutes.latihanGrid);
                },
                icon: const Icon(Icons.grid_view),
                label: const Text('Buka Latihan Grid (Instan)'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.formulir);
                },
                child: const Text('Klik Saya'),
              ),
              const SizedBox(height: 10),
              const ElevatedButton(
                onPressed: null,
                child: Text('Tombol Nonaktif'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {},
                child: const Text('Tombol Biru'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text('Tombol Bulat'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  print('TextButton ditekan');
                },
                child: const Text('Batal'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  print('OutlinedButton ditekan');
                },
                child: const Text('Edit Profil'),
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  print('Tombol share ditekan');
                },
              ),
              const SizedBox(height: 10),
              CupertinoButton.filled(
                onPressed: () {},
                child: const Text('iOS Style Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
