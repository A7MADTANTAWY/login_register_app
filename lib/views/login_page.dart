import 'package:flutter/material.dart';
import 'package:login_register_page/components/buttom.dart';
import 'package:login_register_page/components/password_textfeild.dart';
import 'package:login_register_page/components/swetch_buttom.dart';
import 'package:login_register_page/components/upper_body.dart';
import 'package:login_register_page/components/user_name_textfeild.dart';
import 'package:login_register_page/consts/app_strings.dart';
import 'package:login_register_page/consts/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero, // Removes default padding
        children: [
          UpperBody(
            title: AppStrings.signInToYourNAccount,
            subtitle: AppStrings.signInToYourAccount,
          ),
          const SizedBox(height: 30), // Space between fields

          UserNameTextfeild(),

          // Password TextField
          PasswordTextfeild(),
          const SizedBox(height: 50), // Space between fields

          CustomButton(
            title: AppStrings.login,
            pageName: AppStrings.login,
          ),
          const SizedBox(height: 20), // Space between fields

          SwetchButtom(
            onPressed: () {
              Navigator.pushNamed(
                  context, AppRoutes.register); // Navigate to register page
            },
            buttonText: AppStrings.register,
            subTitle:
                AppStrings.doNotHaveAnAccount, // Switch to register page text
          ),
        ],
      ),
    );
  }
}
