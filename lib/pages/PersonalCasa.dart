import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/consultaCasa.dart';
import 'package:medidoc_proyect/pages/navBar.dart';

class PersonalCasa extends StatelessWidget {
  final int numLista;

  PersonalCasa({required this.numLista});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorListScreen(numLista: numLista),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DoctorListScreen extends StatelessWidget {
  final int numLista;
  final List<String> doctors = [
    'Dr. John Doe',
    'Dr. Jane Smith',
    'Dr. Emily Johnson',
    'Dr. Michael Brown',
    'Dr. Jessica Williams',
    'Dr. David Jones',
    'Dr. Sarah Miller',
    'Dr. Daniel Garcia',
    'Dr. Laura Martinez',
    'Dr. James Rodriguez',
    'Dr. Linda Lee',
    'Dr. Robert Perez',
    'Dr. Barbara Thompson',
    'Dr. Charles Hernandez',
    'Dr. Elizabeth Robinson',
    'Dr. George Walker',
  ]; // Nombres de ejemplo variados

  DoctorListScreen({required this.numLista});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Disponible",
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
      drawer: NavbarOptions(),
      backgroundColor: Color.fromARGB(255, 65, 70, 117),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(255, 97, 110, 167), // Adaptado al panel de colores utilizado
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.white), // Ícono del personaje
              title: Text(doctors[index], style: TextStyle(color: Colors.white)),
              onTap: () {
                // Acción al hacer tap en un ítem, navegar a una nueva página
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConsultaCasa(
                      nombreDoctor: doctors[index],
                      tiempo: 15,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
