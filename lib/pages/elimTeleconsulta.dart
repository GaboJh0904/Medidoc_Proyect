import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/listaPersonal.dart';
import 'navBar.dart';
import 'agendarCitaFechaHora.dart';
import 'modeloCita.dart';

class Teleconsulta extends StatefulWidget {
  @override
  _TeleconsultaState createState() => _TeleconsultaState();
}

class _TeleconsultaState extends State<Teleconsulta> {
  final List<String> especialidades = [
    'Alergología', 'Cardiología', 'Cirugía plástica', 'Dermatología', 
    'Endocrinología', 'Fisioterapia', 'Gastroenterología', 'Ginecología - Obstetricia', 
    'Medicina familiar y comunitaria', 'Medicina interna', 'Nefrología', 'Nutrición', 
    'Neurología', 'Odontología', 'Otorrinolaringología', 'Ortopedia', 
    'Oftalmología', 'Oncología', 'Pediatría', 'Psiquiatría', 
    'Psicología', 'Traumatología', 'Urología'
  ];


  String? selectedEspecialidad;
  List<String> medicos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teleconsulta'),
      ),
      drawer: NavbarOptions(),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: especialidades.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListaPersonal())
                    );
                  } ,
                  child: Text(especialidades[index], style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
