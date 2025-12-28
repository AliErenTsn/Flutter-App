import 'package:flutter/material.dart';
import 'package:flutter_login_page/pages/education_page.dart';
import 'package:flutter_login_page/pages/forget_password.dart';
import 'package:flutter_login_page/pages/menu_page.dart';
import 'package:flutter_login_page/pages/profile_page.dart';
import '../pages/login_page.dart';
import '../pages/sign_up.dart';

class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const forget_password = '/forget_password';
  static const menu_page = '/menu_page';
  static const education_page = 'education_page';
  static const profile_page = 'profile_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => Loginpage());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUp());
      case forget_password:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case menu_page:
        return MaterialPageRoute(builder: (_) => MenuPage());
      case education_page:
        return MaterialPageRoute(builder: (_) => EducationPage());
      case profile_page:
         return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
