import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/subFilesHM.dart';

class ArchivosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista de archivos (para ejemplo)
    List<Map<String, dynamic>> archivos = [
      {"nombre": "Alergología", "icono": Icons.folder_open},
      {"nombre": "Cardiología", "icono": Icons.folder_open},
      {"nombre": "Cirugía Plástica", "icono": Icons.folder_open},
      {"nombre": "Dermatología", "icono": Icons.folder_open},
      {"nombre": "Endocrinología", "icono": Icons.folder_open},
      {"nombre": "Fisioterapia", "icono": Icons.folder_open},
      {"nombre": "Gastroenterología", "icono": Icons.folder_open},
      {"nombre": "Ginecología - Obstétrica", "icono": Icons.folder_open},
      {"nombre": "Medicina Familiar y comunitaria", "icono": Icons.folder_open},
      {"nombre": "Medicina Interna", "icono": Icons.folder_open},
      {"nombre": "Nefrología", "icono": Icons.folder_open},
      {"nombre": "Nutrición", "icono": Icons.folder_open},
      {"nombre": "Neurología", "icono": Icons.folder_open},
      {"nombre": "Odontología", "icono": Icons.folder_open},
      {"nombre": "Otorrinolaringología", "icono": Icons.folder_open},
      {"nombre": "Ortopedia", "icono": Icons.folder_open},
      {"nombre": "Oftalmología", "icono": Icons.folder_open},
      {"nombre": "Oncología", "icono": Icons.folder_open},
      {"nombre": "Pediatría", "icono": Icons.folder_open},
      {"nombre": "Psiquiatría", "icono": Icons.folder_open},
      {"nombre": "Psicología", "icono": Icons.folder_open},
      {"nombre": "Traumatología", "icono": Icons.folder_open},
      {"nombre": "Urología", "icono": Icons.folder_open},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Archivos',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 36, 83, 153),  // Dark Blueberry
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
          return GestureDetector(
            onTap: () {
              // Navegar a la otra pantalla aquí, pasando el nombre del archivo
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubArchivosPage(nombre: archivos[index]["nombre"]),
                ),
              );
            },
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  archivos[index]["icono"],
                  size: 64.0, // Tamaño del icono
                  color: Colors.blue,
                ),
                SizedBox(height: 8.0), // Espacio entre el icono y el texto
                Text(
                  archivos[index]["nombre"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0, // Tamaño del texto
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
