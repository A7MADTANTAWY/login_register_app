import 'package:flutter/material.dart';
import 'package:login_register_page/consts/app_colors.dart';
import 'package:login_register_page/consts/app_strings.dart';

class PasswordTextfeild extends StatefulWidget {
  PasswordTextfeild({super.key});

  @override
  _PasswordTextfeildState createState() => _PasswordTextfeildState();
}

class _PasswordTextfeildState extends State<PasswordTextfeild> {
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = ''; // To hold error message for validation
  bool _isPasswordVisible = false; // Variable to track password visibility

  // Function to validate password
  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    } else if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return 'Password must contain at least one letter';
    } else if (!RegExp(r'[@$!%*?&]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null; // No error
  }

  // Function to clear the text field
  void clearPasswordField() {
    _passwordController.clear();
    setState(() {
      _errorMessage = ''; // Clear any error message
    });
  }

  // Function to be called after successful login or registration
  void handleSuccessfulLoginOrRegister() {
    clearPasswordField();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TextField(
          controller: _passwordController, // Set the controller for the field
          onChanged: (data) {
            AppStrings.userPassword = data; // Store password in AppStrings
            setState(() {
              _errorMessage =
                  _validatePassword(data) ?? ''; // Update error message
            });
          },
          obscureText: !_isPasswordVisible, // Toggle password visibility
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock, color: AppColors.darkBlue),
            labelText: 'Password',
            labelStyle: const TextStyle(color: AppColors.darkBlue),
            filled: true,
            fillColor: Colors.grey[100],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: AppColors.darkBlue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(color: AppColors.darkBlue, width: 2.0),
            ),
            errorText: _errorMessage.isEmpty
                ? null
                : _errorMessage, // Show error message
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off, // Change icon based on visibility
                color: AppColors.darkBlue,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
