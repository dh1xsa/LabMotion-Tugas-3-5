import 'package:flutter/material.dart';
import 'package:motion_apps/page/Register%20&%20Login/login_screen.dart';

class PersonalisasiPage extends StatefulWidget {
  const PersonalisasiPage({Key? key}) : super(key: key);

  @override
  State<PersonalisasiPage> createState() => _PersonalisasiPageState();
}

const String leafIcon = "assets/Vector.png";
const Color kLight = Color(0xFFE8F5F2);
const Color kLightHover = Color(0xFFDCEFEB);
const Color kLightActive = Color(0xFFCBE9D9);
const Color kNormal = Color(0xFF179C79);
const Color kNormalHover = Color(0xFF158D6C);
const Color kNormalActive = Color(0xFF127E60);
const Color kDark = Color(0xFF117155);
const Color kDarkHover = Color(0xFF0C6458);
const Color kDarkActive = Color(0xFF0A6436);
const Color kDarker = Color(0xFF08352A);

class _PersonalisasiPageState extends State<PersonalisasiPage> {
  int _selectedExperience = -1;
  int _selectedPurpose = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      body: Stack(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              color: Color(0xFF08352A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Lewati",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 20), 

                    const Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10), 
                      child: const Text(
                        'Yuk Jawab Biar HydropoMe\nTahu Kebutuhanmu 💚',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    _buildQuestionCard(
                      iconAsset: leafIcon,
                      title:
                          'Apakah kamu pernah mencoba\nmenanam hidroponik sebelumnya?',
                      options: const [
                        'Belum pernah',
                        'Pernah, tapi masih pemula',
                        'Sudah cukup berpengalaman',
                      ],
                      selectedIndex: _selectedExperience,
                      onChanged: (value) =>
                          setState(() => _selectedExperience = value),
                    ),

                    _buildQuestionCard(
                      iconAsset: leafIcon,
                      title:
                          'Apa tujuan utama kamu menggunakan\naplikasi HydropoMe?',
                      options: const [
                        'Belajar hidroponik dari awal',
                        'Merawat tanaman hidroponik yang sudah ada',
                        'Membeli peralatan dan perlengkapan hidroponik',
                        'Menjual hasil panen',
                      ],
                      selectedIndex: _selectedPurpose,
                      onChanged: (value) =>
                          setState(() => _selectedPurpose = value),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/personalisasi2');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF179C79),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Selanjutnya",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            height: 2.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQuestionCard({
    required String iconAsset,
    required String title,
    required List<String> options,
    required int selectedIndex,
    required Function(int) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < options.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onChanged(i),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedIndex == i
                          ? const Color(0xFF0EAD69)
                          : const Color(0xFFE0E0E0),
                      width: 1.5,
                    ),
                    color: selectedIndex == i
                        ? const Color(0xFF0EAD69).withOpacity(0.1)
                        : Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Row(
                    children: [
                      Radio<int>(
                        value: i,
                        groupValue: selectedIndex,
                        activeColor: const Color(0xFF0EAD69),
                        onChanged: (value) => onChanged(value!),
                      ),
                      Expanded(
                        child: Text(
                          options[i],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
