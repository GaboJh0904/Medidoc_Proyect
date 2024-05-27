import 'package:flutter/material.dart';

import 'package:medidoc_proyect/pages/asistente_page.dart';
import 'package:medidoc_proyect/pages/Inicio.dart';
import 'package:medidoc_proyect/pages/biometrico.dart';
import 'package:medidoc_proyect/pages/menu_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medidoc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MenuPrincipal(),
        '/asistente': (context) => AsistentePage(),
        '/registro': (context) => BioPag(),
      },
    );
  }
}
