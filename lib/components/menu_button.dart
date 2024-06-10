import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  MenuButton({
    required this.text,
    required this.onPressed,
    this.icon,
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
                  Color(0xFF4B3D82),  // Dark Blueberry
                  Color(0xFF6C62B6),  // Light Cornflower Blue
                  Color(0xFF5788A8),  // Medium Wedgwood
                  Color(0xFF204C67),  // Very Dark Peacock Blue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: icon != null
                  ? Icon(
                      icon,
                      color: Colors.white,
                      size: 30,  // Reduce the icon size
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(height: 8),  // Space between the button and the text
        Text(
          text,
          style: TextStyle(
            color: Color.fromARGB(255, 87, 137, 170),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
