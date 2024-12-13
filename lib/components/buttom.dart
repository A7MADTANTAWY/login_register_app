import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register_page/consts/app_colors.dart';
import 'package:login_register_page/consts/app_strings.dart';
import 'package:login_register_page/consts/routes.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final String pageName;

  CustomButton({super.key, required this.title, required this.pageName});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false; // Variable to track loading state

  // Function to show SnackBar message
  void showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.darkBlue,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: AppColors.darkBlue,
          foregroundColor: Colors.white, // Text color
          textStyle: const TextStyle(fontSize: 18.0),
        ),
        onPressed: _isLoading
            ? null // Disable button while loading
            : () async {
                setState(() {
                  _isLoading = true; // Set loading state to true
                });

                if (widget.pageName == AppStrings.login) {
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: AppStrings.userName,
                      password: AppStrings.userPassword,
                    );
                    Navigator.pushNamed(
                        context, AppRoutes.welcome); // Navigate to welcome page
                  } on FirebaseAuthException catch (e) {
                    String errorMessage =
                        "An error occurred, please try again.";
                    if (e.code == 'user-not-found') {
                      errorMessage = "No user found for that email.";
                    } else if (e.code == 'wrong-password') {
                      errorMessage = "Wrong password provided for that user.";
                    } else if (e.code == 'invalid-email') {
                      errorMessage = "The email address is badly formatted.";
                    }
                    showSnackBarMessage(context, errorMessage);
                  }
                } else if (widget.pageName == AppStrings.register) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: AppStrings.userName,
                      password: AppStrings.userPassword,
                    );
                    Navigator.pop(
                        context); // Pop the current register screen and go back to the login screen
                  } on FirebaseAuthException catch (e) {
                    String errorMessage =
                        "An error occurred, please try again.";
                    if (e.code == 'weak-password') {
                      errorMessage = 'The password provided is too weak.';
                    } else if (e.code == 'email-already-in-use') {
                      errorMessage =
                          'The account already exists for that email.';
                    } else if (e.code == 'invalid-email') {
                      errorMessage = "The email address is badly formatted.";
                    }
                    showSnackBarMessage(context, errorMessage);
                  }
                }

                setState(() {
                  _isLoading = false; // Set loading state to false when done
                });
              },
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Colors.white) // Show loading indicator
            : Text(widget.title), // Show title text when not loading
      ),
    );
  }
}
