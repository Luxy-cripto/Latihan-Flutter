import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan_1/routes/app_routes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Halaman About & Galeri Tombol',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // 1. Tombol Latihan Grid
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.latihanGrid);
                  },
                  icon: const Icon(Icons.grid_view_rounded),
                  label: const Text('Buka Latihan Grid (Instan)'),
                ),
                const SizedBox(height: 12),

                // 1. Tombol Toko Elektronik
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.tokoElektronik);
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Buka Toko Elektronik'),
                ),
                const SizedBox(height: 12),

                // 2. Tombol Buat Data Formulir
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.inputForm);
                  },
                  icon: const Icon(Icons.assignment_add),
                  label: const Text('Buat Data Formulir'),
                ),
                const SizedBox(height: 12),

                // 3. Tombol Formulir
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.formulir);
                  },
                  icon: const Icon(Icons.touch_app_outlined),
                  label: const Text('Klik Saya'),
                ),
                const SizedBox(height: 12),

                // 4. Tombol Nonaktif
                ElevatedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.block_rounded),
                  label: Text('Tombol Nonaktif'),
                ),
                const SizedBox(height: 12),

                // 5. Tombol Biru
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.palette_outlined),
                  label: const Text('Tombol Biru'),
                ),
                const SizedBox(height: 12),

                // 6. Tombol Bulat (Pill shape)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.rounded_corner),
                  label: const Text('Tombol Bulat'),
                ),
                const SizedBox(height: 12),

                // 7. Outlined Button Edit Profil
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    debugPrint('Edit Profil ditekan');
                  },
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Edit Profil'),
                ),
                const SizedBox(height: 12),

                // 8. Text Button Batal
                TextButton.icon(
                  onPressed: () {
                    debugPrint('TextButton ditekan');
                  },
                  icon: const Icon(Icons.cancel_outlined),
                  label: const Text('Batal'),
                ),
                const SizedBox(height: 12),

                // 9. Share Button (IconButton dengan gaya Tonal)
                Center(
                  child: IconButton.filledTonal(
                    icon: const Icon(Icons.share_rounded),
                    tooltip: 'Bagikan',
                    onPressed: () {
                      debugPrint('Tombol share ditekan');
                    },
                  ),
                ),
                const SizedBox(height: 12),

                // 10. Cupertino Button (iOS style) dengan Icon
                CupertinoButton.filled(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  borderRadius: BorderRadius.circular(12),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.phone, size: 20),
                      SizedBox(width: 8),
                      Text('iOS Style Button'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}