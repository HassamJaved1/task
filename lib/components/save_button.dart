import 'package:flutter/material.dart';
import 'package:task/constants/values.dart';

class SaveButton extends StatelessWidget {
  final String text;

  final VoidCallback onTap;

  const SaveButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 250,
            height: 50,
            decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(roundedBorders)),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontSize: 20, color: white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
