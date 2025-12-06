import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:motion_apps/models/plant.dart';
import 'package:motion_apps/page/Homepage%20&%20Flow%20Utama/home_page.dart';
import 'package:motion_apps/page/Pantau%20Tanaman/plant_task_screen.dart';
import 'package:motion_apps/page/Profil/profile_screen.dart';

class PlantMonitoringScreen extends StatefulWidget {
  const PlantMonitoringScreen({super.key});

  @override
  State<PlantMonitoringScreen> createState() => _PlantMonitoringScreenState();
}

class _PlantMonitoringScreenState extends State<PlantMonitoringScreen> {
  int _selectedIndex = 1;

  final List<Plant> myPlants = [
    Plant(
      name: "Selada Hidroponik",
      image: "lib/assets/selada_hidroponik.png",
      level: "Mudah",
      time: "Hari ke-1",
      color: const Color(0xFF179778),
    ),
    Plant(
      name: "Bayam Hidroponik",
      image: "lib/assets/bayam_hidroponik.png",
      level: "Mudah",
      time: "Hari ke-5",
      color: const Color(0xFF179778),
    ),
    Plant(
      name: "Cabai Hidroponik",
      image: "lib/assets/cabai_hidroponik.png",
      level: "Sulit",
      time: "Hari ke-10",
      color: const Color(0xFFC10101),
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 2) return; 

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: HeaderCurveClipper(),
              child: Container(
                width: double.infinity,
                height: 240, 
                color: const Color(0xFF093731), 
                child: Stack(
                  children: [
                    Positioned(
                      right: -10,
                      bottom: 0,
                      child: Image.asset(
                        "lib/assets/Tree_inject.png",
                        height: 160,
                        fit: BoxFit.contain,
                        color: Colors.white.withOpacity(0.15),
                        colorBlendMode: BlendMode.srcATop,
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bagaimana Kabar\nTanamanmu Hari Ini?",
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          // Search Bar
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Cari tanaman kamu...",
                              hintStyle: GoogleFonts.plusJakartaSans(
                                color: Colors.grey, 
                                fontSize: 14
                              ),
                              prefixIcon: const Icon(Icons.search, color: Colors.grey),
                              contentPadding: const EdgeInsets.symmetric(vertical: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // DAFTAR TANAMAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daftar Tanamanmu",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),

                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(), 
                      shrinkWrap: true,
                      itemCount: myPlants.length,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1, color: Colors.grey.shade200),
                      ),
                      itemBuilder: (context, index) {
                        return _buildPlantRow(context, myPlants[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // RIWAYAT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riwayat",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),

                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: myPlants.length,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1, color: Colors.grey.shade200),
                      ),
                      itemBuilder: (context, index) {
                        return _buildPlantRow(context, myPlants[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      // NAV
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff179778),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 10, fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 10, fontWeight: FontWeight.w600),
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.estate),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.flower),
              label: "Pantau Tanaman",
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.shopping_bag),
              label: "Marketplace",
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.user_circle),
              label: "Profil",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantRow(BuildContext context, Plant plant) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            plant.image,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        
        // Info Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plant.name,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.circle, size: 8, color: plant.color),
                  const SizedBox(width: 6),
                  Text(
                    plant.level,
                    style: GoogleFonts.plusJakartaSans(
                      color: plant.color,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Image.asset(
                    "lib/assets/Vector.png", 
                    width: 12, 
                    color: const Color(0xFF179778)
                  ),
                  const SizedBox(width: 6),
                  Text(
                    plant.time,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Button Pantau
        SizedBox(
          height: 36,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantTaskScreen(plant: plant),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF179778),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              elevation: 0,
            ),
            child: Text(
              "Pantau",
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40); 
    
    var controlPoint = Offset(size.width / 2, size.height + 20);
    var endPoint = Offset(size.width, size.height - 40);
    
    path.quadraticBezierTo(
      controlPoint.dx, controlPoint.dy, 
      endPoint.dx, endPoint.dy
    );
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}