import 'package:flutter/material.dart';

class FormulirPage extends StatefulWidget {
  const FormulirPage({super.key});

  @override
  State<FormulirPage> createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  // memeberikan akses global key untuk formulir
  final _formKey = GlobalKey<FormState>();

  // memberikan variabel
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _sumbitForm() {
    print('Nama Lengkap: ${_nameController.text}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nama lengkap : ${_nameController.text}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Form App')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    print('Nama: ${_nameController.text}');
                  },
                  child: const Text('Get Nama'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _sumbitForm();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
