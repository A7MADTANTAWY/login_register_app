import 'package:flutter/material.dart';
import 'package:login_register_page/consts/app_colors.dart';
import 'package:login_register_page/consts/app_strings.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // Force a rebuild and ensure that the latest value of AppStrings.userName is displayed
    return Scaffold(
      backgroundColor: AppColors.darkBlue, // Set background color to black
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.displayName ?? AppStrings.userName,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
        ],
      )),
    );
  }
}
