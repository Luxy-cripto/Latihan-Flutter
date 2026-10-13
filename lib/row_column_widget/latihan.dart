import 'package:flutter/material.dart';

class Latihan22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(   
        child: SingleChildScrollView(
          child: Column(
            children: [           
              Container(
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: const Text(
                  'Persib',
                  style: TextStyle(
                    fontSize: 28, 
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 100),

              
             Row(
              children: [
                // Kotak Logo Kiri
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Image.asset(
                        "assets/images/image.png", 
                        fit: BoxFit.contain,           
                      ),
                    ),
                  ),
                ),
                // Kotak Logo Kanan
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0, right: 16.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Image.asset(
                        "assets/images/image.png", 
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),


              const SizedBox(height: 200),

              Container(
                width: double.infinity,
                height: 140,
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Container(
                  color: Colors.blue[700], 
                  padding: const EdgeInsets.all(12.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Persib aing juara,\nconsectetur adipiscing elit.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 140,
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Container(
                  color: Colors.blue[400], 
                  padding: const EdgeInsets.all(12.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Persib aing juara,\nconsectetur adipiscing elit.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
