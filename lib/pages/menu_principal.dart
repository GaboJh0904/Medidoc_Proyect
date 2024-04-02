import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/navBar.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidoc'),
      ),
      drawer: NavbarOptions(),
      backgroundColor: Colors.white,
      body: Center(
        child: MyCustomButtonColumn(),
      ),
    );
  }
}


class MyCustomButtonColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyCustomButton(text: "Opcion Uno"),
        SizedBox(height: 8),
        MyCustomButton(text: "Opcion Dos"),
        SizedBox(height: 8),
        MyCustomButton(text: "Opcion Tres"),
        SizedBox(height: 8),
        MyCustomButton(text: "Opcion Cuatro"),
      ],
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final String text;

  MyCustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Color(0xFF6F35A5), Color(0xFFB388FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
