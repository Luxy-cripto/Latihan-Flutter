import 'package:flutter/material.dart';
import 'package:latihan_1/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Pertamaku",
      debugShowCheckedModeBanner: false,
      
      // Tentukan halaman pertama yang ingin dibuka saat aplikasi dimuat
      initialRoute: AppRoutes.home, 
      
      routes: AppRoutes.routes,
    );
  }
}