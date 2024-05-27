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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
