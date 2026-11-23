import 'package:flutter/material.dart';
import 'package:latihan_1/routes/app_routes.dart';
import 'package:latihan_1/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await AuthService().getToken();
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Latihan 1',
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? AppRoutes.home : AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}