import 'package:flutter/material.dart';
import '../routers/app_routers.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 170),
            
            Center(
              child: 
                Image.asset(
                  'assets/icons/tinder.png',
                  width: 100,
                  height: 100,
              )
            ),

            const SizedBox(height: 100),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: Size(150, 30),
                ),
                child: Text(
                  'Main Page', style:TextStyle(
                    fontSize: 17,
                    fontFamily: 'Raleway' 
                  ) 
                ),
              ),
          ],
        )
      ),
    );
  }

}