import 'package:flutter/material.dart';

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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              const Text(
                "Selamat Datang Kembali\nHydropoMate! 🌿🌿",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 24),

              const Text(
                "Email",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  hintText: "Masukkan Email",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kNormal, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 6),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Masukkan Password",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.4,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kNormal, width: 2),
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Ubah ke Home
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kNormal,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum memiliki akun? "),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        color: kNormal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
