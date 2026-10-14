import 'package:flutter/material.dart';
import 'package:latihan_1/pages/about_page.dart';
import 'package:latihan_1/pages/formulir_page.dart';
import 'package:latihan_1/pages/home_page.dart';
import 'package:latihan_1/GridView/LatihanGrid.dart' as grid_file;

class AppRoutes {
  // Path rute aplikasi
  static const home = '/';
  static const about = '/about';
  static const latihanGrid = '/latihan-grid';
  static const formulir = '/formulir';

  // Daftar rute beserta widget tujuannya
  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    about: (context) => AbouPage(),
    latihanGrid: (context) => grid_file.SocialFeedPage(),
    formulir:(context) => FormulirPage(),
  };
}
