import 'package:flutter/material.dart';
import 'package:login_register_page/consts/app_colors.dart';
import 'package:login_register_page/consts/app_strings.dart';

class PasswordTextfeild extends StatefulWidget {
  const PasswordTextfeild({super.key});

  @override
  _PasswordTextfeildState createState() => _PasswordTextfeildState();
}

class _PasswordTextfeildState extends State<PasswordTextfeild> {
  final TextEditingController _passwordController = TextEditingController();
  String _helperMessage = ''; // To hold helper message for validation
  bool _isPasswordVisible = false; // Variable to track password visibility

  // Function to validate password and update helper message
  void _validatePassword(String value) {
    if (value.isEmpty) {
      _helperMessage = 'Password cannot be empty';
    } else if (value.length < 6) {
      _helperMessage = 'Password must be at least 6 digits';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      _helperMessage = 'Password must contain only numbers';
    } else {
      _helperMessage = ''; // Clear the helper message when valid
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller:
                  _passwordController, // Set the controller for the field
              onChanged: (data) {
                AppStrings.userPassword = data; // Store password in AppStrings
                setState(() {
                  _validatePassword(data); // Update helper message
                });
              },
              obscureText: !_isPasswordVisible, // Toggle password visibility
              keyboardType:
                  TextInputType.number, // Set the keyboard to number only
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: AppColors.darkBlue),
                labelText: 'Password',
                labelStyle: const TextStyle(color: AppColors.darkBlue),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: AppColors.darkBlue, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: AppColors.darkBlue, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons
                            .visibility_off, // Change icon based on visibility
                    color: AppColors.darkBlue,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible =
                          !_isPasswordVisible; // Toggle visibility
                    });
                  },
                ),
              ),
            ),
            if (_helperMessage
                .isNotEmpty) // Display helper message if not empty
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _helperMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
