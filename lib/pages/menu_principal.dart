import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/navBar.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavbarOptions()),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Encabezado del Menú', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                color: Color(0xFF6F35A5),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
