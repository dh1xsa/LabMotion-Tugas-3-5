import 'dart:async';
import 'package:flutter/material.dart';
import 'package:motion_apps/page/Homepage & Flow Utama/home_page.dart'; // Pastikan path ini benar

// ================= SPLASH SCREEN =================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer 3 detik, lalu pindah ke Onboarding
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Image.asset(
            'assets/Frame 1410128042.png',
            width: 200,
          ),
        ),
      ),
    );
  }
}

// ================= ONBOARDING SCREEN =================
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();  
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/image 2.png",
      "title": "Tanam Sayur Segar dari Rumah Tanpa Ribet! 🥕🍅",
      "desc": "Bersama HydropoMe, menanam sayuran untuk hidup lebih sehat dan hemat jadi lebih mudah!"
    },
    {
      "image": "assets/image 3.png",
      "title": "Belanja Starter Kit & Jual Hasil Panen!",
      "desc": "Belanja, jual panen, dan penuhi kebutuhanmu di marketplace kami. Praktis banget buat kamu yang suka berkebun dari rumah!"
    },
  ];

  void _nextPage() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose(); // Bersihkan controller saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color darkGreen = const Color(0xFF093731);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. PageView (Untuk Slide Gambar & Teks)
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              // Di sini fungsi setState bekerja: Memberitahu layar untuk update tampilan (terutama titik indikator)
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Gambar Full Screen
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Image.asset(
                      _onboardingData[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  // Kartu Hijau dengan Lengkungan
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ClipPath(
                      clipper: CurvedTopClipper(),
                      child: Container(
                        color: darkGreen,
                        padding: const EdgeInsets.fromLTRB(24, 80, 24, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _onboardingData[index]['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _onboardingData[index]['desc']!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // 2. Tombol Lewati (Skip)
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Text(
                  "Lewati",
                  style: TextStyle(color: darkGreen, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // 3. Navigasi Bawah (Titik & Tombol)
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol Back (Hanya muncul jika index > 0)
                _currentIndex > 0
                    ? IconButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        icon: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      )
                    : const SizedBox(width: 48), // Spacer

                // Indikator Titik (Dots)
                Row(
                  children: List.generate(
                    _onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        // Logika perubahan warna titik berdasarkan state _currentIndex
                        color: _currentIndex == index
                            ? const Color(0xFF00BF63) // Hijau terang (Aktif)
                            : Colors.white.withOpacity(0.3), // Pudar (Tidak aktif)
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                // Tombol Next (Panah)
                IconButton(
                  onPressed: _nextPage,
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ================= CUSTOM CLIPPER (Lengkungan) =================
class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 40); 
    // Membuat lengkungan cekung ke bawah
    path.quadraticBezierTo(size.width / 2, 100, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}