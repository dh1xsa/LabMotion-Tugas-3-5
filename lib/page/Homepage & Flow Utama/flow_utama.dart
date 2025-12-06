import 'package:flutter/material.dart';
import 'package:motion_apps/models/plant.dart';

class PlantDetailScreen extends StatelessWidget {
  final Plant plant;

  const PlantDetailScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ======================
      // SCROLLABLE CONTENT
      // ======================
      body: CustomScrollView(
        slivers: [
          // ======================
          // HEADER IMAGE
          // ======================
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    plant.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  // Tombol Back
                  Positioned(
                    top: 40,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, size: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ======================
          // DETAIL CONTENT
          // ======================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    plant.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Level + Time
                  Row(
                    children: [
                      Icon(Icons.circle, size: 12, color: plant.color),
                      const SizedBox(width: 6),
                      Text(
                        plant.level,
                        style: TextStyle(
                          color: plant.color,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        plant.time,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // DESCRIPTION
                  const Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Selada merupakan salah satu tanaman paling populer dalam budidaya hidroponik karena pertumbuhannya yang cepat dan perawatannya yang mudah. "
                        "Tanaman ini cocok untuk pemula karena tidak memerlukan banyak nutrisi khusus atau perawatan intensif. "
                        "Selada tumbuh subur di sistem hidroponik seperti NFT dan dapat dipanen dalam waktu 3–5 minggu setelah tanam.",
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),

                  const SizedBox(height: 24),

                  // TOOLS & MATERIAL
                  const Text(
                    "Alat dan Bahan",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  _buildBulletList(),

                  const SizedBox(height: 30),

                  // TUTORIAL
                  const Text(
                    "Tutorial Menanam",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  _buildTutorialCard(),

                  const SizedBox(height: 30),

                  // ======================
                  // BUTTON (Now Scrollable)
                  // ======================
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E9B6A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Mulai Tanam dan Pantau",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ======================
  // BULLET LIST BUILDER
  // ======================
  Widget _buildBulletList() {
    final List<String> items = [
      "Wadah atau Bak Tanam – Tempat air nutrisi dan tanaman diletakkan.",
      "Net Pot / Pot kecil berlubang – Untuk menahan tanaman dan media tanam.",
      "Spons/Rockwool – Media tanam tempat benih tumbuh.",
      "Pompa Air (untuk NFT) – Mengalirkan nutrisi secara sirkulasi.",
      "Penutup atau Styrofoam (untuk rakit apung) – Untuk menopang netpot.",
      "Alat ukur pH dan TDS – Untuk memantau kualitas larutan nutrisi.",
      "Benih selada.",
      "Nutrisi AB Mix.",
      "Air Bersih.",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            "${index + 1}. ${items[index]}",
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),
        );
      }),
    );
  }

  // ======================
  // VIDEO TUTORIAL CARD
  // ======================
  Widget _buildTutorialCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.asset(
                  "lib/assets/video_tutorial.png",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        size: 42,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              "Menanam ${plant.name}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
