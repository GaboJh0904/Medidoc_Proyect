import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/navBar.dart';
import 'package:medidoc_proyect/pages/filesHM.dart';

class HistorialMedicoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidoc'),
      ),
      drawer: NavbarOptions(),
      backgroundColor: Colors.white,

      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          for (int year = 2024; year >= 1992; year--)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navegar a la página de destino al presionar el botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArchivosPage()), // Reemplaza 'NombreDeLaPaginaDestino' con el nombre real de tu página de destino
                  );
                },
                child: Text('$year'),
              ),
            ),
        ],
      ),
    );
  }
}
