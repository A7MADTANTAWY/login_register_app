import 'package:flutter/material.dart';
import 'package:login_register_page/views/get_started_page.dart';
import 'package:login_register_page/views/login_page.dart';
import 'package:login_register_page/views/register_page.dart';
import 'package:login_register_page/views/welcome.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String welcome = '/welcome';
  static const String getStarted = '/getStarted';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginPage(),
      register: (context) => const RegisterPage(),
      welcome: (context) => WelcomePage(),
      getStarted: (context) => GetStartedPage(),
    };
  }
}
