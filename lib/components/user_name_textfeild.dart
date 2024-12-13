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
  String _helperMessage = ''; // To hold helper message for validation

  // Function to validate username (email in this case) and update helper message
  void _validateUserName(String value) {
    if (value.isEmpty) {
      _helperMessage = 'Username cannot be empty';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+\.[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      _helperMessage = 'Please enter a valid email address';
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
                  _userNameController, // Set the controller for the field
              onChanged: (data) {
                AppStrings.userName = data; // Store username in AppStrings
                setState(() {
                  _validateUserName(data); // Update helper message
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
