import 'package:flutter/material.dart';
import 'dart:async';
import 'package:medidoc_proyect/pages/menu_principal.dart';

class AsistentePage extends StatefulWidget {
  const AsistentePage({super.key});

  @override
  _AsistentePageState createState() => _AsistentePageState();
}

class _AsistentePageState extends State<AsistentePage> {
  final String nombre = 'Luan';

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 10),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MenuPrincipal()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
            child: Text(
              'Le damos la bienvenida Sr/a $nombre, me llamo Lia, soy su asistente personal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/images/asistente1.png'),
            ),
          ),
        ],
      ),
    );
  }
}