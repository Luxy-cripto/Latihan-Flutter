import 'package:flutter/material.dart';

class LayoutDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
        
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.image, 
              size: 60, 
              color: Colors.grey,
            ),
          ),
          
          
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.red,
              child: Text(
                "-20%",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        
          Positioned(
            bottom: 8,
            right: 8,
            child: Icon(
              Icons.favorite_border, 
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}