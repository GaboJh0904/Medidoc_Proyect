import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'menu_principal.dart'; // Importa el menú principal

class FichaClinica extends StatelessWidget {
  final int idPaciente;

  FichaClinica({required this.idPaciente});

  Future<Map<String, dynamic>?> _fetchPatientData(int idPaciente) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Paciente')
        .where('id_paciente', isEqualTo: idPaciente)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ficha Clínica',
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
      backgroundColor: Color.fromARGB(255, 233, 236, 240),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _fetchPatientData(idPaciente),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los datos del paciente.'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No se encontró el paciente.'));
          } else {
            final patientData = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Datos del Paciente',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text('Nombres: ${patientData['nombres']}'),
                    Text(
                        'Apellidos: ${patientData['apellidoPaterno']} ${patientData['apellidoMaterno']}'),
                    Text('Correo: ${patientData['correo']}'),
                    Text('Dirección: ${patientData['direccion']}'),
                    Text('Género: ${patientData['genero']}'),
                    Text('Fecha de nacimiento: ${patientData['nacimiento']}'),
                    Text('Teléfono: ${patientData['telefono']}'),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    FichaClinicaForm(patientData: patientData),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class FichaClinicaForm extends StatefulWidget {
  final Map<String, dynamic> patientData;

  FichaClinicaForm({required this.patientData});

  @override
  _FichaClinicaFormState createState() => _FichaClinicaFormState();
}

class _FichaClinicaFormState extends State<FichaClinicaForm> {
  int _currentStep = 0;

  final TextEditingController medicamentosController = TextEditingController();
  final TextEditingController alergiasController = TextEditingController();
  final TextEditingController enfermedadesCronicasController = TextEditingController();
  final TextEditingController cirugiasController = TextEditingController();
  final TextEditingController hospitalizacionesController = TextEditingController();
  final TextEditingController frecuenciaEjercicioController = TextEditingController();
  final TextEditingController horasSuenoController = TextEditingController();
  final TextEditingController otrosHabitosController = TextEditingController();

  final ValueNotifier<bool> embarazadaNotifier = ValueNotifier(false);
  final ValueNotifier<bool> amamantandoNotifier = ValueNotifier(false);
  final ValueNotifier<List<String>> sintomasNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> habitosNotifier = ValueNotifier([]);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _saveToFirestore() async {
    try {
      await firestore.collection('FichaClinica').add({
        'historialClinico': {
          'medicamentos': medicamentosController.text,
          'alergias': alergiasController.text,
          'enfermedadesCronicas': enfermedadesCronicasController.text,
          'cirugias': cirugiasController.text,
          'hospitalizaciones': hospitalizacionesController.text,
          'embarazada': embarazadaNotifier.value,
          'amamantando': amamantandoNotifier.value,
          'sintomas': sintomasNotifier.value,
        },
        'habitosEstiloVida': {
          'habitos': habitosNotifier.value,
          'frecuenciaEjercicio': frecuenciaEjercicioController.text,
          'horasSueno': horasSuenoController.text,
          'otrosHabitos': otrosHabitosController.text,
        },
        'id_paciente': widget.patientData['id_paciente'],
      });
      _showConfirmationDialog();
    } catch (e) {
      print("Error al guardar en Firestore: $e");
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmación'),
          content: Text('La ficha clínica ha sido guardada exitosamente.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MenuPrincipal()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: Text('Historial Clínico'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: medicamentosController,
              decoration: InputDecoration(
                labelText: 'Medicamentos actuales',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextField(
              controller: alergiasController,
              decoration: InputDecoration(
                labelText: 'Alergias',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextField(
              controller: enfermedadesCronicasController,
              decoration: InputDecoration(
                labelText: 'Enfermedades crónicas',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextField(
              controller: cirugiasController,
              decoration: InputDecoration(
                labelText: 'Cirugías previas',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextField(
              controller: hospitalizacionesController,
              decoration: InputDecoration(
                labelText: 'Hospitalizaciones previas',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            ValueListenableBuilder<bool>(
              valueListenable: embarazadaNotifier,
              builder: (context, value, child) {
                return CheckboxListTile(
                  title: Text('¿Está embarazada?', style: TextStyle(fontWeight: FontWeight.bold)),
                  value: value,
                  onChanged: (newValue) {
                    embarazadaNotifier.value = newValue!;
                  },
                );
              },
            ),
            SizedBox(height: 10),
            ValueListenableBuilder<bool>(
              valueListenable: amamantandoNotifier,
              builder: (context, value, child) {
                return CheckboxListTile(
                  title: Text('¿Está amamantando?', style: TextStyle(fontWeight: FontWeight.bold)),
                  value: value,
                  onChanged: (newValue) {
                    amamantandoNotifier.value = newValue!;
                  },
                );
              },
            ),
            SizedBox(height: 10),
            ValueListenableBuilder<List<String>>(
              valueListenable: sintomasNotifier,
              builder: (context, selectedSintomas, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Síntomas actuales', style: TextStyle(fontWeight: FontWeight.bold)),
                    CheckboxListTile(
                      title: Text('Fiebre'),
                      value: selectedSintomas.contains('Fiebre'),
                      onChanged: (value) {
                        if (value == true) {
                          sintomasNotifier.value = List.from(selectedSintomas)..add('Fiebre');
                        } else {
                          sintomasNotifier.value = List.from(selectedSintomas)..remove('Fiebre');
                        }
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Dolor de cabeza'),
                      value: selectedSintomas.contains('Dolor de cabeza'),
                      onChanged: (value) {
                        if (value == true) {
                          sintomasNotifier.value = List.from(selectedSintomas)..add('Dolor de cabeza');
                        } else {
                          sintomasNotifier.value = List.from(selectedSintomas)..remove('Dolor de cabeza');
                        }
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Mareos'),
                      value: selectedSintomas.contains('Mareos'),
                      onChanged: (value) {
                        if (value == true) {
                          sintomasNotifier.value = List.from(selectedSintomas)..add('Mareos');
                        } else {
                          sintomasNotifier.value = List.from(selectedSintomas)..remove('Mareos');
                        }
                      },
                    ),
                    // Add more CheckboxListTile for other symptoms as needed
                  ],
                );
              },
            ),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Hábitos y Estilo de Vida'),
        content: Column(
          children: [
            ValueListenableBuilder<List<String>>(
              valueListenable: habitosNotifier,
              builder: (context, selectedHabitos, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hábitos', style: TextStyle(fontWeight: FontWeight.bold)),
                    CheckboxListTile(
                      title: Text('Fumar'),
                      value: selectedHabitos.contains('Fumar'),
                      onChanged: (value) {
                        if (value == true) {
                          habitosNotifier.value = List.from(selectedHabitos)..add('Fumar');
                        } else {
                          habitosNotifier.value = List.from(selectedHabitos)..remove('Fumar');
                        }
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Beber alcohol'),
                      value: selectedHabitos.contains('Beber alcohol'),
                      onChanged: (value) {
                        if (value == true) {
                          habitosNotifier.value = List.from(selectedHabitos)..add('Beber alcohol');
                        } else {
                          habitosNotifier.value = List.from(selectedHabitos)..remove('Beber alcohol');
                        }
                      },
                    ),
                    // Add more CheckboxListTile for other habits as needed
                  ],
                );
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: frecuenciaEjercicioController,
              decoration: InputDecoration(
                labelText: 'Frecuencia de ejercicio',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextField(
              controller: horasSuenoController,
              decoration: InputDecoration(
                labelText: 'Horas de sueño',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextField(
              controller: otrosHabitosController,
              decoration: InputDecoration(
                labelText: 'Otros hábitos',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 3,
            ),
          ],
        ),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Color(0xFF338b85), // Color turquesa
          hintColor: Color(0xFF338b85), // Color turquesa
          colorScheme: ColorScheme.light(primary: Color(0xFF338b85)), // Color turquesa
          ),
      child:Stepper(
        physics: ClampingScrollPhysics(), // Evita el desplazamiento excesivo
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < _buildSteps().length - 1) {
            setState(() {
              _currentStep += 1;
            });
          } else {
            _saveToFirestore();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: _buildSteps(),
      ),
    );
  }
}
