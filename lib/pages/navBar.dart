import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/ajustes.dart';
import 'package:medidoc_proyect/pages/menu_principal.dart';

class NavbarOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF005954), // Color 1
        child: Center( // Centra el contenido
          child: Column(
            mainAxisSize: MainAxisSize.min, // Centra los elementos verticalmente
            children: <Widget>[
              SizedBox(height: 8), // Espacio antes del primer elemento
              _buildDrawerOption(
                title: 'Inicio',
                onTap: () {
                  // Actualiza la navegación aquí
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPrincipal()));
                },
              ),

              _buildDrawerOption(
                title: 'Ajustes',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ajustes()));
                },
              ),
              _buildDrawerOption(
                title: 'Ayudante',
                onTap: () {
                  // Actualiza la navegación aquí
                },
              ),
              _buildDrawerOption(
                title: 'Salir',
                onTap: () {
                  // Actualiza la navegación aquí
                },
              ),
              SizedBox(height: 8), // Espacio después del último elemento
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerOption({required String title, required VoidCallback onTap}) {
    return Container(
      margin: EdgeInsets.all(4.0), // Margen alrededor de cada botón
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white), // Borde del botón color blanco
        borderRadius: BorderRadius.circular(20.0), // Bordes redondos con radio de 10
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white), // Texto de color blanco
          textAlign: TextAlign.center, // Alineación del texto al centro
        ),
        onTap: onTap,
      ),
    );
  }
}
