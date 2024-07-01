import 'package:flutter/material.dart';
import 'navBar.dart';
import 'agendarCitaFechaHora.dart';
import 'modeloCita.dart';

class AgendarCita extends StatefulWidget {
  @override
  _AgendarCitaState createState() => _AgendarCitaState();
}

class _AgendarCitaState extends State<AgendarCita> {
  final List<String> especialidades = [
    'Alergología',
    'Cardiología',
    'Cirugía plástica',
    'Dermatología',
    'Endocrinología',
    'Fisioterapia',
  ];

  String? selectedEspecialidad;
  List<String> medicos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitud de cita'),
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
                  onPressed: () => _showMedicos(especialidades[index]),
                  child: Text(especialidades[index]),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                );
              },
            ),
          ),
          if (selectedEspecialidad != null) ...[
            Text('Selecciona un médico de $selectedEspecialidad:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: medicos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(medicos[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgendarCitaFechaHora(
                              especialidad: selectedEspecialidad!,
                              medico: medicos[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ]
        ],
      ),
    );
  }

  void _showMedicos(String especialidad) {
    setState(() {
      selectedEspecialidad = especialidad;
      medicos = ['Medico 1', 'Medico 2', 'Meedico 3'];
    });
  }
}
