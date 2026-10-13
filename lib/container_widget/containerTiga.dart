import 'package:flutter/material.dart';

class Containertiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 400, 
    height: 400,
    alignment: Alignment(10,10,),
    transformAlignment: Alignment(10, 10),
    child: Container(
      width: 400,
      height: 300,
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        border: Border.all(color: Colors.green.shade800, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Text(
        "Siswa Assalaam Bandung",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,),
      ),
    ),
    );
  }
}
