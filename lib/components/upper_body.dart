import 'package:flutter/material.dart';
import 'package:login_register_page/consts/app_colors.dart';
import 'package:login_register_page/consts/app_themes.dart';

// ignore: must_be_immutable
class UpperBody extends StatelessWidget {
  String title;
  String subtitle;
  UpperBody({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.defaultGradient,
        ),
      ),
      height: 250, // Specify a height to make the gradient visible
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              title,
              style: AppTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(subtitle, style: AppTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
