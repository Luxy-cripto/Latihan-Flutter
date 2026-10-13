import 'package:flutter/material.dart';

class ContainerDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Container(
        width: 300,
        height: 200,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          border: Border.all(color: Colors.green.shade800, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text(
          'SMK ASSALAAM BANDUNG',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
