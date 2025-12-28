import 'package:flutter/material.dart';
import 'package:flutter_login_page/routers/app_routers.dart';
import '/components/MenuButton.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("IAU"),
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions:[ 
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context , AppRoutes.login);
            }
          ),
        ]
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Üstteki boşluğu sıfırlar
          children: [
            // İnceltilmiş Mavi Header
            SizedBox(
              height: 100, // Yüksekliği buradan kontrol edebilirsin
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                ),
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "MENÜ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22, // Büyük başlık
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Profil Seçeneği
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue, size: 28),
              title: const Text(
                "Profil",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profile_page);
              },
            ),

            const Divider(), // Araya ince bir çizgi

            // Çıkış Yap Seçeneği
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.redAccent, size: 28),
              title: const Text(
                "Çıkış Yap",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            MenuButton(
              icon: Image.asset
                ('assets/icons/3074058.png',
                height: 80,
                width: 80,),
              label: "Education",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.education_page);
              },
            ),
            MenuButton(
              icon: Image.asset
              ('assets/icons/united-nations.png',
                height: 80,
                width: 80,), 
              label: "Uluslararası",
              onTap: () {},
            ),
            MenuButton(
              icon: Image.asset('assets/icons/2717575.png',
                height: 80,
                width: 80,),
              label: "Research",
              onTap: () {},
            ),
            MenuButton(
              icon: Image.asset('assets/icons/9942543.png',
                height: 80,
                width: 80,),
              label: "Toplumsal",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

