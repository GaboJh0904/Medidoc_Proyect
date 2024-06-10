import 'package:flutter/material.dart';

class RecetaMedica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 83, 153),  // Dark Blueberry
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);  // Esto llevará al usuario de vuelta a la página anterior
          },
        ),
        title: Text(
          'Receta médica',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white, // Fondo general blanco
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              // Contenedor principal
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 123, 97, 167), // Purple shade from the color panel
                  borderRadius: BorderRadius.circular(8), // Bordes redondeados levemente
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
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
                      'PRESCRIPCIÓN:',
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
                              style: TextStyle(color: Colors.white, fontSize: 16),
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
                              style: TextStyle(color: Colors.white, fontSize: 16),
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
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Farmacia1, Farmacia2, etc.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
