import 'package:flutter/material.dart';
import 'package:flutter_login_page/services/firebase_users.dart';
import '../routers/app_routers.dart';
import '/components/TextField.dart';    // GITHUB A USER DATABASE EKLEDNİ COMMIT AT

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<SignUp> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final FirestoreService firestoreService = FirestoreService();

  void registerUser() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // Alanlar boş mu kontrol et
    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Lütfen tüm alanları doldurun!")),
      );
      return;
    }

    // Şifre kontrolü
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Şifreler eşleşmiyor!")),
      );
      return;
    }

    // Firestore’a kaydet 
    await firestoreService.addUser(username, password);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Kayıt başarılı!")),
    );

     Navigator.pushNamed(context, AppRoutes.login);
    // Alanları temizle
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

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
                  registerUser();
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