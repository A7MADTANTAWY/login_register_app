import 'package:flutter/material.dart';
import 'package:login_register_page/consts/app_colors.dart';
import 'package:login_register_page/consts/app_strings.dart';

class DisplayNameTextfeild extends StatefulWidget {
  const DisplayNameTextfeild({super.key});

  @override
  _DisplayNameTextfeildState createState() => _DisplayNameTextfeildState();
}

class _DisplayNameTextfeildState extends State<DisplayNameTextfeild> {
  final TextEditingController _displayNameController = TextEditingController();
  String _helperMessage = ''; // To hold helper message for validation

  // Function to validate display name (non-empty and alphanumeric) and update helper message
  void _validateDisplayName(String value) {
    if (value.isEmpty) {
      _helperMessage = 'Display name cannot be empty';
    } else if (value.length < 3) {
      _helperMessage = 'Display name must be at least 3 characters';
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
              controller: _displayNameController, // Set the controller for the field
              onChanged: (data) {
                AppStrings.displayName = data; // Store display name in AppStrings
                setState(() {
                  _validateDisplayName(data); // Update helper message
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person, color: AppColors.darkBlue),
                labelText: 'Display Name',
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
            if (_helperMessage.isNotEmpty) // Display helper message if not empty
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
