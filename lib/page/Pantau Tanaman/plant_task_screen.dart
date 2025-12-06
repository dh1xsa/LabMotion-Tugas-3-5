import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_apps/models/plant.dart';
import 'package:unicons/unicons.dart';

class PlantTaskScreen extends StatefulWidget {
  final Plant plant;

  const PlantTaskScreen({super.key, required this.plant});

  @override
  State<PlantTaskScreen> createState() => _PlantTaskScreenState();
}

class _PlantTaskScreenState extends State<PlantTaskScreen> {
  bool isNutrisiChecked = true;
  bool isRockwoolChecked = false;
  bool isBenihChecked = false;
  bool isTutupChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1. HEADER
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  // Tombol Back
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                      onPressed: () => Navigator.pop(context),
                      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  
                  // Judul Tengah
                  Expanded(
                    child: Center(
                      child: Text(
                        "Pantau Tanaman",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // 2. KONTEN SCROLLABLE
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // GAMBAR DENGAN CURVE BAWAH
                    ClipPath(
                      clipper: ImageBottomCurveClipper(),
                      child: SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset(
                          widget.plant.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    // ISI KONTEN
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          
                          // Judul Tanaman & Tag
                          Text(
                            widget.plant.name,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.circle, size: 10, color: widget.plant.color),
                              const SizedBox(width: 6),
                              Text(
                                widget.plant.level,
                                style: GoogleFonts.plusJakartaSans(
                                  color: widget.plant.color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Image.asset(
                                "lib/assets/Vector.png", 
                                width: 14, 
                                color: const Color(0xFF179778)
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.plant.time,
                                style: GoogleFonts.plusJakartaSans(
                                  color: Colors.black87, 
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Card Progres Menanam
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 15,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Progres Menanam",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Ayo mulai menanam!",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12, 
                                          color: Colors.grey
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: LinearProgressIndicator(
                                          value: 0.05, 
                                          minHeight: 8,
                                          backgroundColor: const Color(0xFFFFF3E0),
                                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "0% Selesai",
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.orange,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Image.asset(
                                  "lib/assets/Tree_inject.png", 
                                  width: 50, 
                                  fit: BoxFit.contain
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Day Selector (Scrollable 8 Hari)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(8, (index) { 
                                bool isActive = index == 0; 
                                return Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: isActive ? const Color(0xFF179778) : const Color(0xFFE8F5F2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Hari",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 9,
                                          color: isActive ? Colors.white70 : const Color(0xFF0F4D3A),
                                        ),
                                      ),
                                      Text(
                                        "0${index + 1}",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: isActive ? Colors.white : const Color(0xFF179778),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Card Tugas
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 15,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Transform.rotate(
                                      angle: 0.6,
                                      child: const Icon(Icons.push_pin, color: Colors.red, size: 20),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Tugas Hari ke-1",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                _buildCheckbox("Siapkan Nutrisi & Air 🧪", isNutrisiChecked, (v) => setState(() => isNutrisiChecked = v!)),
                                _buildCheckbox("Rendam Rockwool 🧽", isRockwoolChecked, (v) => setState(() => isRockwoolChecked = v!)),
                                _buildCheckbox("Tanam Benih Selada 🌱", isBenihChecked, (v) => setState(() => isBenihChecked = v!)),
                                _buildCheckbox("Tutup & Simpan ☁️", isTutupChecked, (v) => setState(() => isTutupChecked = v!)),

                                const SizedBox(height: 20),
                                
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Image.asset(
                                        "lib/assets/Vector.png", 
                                        width: 16, 
                                        color: const Color(0xFF179778)
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tips Hari Ini:",
                                            style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            "Gunakan air tanpa kaporit untuk hasil terbaik!",
                                            style: GoogleFonts.plusJakartaSans(fontSize: 13, color: Colors.grey[600]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Promo Banner
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "lib/assets/Banner_iklan_marketplace.png",
                              width: double.infinity,
                              height: 280,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Tombol Aksi Bawah
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFF009F7F)),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                backgroundColor: const Color(0xFFE8F5F2),
                              ),
                              child: Text(
                                "Lihat Panduan",
                                style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xFF179778),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              onPressed: () {
                                _showSuccessDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF179778),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                              child: Text(
                                "Hari ke-1 Selesai",
                                style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox(String text, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF179778),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              side: const BorderSide(color: Colors.grey, width: 1.5),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // POPUP DIALOG
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Color(0xFF179778),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 48),
                ),
                const SizedBox(height: 24),
                Text(
                  "Tugas Hari ke-1 Selesai 🎉",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF179778),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(
                      "Hari Berikutnya",
                      style: GoogleFonts.plusJakartaSans(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8F5F2),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Color(0xFF179778)),
                      ),
                    ),
                    child: Text(
                      "Kembali",
                      style: GoogleFonts.plusJakartaSans(color: const Color(0xFF179778), fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// CLIPPER
class ImageBottomCurveClipper extends CustomClipper<Path> {
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