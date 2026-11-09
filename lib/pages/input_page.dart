import 'package:flutter/material.dart';
import 'package:latihan_1/pages/output_page.dart';


class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  String? _jk;
  String? _jkError;
  String? _pilihAgama = '';

  final List<String> agama = [
    'Islam',
    'Protestan',
    'Katolik',
    'Budha',
    'Atheis',
  ];

  @override
  void initState() {
    tglLahirController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Formulir Biodata',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input Nama';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      // Jenis Kelamin
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jenis Kelamin',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Laki-laki',
                            groupValue: _jk,
                            onChanged: (value) {
                              setState(() {
                                _jk = value;
                                _jkError = null;
                              });
                            },
                          ),
                          const Text('Laki-laki'),
                          const SizedBox(width: 24),
                          Radio<String>(
                            value: 'Perempuan',
                            groupValue: _jk,
                            onChanged: (value) {
                              setState(() {
                                _jk = value;
                                _jkError = null;
                              });
                            },
                          ),
                          const Text('Perempuan'),
                        ],
                      ),
                      if (_jkError != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            _jkError!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: tglLahirController,
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input Tanggal Lahir';
                          }
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              tglLahirController.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 18),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Pilih Agama',
                          border: OutlineInputBorder(),
                        ),
                        items: agama
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihAgama = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih Agama';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: displayWidth(context) * 0.8,
                        height: displayHeight(context) * 0.075,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            'Simpan',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid || _jk == null) {
      if (_jk == null) {
        setState(() {
          _jkError = 'Pilih Jenis Kelamin';
        });
      }
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputFormScreen(
          nama: namaController.text,
          jk: _jk!,
          tglLahir: tglLahirController.text,
          agama: _pilihAgama ?? '',
        ),
      ),
    );
  }

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

class DateFormat {
  DateFormat(String s);

  String format(DateTime pickedDate) {
    final year = pickedDate.year.toString().padLeft(4, '0');
    final month = pickedDate.month.toString().padLeft(2, '0');
    final day = pickedDate.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}