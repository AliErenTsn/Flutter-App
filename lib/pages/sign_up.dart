import 'package:flutter/material.dart';
import '../routers/app_routers.dart';
import '/components/TextField.dart';

class SignUp extends StatelessWidget{
  SignUp({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 75),
            
            // Icon
                const Icon(
                  Icons.person,
                  size: 130,
                ),


              const SizedBox(height: 50),

              //Username
              MyTextField(
                width: 350,
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),
              //PASSWORD
              MyTextField(
                width: 350,
                controller: passwordController,  // flutter run -d edge sonra kod degikilginde 'r' bas terminalde
                hintText: 'Password',
                obscureText: true,
              ),

               const SizedBox(height: 10),

              MyTextField(
                width: 350,
                controller: confirmPasswordController,  
                hintText: 'Confirm Password',
                obscureText: true,
              ),


              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // metnin etrafrındaki ekstra boşluğu kaldırır
                        minimumSize: Size(50, 30),
                      ),
                      child: const Text(
                        'If you already have an account, go back to the main page.',
                        style: TextStyle(
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              
              //Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.menu_page);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  fixedSize: Size(400, 50),
                  ),
                  child: Text(
                    'KAYDET', style:TextStyle(
                      fontSize: 17,
                      fontFamily: 'Raleway' 
                    ) 
                  ),
                ),

                const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  fixedSize: Size(400, 50),
                  ),
                  child: Text(
                    'LOGIN', style:TextStyle(
                      fontSize: 17,
                      fontFamily: 'Raleway' 
                    ) 
                  ),
                ),
              
              const SizedBox(height: 15),
          ],
        )
      ),
    );
  }

}