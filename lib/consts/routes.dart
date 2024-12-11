import 'package:flutter/material.dart';
import 'package:login_register_page/views/login_page.dart';
import 'package:login_register_page/views/register_page.dart';
import 'package:login_register_page/views/welcome.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String welcome = '/welcome';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginPage(),
      register: (context) => const RegisterPage(),
      welcome: (context) => const WelcomePage(),
    };
  }
}
