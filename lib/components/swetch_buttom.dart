import 'package:flutter/material.dart';

class SwetchButtom extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final String subTitle;

  const SwetchButtom(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subTitle,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.black), // Adjusted style for simplicity
        ),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () => onPressed(),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 14, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
