import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'services/cloudinary_service.dart'; // Cloudinary dosyanı buraya bağla

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(), // Kamera ikonu olmayan yeni yapı
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Hesap",
              icon: Icons.person_outline,
              // ignore: avoid_print
              press: () => print("Hesabım tıklandı"),
            ),
            ProfileMenu(
              text: "Ayarlar",
              icon: Icons.settings_outlined,
              press: () {},
            ),
            ProfileMenu(
              text: "Yardım Merkezi",
              icon: Icons.help_outline,
              press: () {},
            ),
            ProfileMenu(
              text: "Çıkış Yap",
              icon: Icons.logout,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: CircleAvatar(
          radius: 57,
          backgroundColor: Colors.blue, 
          child: const CircleAvatar(
            radius: 53, 
            backgroundColor: Color(0xFFF5F6F9),
            backgroundImage: AssetImage("assets/icons/cat.jpg"),
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Color(0xFF757575), fontSize: 16),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF757575), size: 16),
          ],
        ),
      ),
    );
  }
}

 

 
    


  