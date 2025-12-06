import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_apps/page/Homepage & Flow Utama/home_page.dart';
import 'package:unicons/unicons.dart';
import 'package:motion_apps/page/Register%20&%20Login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final Color greenNormal = const Color(0xFF179778);
  final Color greenLight = const Color(0xFFE8F5F2);
  final Color darkGreen = const Color(0xFF093731);
  final Color whiteInactive = const Color(0xFFFFFFFF).withOpacity(0.2);
  final Color arrowBg = const Color(0xFFFFFFFF).withOpacity(0.2);

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "lib/assets/image2.png",
      "title": "Tanam Sayur Segar dari Rumah Tanpa Ribet! 🥕🍅",
      "desc": "Bersama HydropoMe, menanam sayuran untuk hidup lebih sehat dan hemat jadi lebih mudah!"
    },
    {
      "image": "lib/assets/image3.png",
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
        MaterialPageRoute(builder: (context) => const LoginPage()), 
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Gambar Background
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            height: screenHeight * 0.6,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  _onboardingData[index]['image']!,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                );
              },
            ),
          ),

          // 2. Green Card (Overlay)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.51, 
            child: ClipPath(
              clipper: CurvedTopClipper(), 
              child: Container(
                color: darkGreen,
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Expanded & Scroll
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              _onboardingData[_currentIndex]['title']!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _onboardingData[_currentIndex]['desc']!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.plusJakartaSans( 
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Navigasi Bawah
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tombol Back
                        _currentIndex > 0
                            ? _buildArrowButton(
                                icon: UniconsLine.arrow_left,
                                onTap: () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                              )
                            : const SizedBox(width: 42, height: 42),

                        // Dots Indicator
                        Row(
                          children: List.generate(
                            _onboardingData.length,
                            (index) {
                              bool isActive = _currentIndex == index;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                height: isActive ? 14 : 12,
                                width: isActive ? 14 : 12,
                                decoration: BoxDecoration(
                                  color: isActive ? greenNormal : whiteInactive,
                                  shape: BoxShape.circle,
                                ),
                              );
                            },
                          ),
                        ),

                        // Tombol Next
                        _buildArrowButton(
                          icon: UniconsLine.arrow_right,
                          onTap: _nextPage,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // 3. Tombol Lewati
          Positioned(
            top: 60,
            right: 20,
            child: Container(
              width: 64,
              height: 36,
              decoration: BoxDecoration(
                color: greenLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                  child: Center(
                    child: Text(
                      "Lewati",
                      style: GoogleFonts.plusJakartaSans( 
                        color: greenNormal,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowButton({required IconData icon, required VoidCallback onTap}) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: arrowBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, 80, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}