import 'package:flutter/material.dart';
import 'package:motion_apps/page/Register%20&%20Login/login_screen.dart';

class Personalisasi2Page extends StatefulWidget {
  const Personalisasi2Page({Key? key}) : super(key: key);

  @override
  State<Personalisasi2Page> createState() => _Personalisasi2PageState();
}

class _Personalisasi2PageState extends State<Personalisasi2Page> {
  final List<bool> _selectedTime = [false, false, false, false];

  int? _selectedTimeSpent;      
  int? _selectedLocation;      

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
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // 🔹 TOP BAR
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text("Lewati", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 45),

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
                            'Jenis tanaman apa saja yang ingin kamu\ntanam?',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 12),

                          _buildCheckboxOption(0, "Sayuran daun(misalnya selada, bayam)"),
                          _buildCheckboxOption(1, "Buah(misalnya tomat, stroberi)"),
                          _buildCheckboxOption(2, "Tanaman herbal"),
                          _buildCheckboxOption(3, "Belum tahu/ingin rekomendasi"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
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
                          const Text(
                            'Berapa waktu yang bisa diluangkan\nper hari untuk merawat tanaman?',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 12),

                          _buildRadioOption(
                            value: 0,
                            label: "<10 menit",
                            groupValue: _selectedTimeSpent,
                            onChanged: (v) => setState(() => _selectedTimeSpent = v),
                          ),
                          _buildRadioOption(
                            value: 1,
                            label: "10-30 menit",
                            groupValue: _selectedTimeSpent,
                            onChanged: (v) => setState(() => _selectedTimeSpent = v),
                          ),
                          _buildRadioOption(
                            value: 2,
                            label: ">30 menit",
                            groupValue: _selectedTimeSpent,
                            onChanged: (v) => setState(() => _selectedTimeSpent = v),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
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
                          const Text(
                            'Di mana kamu akan menanam tanaman\nhidroponik?',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 12),

                          _buildRadioOption(
                            value: 0,
                            label: "Dalam ruangan",
                            groupValue: _selectedLocation,
                            onChanged: (v) => setState(() => _selectedLocation = v),
                          ),
                          _buildRadioOption(
                            value: 1,
                            label: "Luar ruangan",
                            groupValue: _selectedLocation,
                            onChanged: (v) => setState(() => _selectedLocation = v),
                          ),
                          _buildRadioOption(
                            value: 2,
                            label: "Balkon atau teras",
                            groupValue: _selectedLocation,
                            onChanged: (v) => setState(() => _selectedLocation = v),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/personalisasi3');
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
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxOption(int index, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () => setState(() => _selectedTime[index] = !_selectedTime[index]),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
           border: Border.all(
              color: _selectedTime[index] ? const Color(0xFF0EAD69) : const Color(0xFFE0E0E0),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Checkbox(
                value: _selectedTime[index],
                activeColor: const Color(0xFF0EAD69),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onChanged: (val) => setState(() => _selectedTime[index] = val!),
              ),
              Text(label, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 RADIO BUILDER (SUDAH DIREVISI)
  Widget _buildRadioOption({
    required int value,
    required String label,
    required int? groupValue,
    required ValueChanged<int?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () => onChanged(value),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: groupValue == value ? const Color(0xFF0EAD69) : const Color(0xFFE0E0E0),
              width: 1.5,
            ),
            color: groupValue == value
                ? const Color(0xFF0EAD69).withOpacity(0.1)
                : Colors.white,
          ),
          child: Row(
            children: [
              Radio<int>(
                value: value,
                groupValue: groupValue,
                activeColor: const Color(0xFF0EAD69),
                onChanged: onChanged,
              ),
              Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
            ],
          ),
        ),
      ),
    );
  }
}
