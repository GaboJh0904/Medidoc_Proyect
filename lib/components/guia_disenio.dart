import 'package:flutter/material.dart';

class GuiaDisenio extends StatelessWidget {
  final String title;
  final List<Map<String, String>> sections;

  GuiaDisenio({required this.title, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005954), // Color 1
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF005954), // Color 1
      ),
      body: ListView(
        children: sections.map((section) {
          return _buildTextImageSection(
            text: section['text']!,
            imageName: section['image']!,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextImageSection({required String text, required String imageName}) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          color: Color(0xFFDCD5DF),  // Medium Light Blueberry
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFF204C67),  // Very Dark Peacock Blue
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
        Container(
          height: 250,  // Increased height
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(imageName),
              fit: BoxFit.contain,  // Adjusted to fit the image inside the container
            ),
          ),
        ),
      ],
    );
  }
}
