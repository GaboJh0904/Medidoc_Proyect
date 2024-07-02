import 'package:flutter/material.dart';

class SubArchivosPage extends StatelessWidget {
  final String nombre;

  SubArchivosPage({required this.nombre});

  @override
  Widget build(BuildContext context) {
    // Lista de archivos (para ejemplo)
    List<Map<String, dynamic>> archivos = [
      {"nombre": "Radiografias", "icono": Icons.folder_open},
      {"nombre": "Alergias", "icono": Icons.folder_open},
      {"nombre": "Operaciones", "icono": Icons.folder_open},
      {"nombre": "Biografia", "icono": Icons.folder_open},
      {"nombre": "Resultados de pruebas", "icono": Icons.folder_open},
      {"nombre": "Ultimos examenes fisicos", "icono": Icons.folder_open},
      {"nombre": "Informacion de urgencia", "icono": Icons.folder_open},
      {"nombre": "Ordenes medicas", "icono": Icons.folder_open},
      {"nombre": "Historial", "icono": Icons.folder_open},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Archivos de $nombre',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF005954), // Color 1
        elevation: 0,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 24.0, // Espacio horizontal
          mainAxisSpacing: 30.0, // Espacio vertical
        ),
        itemCount: archivos.length,
        itemBuilder: (BuildContext context, int index) {
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                archivos[index]["icono"],
                size: 64.0, // Tamaño del icono
                color: Color(0xFF338b85),
              ),
              SizedBox(height: 8.0), // Espacio entre el icono y el texto
              Text(
                archivos[index]["nombre"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0, // Tamaño del texto
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
