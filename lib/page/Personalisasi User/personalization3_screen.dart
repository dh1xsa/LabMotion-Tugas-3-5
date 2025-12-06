import 'package:flutter/material.dart';

class PersonalisasiLuasPage extends StatefulWidget {
  const PersonalisasiLuasPage({Key? key}) : super(key: key);

  @override
  State<PersonalisasiLuasPage> createState() => _PersonalisasiLuasPageState();
}

class _PersonalisasiLuasPageState extends State<PersonalisasiLuasPage> {
  int? _selectedArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      body: Stack(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
              color: Color(0xFF08352A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TOP BAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                      // const Text(
                      //   "3/3",
                      //   style: TextStyle(color: Colors.white, fontSize: 16),
                      // ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Lewati",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Berapa luas area tanam yang\nkamu miliki?",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 14),

                        _buildAreaOption(
                          value: 0,
                          label: "< 1 m²",
                          imagePath: "assets/greenStack.png",
                          imgWidth: 55,
                          imgHeight: 55,
                        ),
                        const SizedBox(height: 10),

                        _buildAreaOption(
                          value: 1,
                          label: "1–3 m²",
                          imagePath: "assets/greenStack.png",
                          imgWidth: 90,
                          imgHeight: 90,
                        ),
                        const SizedBox(height: 10),

                        _buildAreaOption(
                          value: 2,
                          label: "> 3 m²",
                          imagePath: "assets/greenStack.png",
                          imgWidth: 130,
                          imgHeight: 130,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan navigasi ke Home dan hapus history route sebelumnya agar tidak bisa back
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF179C79),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                          "Simpan",
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
        ],
      ),
    );
  }

  Widget _buildAreaOption({
    required int value,
    required String label,
    required String imagePath,
    required double imgWidth,
    required double imgHeight,
  }) {
    final bool isSelected = _selectedArea == value;

    return InkWell(
      onTap: () => setState(() => _selectedArea = value),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF0EAD69) : const Color(0xFFE0E0E0),
            width: 1.5,
          ),
          color: isSelected
              ? const Color(0xFF0EAD69).withOpacity(0.12)
              : Colors.white,
        ),

        child: IntrinsicHeight(
          child: Row(
            children: [
              Radio<int>(
                value: value,
                groupValue: _selectedArea,
                activeColor: const Color(0xFF0EAD69),
                onChanged: (v) => setState(() => _selectedArea = v),
              ),

              const SizedBox(width: 10),
              SizedBox(
                width: imgWidth,
                height: imgHeight,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
