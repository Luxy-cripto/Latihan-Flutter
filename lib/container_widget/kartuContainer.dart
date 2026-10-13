import 'package:flutter/material.dart';

class Kartucontainer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 300,
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 100, height: 100, color: Colors.redAccent),
            Column(
              children: [
                Text('Nama : Wandi'),
                Text('Kelas : XII RPL 2'),
                Text('Nis : 123456789'),
              ]
            )
          ]
        )
      )
    );
  }
}