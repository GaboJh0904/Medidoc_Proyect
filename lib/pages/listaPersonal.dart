import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/chat.dart';
import 'package:medidoc_proyect/pages/navBar.dart';


class ListaPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorListScreen(),
      debugShowCheckedModeBanner: false, 
    );
  }
}

class DoctorListScreen extends StatelessWidget {
  final List<String> doctors = [
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
    'Dr. Lopez',
  ]; // Duplicar nombres para ilustración. Ajusta según tus datos.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Personal', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 82, 20, 122),
      ),
      drawer: NavbarOptions(),
      backgroundColor: Color.fromARGB(255, 96, 65, 117),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.deepPurple[300], // Color de fondo para cada tarjeta
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.white), // Ícono del personaje
              title: Text(doctors[index], style: TextStyle(color: Colors.white)),
              onTap: () {
                // Acción al hacer tap en un ítem, navegar a una nueva página
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatBot())
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String doctorName;

  DetailScreen({required this.doctorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
      ),
      body: Center(
        child: Text('Detalles del $doctorName', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
