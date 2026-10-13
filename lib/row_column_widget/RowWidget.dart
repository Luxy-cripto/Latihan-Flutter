import 'package:flutter/material.dart';

class Rowwidget extends StatelessWidget {
  const Rowwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Ini isi Row 1'),
        Text('Ini isi Row 2'),
        Text('Ini isi Row 3'),
        FlutterLogo(
          size: 50,
          textColor: Colors.blue,
        )
      ],
    );
  }
}