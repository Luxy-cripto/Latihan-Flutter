import 'package:flutter/material.dart';

class KartuProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 84,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 246, 249, 251),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)], // Warna shadow diperhalus sedikit jadi hitam transparan
        ),
        child: Row(
          children: [
           SizedBox(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWoPBJDm3UIDS4vt-PsxCvpTV1EeqyGFpJ0fWWQ4OHc2V4Q',
              ),
            ),
           ),
           SizedBox(width: 12),
           Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Agar teks berada di tengah secara vertikal
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wandi wijaya",
                  style: TextStyle(fontWeight: FontWeight.bold), // Opsional: Biar lebih tebal ala profil
                ),
                SizedBox(height: 4),
                Text("XII RPL 2"),
              ],
            ),
           ),
          ],
        ),
      ),
    );
  }
}