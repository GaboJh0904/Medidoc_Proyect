import 'package:flutter/material.dart';
import 'package:medidoc_proyect/components/guia_disenio.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? title;
  final List<Map<String, String>>? sections;
  final Color color;
  final VoidCallback? onTap;

  CustomButton({
    required this.text,
    this.title,
    this.sections,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: onTap ??
            () {
              if (title != null && sections != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuiaDisenio(
                      title: title!,
                      sections: sections!,
                    ),
                  ),
                );
              }
            },
      ),
    );
  }
}
