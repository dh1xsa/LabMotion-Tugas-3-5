import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool showPassword1 = false;
  bool showPassword2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
        title: const Text(
          "Edit Profil",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// Avatar + Edit Button
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("lib/assets/Memoji Girls.png"),
                ),
                GestureDetector(
                  onTap: () {
                    // action ganti foto
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF18C39F),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            buildTextField("Nama Lengkap", "Mellafesa"),

            buildTextField("Email", "mellafesaa@gmail.com"),

            buildPasswordField("Password", showPassword1, () {
              setState(() => showPassword1 = !showPassword1);
            }),

            buildPasswordField("Ubah Password", showPassword2, () {
              setState(() => showPassword2 = !showPassword2);
            }),

            const SizedBox(height: 160),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF18C39F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Simpan",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            filled: true,
            fillColor: const Color(0xFFF7F7F7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF18C39F),
                width: 1.4,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF18C39F),
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPasswordField(
      String label, bool isVisible, VoidCallback toggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: !isVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: toggle,
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            filled: true,
            fillColor: const Color(0xFFF7F7F7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Color(0xFF18C39F), width: 1.4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Color(0xFF18C39F), width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}
