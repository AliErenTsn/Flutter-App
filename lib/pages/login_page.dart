import 'package:flutter/material.dart';
import 'package:flutter_login_page/routers/app_routers.dart';
import '/components/TextField.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),

              // Icon
                const Icon(
                  Icons.lock,
                  size: 180,
                ),

              const SizedBox(height: 20),

              //Text
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20, 
                ),
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

              const SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("Forget Password clicked!");
                        Navigator.pushNamed(context, AppRoutes.forget_password);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // metnin etrafındaki ekstra boşluğu kaldırır
                        minimumSize: Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
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
                    'LOGIN', style:TextStyle(
                      fontSize: 17,
                      fontFamily: 'Raleway' 
                    ) 
                  ),
                ),

                const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  fixedSize: Size(400, 50),
                  ),
                  child: Text(
                    'SIGN UP', style:TextStyle(
                      fontSize: 17,
                      fontFamily: 'Raleway' 
                    ) 
                  ),
                ),
              
              const SizedBox(height: 15),




            ],
          )
        ),
      )
    );
  }
}