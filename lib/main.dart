import 'package:flutter/material.dart';
import 'navBar.dart';
import 'package:medidoc_proyect/pages/menu_principal.dart';

void main() {
  //runApp(const MyApp());
  runApp(NavbarOptions());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuPrincipal(),
    );
  }
}