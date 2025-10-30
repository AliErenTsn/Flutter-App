import 'package:flutter/material.dart';
import 'package:flutter_login_page/routers/app_routers.dart';

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuButton(
              icon: Image.asset
                ('assets/icons/3074058.png',
                height: 80,
                width: 80,),
              label: "Education",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.education_page);
              },
            ),
            _buildMenuButton(
              icon: Image.asset
              ('assets/icons/united-nations.png',
                height: 80,
                width: 80,), 
              label: "Uluslararası",
              onTap: () {},
            ),
            _buildMenuButton(
              icon: Image.asset('assets/icons/2717575.png',
                height: 80,
                width: 80,),
              label: "Research",
              onTap: () {},
            ),
            _buildMenuButton(
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

  Widget _buildMenuButton({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(2, 4),
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
