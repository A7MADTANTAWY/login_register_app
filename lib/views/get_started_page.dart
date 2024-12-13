import 'package:flutter/material.dart';
import 'package:login_register_page/consts/app_colors.dart';
import 'package:login_register_page/consts/routes.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground, // Added background color
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Header Section
            Column(
              children: [
                Text(
                  "Welcome to Healthify",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.darkBlue, // Adjusting title color
                        fontSize: 28,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your health, our priority.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ],
            ),
            // Illustration
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/doctor.png',
                fit: BoxFit.contain,
              ),
            ),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Track your health, connect with professionals, and access your medical records anytime, anywhere.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
              ),
            ),
            // Buttons
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to login page
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBlue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "By continuing, you agree to our Terms and Privacy Policy.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
