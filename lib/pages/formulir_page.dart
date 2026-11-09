import 'package:flutter/material.dart';

class FormulirPage extends StatefulWidget {
  const FormulirPage({super.key});

  @override
  State<FormulirPage> createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  // Memberikan akses global key untuk formulir
  final _formKey = GlobalKey<FormState>();

  // Memberikan controller untuk mengambil nilai input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Wajib dispose controller untuk mencegah memory leak
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi submit dengan validasi
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Nama Lengkap: ${_nameController.text}');
      print('Password: ${_passwordController.text}');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Nama lengkap: ${_nameController.text}")),
      );
    }
  }

  // Fungsi untuk membersihkan teks di dalam controller (Clear Input)
  void _clearInput() {
    setState(() {
      _nameController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Form App')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextFormField Nama
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // TextFormField Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong!';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Tombol Submit
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ),

                const SizedBox(height: 10),
                
                // Tombol Clear Input (Baru ditambahkan)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _clearInput,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red, // Warna teks merah untuk tombol clear
                    ),
                    child: const Text('Clear Text'),
                  ),
                ),

                const SizedBox(height: 10),
                
                // Tombol Get Nama
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      print('Nama saat ini: ${_nameController.text}');
                    },
                    child: const Text('Get Nama (Check Console)'),
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