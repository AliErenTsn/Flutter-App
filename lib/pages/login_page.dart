import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/routers/app_routers.dart';
import '/components/TextField.dart';
import 'package:flutter_login_page/services/firebase_users.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

  class _LoginpageState extends State<Loginpage> {
  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  void loginUser() async {
    
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if(username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tüm alanları doldurun!!')),
      );
      return;
    }

    bool userExist = await firestoreService.checkUser(username, password);

    if(userExist) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Hoşgeldin, $username'))
      ); 
      Navigator.pushReplacementNamed(context, AppRoutes.menu_page , arguments: username); 
      
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Kullanıcı adı veya şifre hatalı!")),
      );
    }
  }

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
                  loginUser();
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