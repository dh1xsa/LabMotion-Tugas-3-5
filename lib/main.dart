import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_apps/page/Splashscreen%20&%20Onboarding/splash_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HydropoMe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF004D40)),
        useMaterial3: true,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(), 
      ),
      home: const SplashScreen(),
    );
  }
}