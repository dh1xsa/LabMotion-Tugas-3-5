import 'package:flutter/material.dart';
import 'package:motion_apps/page/Splashscreen%20&%20Onboarding/splash_screen.dart';
import 'package:motion_apps/page/Register%20&%20Login/login_screen.dart';
import 'package:motion_apps/page/Register%20&%20Login/register_screen.dart';
import 'package:motion_apps/page/Personalisasi%20User/personalization_screen.dart';
import 'package:motion_apps/page/Personalisasi%20User/personalization2_screen.dart';
import 'package:motion_apps/page/Personalisasi%20User/personalization3_screen.dart';
import 'package:motion_apps/page/Homepage%20&%20Flow%20Utama/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/personalisasi': (context) => const PersonalisasiPage(),
        '/personalisasi2': (context) => const Personalisasi2Page(),
        '/personalisasi3': (context) => const PersonalisasiLuasPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}