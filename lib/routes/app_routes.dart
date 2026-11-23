import 'package:flutter/material.dart';
import 'package:latihan_1/GridView/LatihanGrid.dart' as grid_file;
import 'package:latihan_1/form/TokoElektronik/electronics_store_app.dart'
    as electronics;
import 'package:latihan_1/pages/about_page.dart';
import 'package:latihan_1/pages/album_page.dart';
import 'package:latihan_1/pages/formulir_page.dart';
import 'package:latihan_1/pages/home_page.dart';
import 'package:latihan_1/pages/input_page.dart';
import 'package:latihan_1/pages/login_page.dart';
import 'package:latihan_1/pages/post_page.dart';
import 'package:latihan_1/pages/user_page.dart';

class AppRoutes {
  // Path rute aplikasi
  static const home = '/';
  static const about = '/about';
  static const latihanGrid = '/latihan-grid';
  static const formulir = '/formulir';
  static const inputForm = '/input-form';
  static const outputForm = '/output-form';
  static const tokoElektronik = '/toko-elektronik';
  static const albumPage = '/album-page';
  static const postPage = '/post-page';
  static const userPage = '/user-page';
  static const login = '/login';
  static const register = '/register';

  // Daftar rute beserta widget tujuannya
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomesPage(),
    about: (context) => const AboutPage(),
    latihanGrid: (context) =>  grid_file.SocialFeedPage(),
    formulir: (context) => const FormulirPage(),
    inputForm: (context) => const BelajarForm(),
    tokoElektronik: (context) => const electronics.ElectronicsStoreApp(),
    albumPage: (context) => const AlbumPage(),
    postPage: (context) => const PostPage(),
    userPage: (context) => const UserPage(),
    login: (context) => const LoginPage(),
    // register: (context) => const RegisterPage(), // aktifkan jika sudah ada halaman register
  };
}