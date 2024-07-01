import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? imagePath;

  MenuButton({
    required this.text,
    required this.onPressed,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 60,  // Reduce the width
            height: 60,  // Reduce the height
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF005954), // Color 1
                  Color(0xFF005954), // Color 1
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: imagePath != null
                  ? Image.asset(
                      imagePath!,
                      width: 40,  // Reduce the image width
                      height: 40,  // Reduce the image height
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(height: 8),  // Space between the button and the text
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF338b85), // Color 2
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
