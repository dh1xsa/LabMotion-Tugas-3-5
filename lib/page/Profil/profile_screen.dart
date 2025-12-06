import 'package:flutter/material.dart';
import 'package:motion_apps/page/Homepage%20&%20Flow%20Utama/home_page.dart';
import 'package:motion_apps/page/Pantau%20Tanaman/plant_monitoring_screen.dart';
import 'package:motion_apps/page/Personalisasi%20User/personalization_screen.dart'; // Import Personalisasi
import 'package:motion_apps/page/Profil/edit_profile_screen.dart';
import 'package:motion_apps/page/Profil/status_pesanan.dart';
import 'package:unicons/unicons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 3; // Index 3 adalah Profil

  // --- LOGIKA NAVIGASI BAWAH ---
  void _onItemTapped(int index) {
    if (index == 3) return; // Jika sudah di Profil, tidak perlu reload

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PlantMonitoringScreen()),
        );
        break;
      case 2:
        // Marketplace tidak ada aksi (sesuai request sebelumnya)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // ============= BOTTOM NAVIGATION =============
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
          currentIndex: currentIndex,
          selectedItemColor: const Color(0xFF009F7F),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped, // Pasang fungsi navigasi disini
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

      // ============= BODY =============
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Color(0xFF014036),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 25,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.15),
                        ),
                        child: const CircleAvatar(
                          radius: 32,
                          backgroundImage:
                              AssetImage("lib/assets/Memoji Girls.png"),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Mellafesa",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "mellafesaa@gmail.com",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Positioned(
                  right: 25,
                  top: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF18C39F),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      minimumSize: const Size(20, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Edit Profil",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 25),
            _buildCardStatus(),

            const SizedBox(height: 20),
            
            // --- MENU PERSONALISASI (DIBERI AKSI NAVIGASI) ---
            _buildMenuCard(
              title: "Personalisasi",
              iconPath: "lib/assets/Vector.png",
              iconSize: 28,
              textColor: Colors.black,
              trailingColor: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonalisasiPage()),
                );
              },
            ),

            const SizedBox(height: 20),
            
            _buildMenuCard(
              title: "Logout",
              icon: Icons.logout,
              iconColor: Colors.red,
              textColor: Colors.red,
              trailingColor: Colors.red,
              onTap: () {
                // Tambahkan logika logout jika perlu, misalnya kembali ke Login
                Navigator.pushReplacementNamed(context, '/login');
              }
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCardStatus() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Status Pesanan Marketplace",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statusItem("Diproses", "lib/assets/3d_square.png"),
              _statusItem("Dikirim", "lib/assets/truck_fast.png"),
              _statusItem("Selesai", "lib/assets/medal_star.png"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusItem(String title, String iconPath) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StatusPesananScreen(status: title),
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(iconPath, width: 45),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // UPDATE: Menambahkan parameter onTap
  Widget _buildMenuCard({
    required String title,
    String? iconPath,
    IconData? icon,
    double iconSize = 30,
    Color textColor = Colors.black,
    Color trailingColor = Colors.black,
    Color iconColor = Colors.black,
    VoidCallback? onTap, // Parameter baru untuk aksi klik
  }) {
    return InkWell( // Bungkus dengan InkWell atau GestureDetector
      onTap: onTap,
      borderRadius: BorderRadius.circular(26),
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            iconPath != null
                ? Image.asset(iconPath, width: iconSize)
                : Icon(icon, size: iconSize, color: iconColor),
      
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
      
            Icon(Icons.arrow_forward_ios, size: 20, color: trailingColor),
          ],
        ),
      ),
    );
  }
}