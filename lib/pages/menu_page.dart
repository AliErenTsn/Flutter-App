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
        automaticallyImplyLeading: false,
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
        child:ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text("Profile"),
            )
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

