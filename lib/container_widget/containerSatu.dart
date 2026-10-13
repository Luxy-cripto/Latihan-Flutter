import 'package:flutter/material.dart';

class Containersatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     height: double.infinity,
     width: double.infinity,
     margin: EdgeInsets.all(15),
    
     padding: EdgeInsets.only(top: 10, left: 10),
     alignment: Alignment.centerLeft,
     decoration: BoxDecoration(
      color: Colors.lime,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black),
      image: DecorationImage(
        image: AssetImage("assets/images/image.png"),
        fit: BoxFit.cover,
      )
      ),
     child: Text ("Login FF dan ML biar pinter"),
     
     
     ); 
    }
}
