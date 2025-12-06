import 'package:flutter/material.dart';
import 'package:motion_apps/models/kit.dart';
import 'package:motion_apps/models/plant.dart';
// Import halaman tujuan
import 'package:motion_apps/page/Profil/profile_screen.dart';
import 'package:motion_apps/page/Pantau Tanaman/plant_monitoring_screen.dart';
import 'package:motion_apps/widget/kit_card.dart';
import 'package:motion_apps/widget/plant_card.dart';
import 'package:motion_apps/widget/timer_widget.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    if (index == 2) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PlantMonitoringScreen()),
        ).then((_) {
          setState(() => _selectedIndex = 0);
        });
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        ).then((_) {
          setState(() => _selectedIndex = 0);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Plant> plants = [
      Plant(
        name: 'Selada Hidroponik',
        image: 'lib/assets/selada.png',
        level: 'Mudah',
        time: '3–5 Ming',
        color: Colors.green,
      ),
      Plant(
        name: 'Bayam Hidroponik',
        image: 'lib/assets/bayam.png',
        level: 'Mudah',
        time: '3–4 Ming',
        color: Colors.green,
      ),
      Plant(
        name: 'Pakchoy Hidroponik',
        image: 'lib/assets/pakcoy.png',
        level: 'Mudah',
        time: '4–5 Ming',
        color: Colors.green,
      ),
      Plant(
        name: 'Tomat Cherry',
        image: 'lib/assets/tomat.png',
        level: 'Sedang',
        time: '8–10 Ming',
        color: Colors.orange,
      ),
      Plant(
        name: 'Seledri Hidroponik',
        image: 'lib/assets/seledri.png',
        level: 'Sedang',
        time: '5–6 Ming',
        color: Colors.orange,
      ),
      Plant(
        name: 'Stroberi Hidroponik',
        image: 'lib/assets/stroberi.png',
        level: 'Sulit',
        time: '12–16 Ming',
        color: Colors.red,
      ),
    ];

    final List<Kit> kits = [
      Kit(
        name: 'Paket Pipa NFT',
        price: 'Rp 125.000',
        oldPrice: 'Rp 150.000',
        image: 'lib/assets/pipa.png',
      ),
      Kit(
        name: 'Paket Lengkap',
        price: 'Rp 55.000',
        oldPrice: 'Rp 75.000',
        image: 'lib/assets/paket_lengkap.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // --- HEADER HIJAU & GREETING ---
            SliverToBoxAdapter(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 250,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0F4D3A),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Halo Mellafesa! 👋',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.3,
                              ),
                            ),
                            // Navigasi ke Profil lewat Avatar
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                                );
                              },
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage('lib/assets/Memoji Girls.png'),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Berkebun Apa Hari Ini?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -55,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Belum Ada Progress Tanaman Hari Ini...',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Ayo pilih tanaman pertama kamu dan mulai tanam sekarang!',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'lib/assets/Tree_inject.png',
                            width: 90,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 80)),

            // SEARCH BAR
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Cari tanaman...',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            // GRID VIEW (REKOMENDASI)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Rekomendasi Untukmu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PlantCard(plant: plants[index]);
                  },
                  childCount: plants.length,
                ),
              ),
            ),

            // FLASH SALE LIST
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                child: Row(
                  children: const [
                    Text(
                      'Starter Kit Flash Sale 🔥',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    TimerWidget(),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20),
                  itemCount: kits.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: KitCard(kit: kits[index]),
                    );
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
      
      // NAVBAR
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: const Color(0xFF009F7F),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
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
}