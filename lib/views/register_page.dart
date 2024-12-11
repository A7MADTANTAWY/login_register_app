import 'package:flutter/material.dart';
import 'package:login_register_page/components/buttom.dart';
import 'package:login_register_page/components/password_textfeild.dart';
import 'package:login_register_page/components/swetch_buttom.dart';
import 'package:login_register_page/components/upper_body.dart';
import 'package:login_register_page/components/user_name_textfeild.dart';
import 'package:login_register_page/consts/app_strings.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero, // Removes default padding
        children: [
          UpperBody(
            title: AppStrings.register,
            subtitle: AppStrings.createYourAccount,
          ),
          const SizedBox(height: 30), // Space between fields

          UserNameTextfeild(),

          // Password TextField
          PasswordTextfeild(),
          const SizedBox(height: 50), // Space between fields

          CustomButton(
            title: AppStrings.register,
            pageName: AppStrings.register,
          ),
          const SizedBox(height: 20), // Space between fields

          SwetchButtom(
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back to the previous screen (LoginPage)
            },
            buttonText: AppStrings.login,
            subTitle: AppStrings.iHaveAnAccount, // Switch to login page text
          ),
        ],
      ),
    );
  }
}
