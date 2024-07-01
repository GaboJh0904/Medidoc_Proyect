import 'package:flutter/material.dart';

import 'package:medidoc_proyect/pages/asistente_page.dart';
import 'package:medidoc_proyect/pages/Inicio.dart';
import 'package:medidoc_proyect/pages/biometrico.dart';
import 'package:medidoc_proyect/pages/menu_principal.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/': (context) => Inicio(),
        '/asistente': (context) => AsistentePage(),
        '/registro': (context) => BioPag(),
      },
    );
  }
}
