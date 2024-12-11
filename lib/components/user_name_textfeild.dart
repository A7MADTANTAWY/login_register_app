import 'package:flutter/material.dart';
import 'package:login_register_page/consts/app_colors.dart';
import 'package:login_register_page/consts/app_strings.dart';

class UserNameTextfeild extends StatefulWidget {
  UserNameTextfeild({super.key});

  @override
  _UserNameTextfeildState createState() => _UserNameTextfeildState();
}

class _UserNameTextfeildState extends State<UserNameTextfeild> {
  final TextEditingController _userNameController = TextEditingController();
  String _errorMessage = ''; // To hold error message for validation

  // Function to validate username (email in this case)
  String? _validateUserName(String value) {
    if (value.isEmpty) {
      return 'Username cannot be empty';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+\.[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // No error
  }

  // Function to clear the text field
  void clearUserNameField() {
    _userNameController.clear();
    setState(() {
      _errorMessage = ''; // Clear error message
    });
  }

  // Example function for login or registration logic
  void _handleLoginOrRegister() {
    // Perform your login or registration logic here
    // If successful, clear the username field
    clearUserNameField();
  }

  @override
  Widget build(BuildContext context) {
    bool hasError = _errorMessage.isNotEmpty;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TextField(
          controller: _userNameController, // Set the controller for the field
          onChanged: (data) {
            AppStrings.userName = data; // Store username in AppStrings
            setState(() {
              _errorMessage =
                  _validateUserName(data) ?? ''; // Update error message
            });
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person, color: AppColors.darkBlue),
            labelText: 'Username',
            labelStyle: const TextStyle(color: AppColors.darkBlue),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color:
                    hasError ? Colors.red : AppColors.darkBlue, // Red if error
                width: 2.0, // Adjust border width
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color:
                    hasError ? Colors.red : AppColors.darkBlue, // Red if error
                width: 2.0, // Adjust border width
              ),
            ),
            errorText: _errorMessage.isEmpty
                ? null
                : _errorMessage, // Show error message
          ),
        ),
      ),
    );
  }
}
