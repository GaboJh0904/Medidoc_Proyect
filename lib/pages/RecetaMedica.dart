import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RecetaMedica(),
    debugShowCheckedModeBanner: false,
  ));
}

class RecetaMedica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo general blanco
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título de la receta médica
              Text(
                'Receta médica',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6200EE),
                ),
              ),
              SizedBox(height: 20),
              // Contenedor principal morado
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF6200EE), // Color púrpura del contenedor
                  borderRadius:
                      BorderRadius.circular(8), // Bordes redondeados levemente
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Nacimiento:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Teléfono:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Dirección:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.white, thickness: 1),
                    Divider(color: Colors.white, thickness: 1),
                    SizedBox(height: 10),
                    Text(
                      'PRESCRIPCION:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Detalle aquí la prescripción médica',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.white, thickness: 1),
                    Divider(color: Colors.white, thickness: 1),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Colors.white,
                              height: 2,
                              width: 100,
                            ),
                            Text(
                              'Fecha',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              color: Colors.white,
                              height: 2,
                              width: 100,
                            ),
                            Text(
                              'Firma',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Estos medicamentos los puedes encontrar en las siguientes farmacéuticas:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Farmacia1, Farmacia2, etc.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
