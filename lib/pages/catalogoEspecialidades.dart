import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/listaPersonal.dart';
import 'navBar.dart';
import 'agendarCitaFechaHora.dart';

class CatalogoEspecialidades extends StatefulWidget {
  final String titulo;
  final int numFuncion;

  CatalogoEspecialidades({required this.titulo, required this.numFuncion});

  @override
  _CatalogoEspecialidadesState createState() => _CatalogoEspecialidadesState();
}

class _CatalogoEspecialidadesState extends State<CatalogoEspecialidades> {
  final List<String> especialidades = [
    'Alergología',
    'Cardiología',
    'Cirugía plástica',
    'Dermatología',
    'Endocrinología',
    'Fisioterapia',
    'Gastroenterología',
    'Ginecología - Obstetricia',
    'Medicina familiar y comunitaria',
    'Medicina interna',
    'Nefrología',
    'Nutrición',
    'Neurología',
    'Odontología',
    'Otorrinolaringología',
    'Ortopedia',
    'Oftalmología',
    'Oncología',
    'Pediatría',
    'Psiquiatría',
    'Psicología',
    'Traumatología',
    'Urología'
  ];

  String? selectedEspecialidad;
  List<String> medicos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titulo,
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
                return CustomButton(
                  text: especialidades[index],
                  onPressed: () => _handleButtonPress(especialidades[index]),
                );
              },
            ),
          ),
          if (selectedEspecialidad != null) ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Selecciona un médico de $selectedEspecialidad:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedEspecialidad = null;
                        medicos = [];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Color del botón
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Borde redondeado
                      ),
                    ),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: medicos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        child: Icon(Icons.person, color: Colors.blue[900]),
                      ),
                      title: Text(
                        medicos[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Colors.blue[900]),
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
                    ),
                  );
                },
              ),
            ),
          ]
        ],
      ),
    );
  }

  void _handleButtonPress(String especialidad) {
    switch (widget.numFuncion) {
      case 1:
        setState(() {
          selectedEspecialidad = especialidad;
        });
        _showMedicos(especialidad);
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListaPersonal(numLista: 1)),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListaPersonal(numLista: 2)),
        );
        break;
      case 4:
        // Aquí se puede agregar la función para el caso 4 en el futuro
        break;
      default:
        // Acción por defecto o manejo de errores
        break;
    }
  }

  void _showMedicos(String especialidad) {
    setState(() {
      selectedEspecialidad = especialidad;
      // Aquí deberías tener una lógica para obtener los médicos basados en la especialidad
      medicos = [
        'Médico 1',
        'Médico 2',
        'Médico 3'
      ]; // Ejemplo de lista de médicos
    });
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5dc1b9), Color(0xFF005954)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
