import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'mapa_seleccion.dart';
import 'menu_principal.dart';

class RegistroPacientePage extends StatefulWidget {
  @override
  _RegistroPacientePageState createState() => _RegistroPacientePageState();
}

class _RegistroPacientePageState extends State<RegistroPacientePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController apellidoMaternoController = TextEditingController();
  final TextEditingController apellidoPaternoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController nacimientoController = TextEditingController();

  LatLng? _selectedLocation;
  String? _generoSeleccionado;
  int? _idPaciente;

  @override
  void initState() {
    super.initState();
    _obtenerMaxIdPaciente();
  }

  Future<void> _obtenerMaxIdPaciente() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('Paciente').orderBy('id_paciente', descending: true).limit(1).get();
      if (snapshot.docs.isNotEmpty) {
        final maxId = snapshot.docs.first.get('id_paciente');
        setState(() {
          _idPaciente = maxId + 1;
        });
      } else {
        setState(() {
          _idPaciente = 1;
        });
      }
    } catch (e) {
      print('Error al obtener el máximo ID de paciente: $e');
    }
  }

  void _registrarPaciente() async {
    if (_formKey.currentState!.validate() && _selectedLocation != null && _idPaciente != null) {
      try {
        await FirebaseFirestore.instance.collection('Paciente').add({
          'nombres': nombresController.text,
          'apellidoMaterno': apellidoMaternoController.text,
          'apellidoPaterno': apellidoPaternoController.text,
          'correo': correoController.text,
          'direccion': direccionController.text,
          'genero': _generoSeleccionado,
          'id_paciente': _idPaciente,
          'latitude': _selectedLocation!.latitude,
          'longitude': _selectedLocation!.longitude,
          'nacimiento': nacimientoController.text,

          'telefono': telefonoController.text,
        });
        _mostrarDialogo('Paciente registrado exitosamente', true);
      } catch (e) {
        _mostrarDialogo('Error al registrar paciente', false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor complete todos los campos y seleccione una ubicación'),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _mostrarDialogo(String mensaje, bool exito) {
    showDialog(
      context: context,
      barrierDismissible: false, // El usuario no puede cerrar el diálogo tocando fuera de él
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(exito ? 'Éxito' : 'Error'),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: Text('Ir al Inicio'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPrincipal()));

              },
            ),
          ],
        );
      },
    );
  }

  void _seleccionarUbicacion() async {
    final location = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapaSeleccionPage(onLocationSelected: (LatLng location) {
        setState(() {
          _selectedLocation = location;
        });
      })),
    );
  }

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        nacimientoController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro de Paciente',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextField(nombresController, 'Nombres'),
              _buildTextField(apellidoMaternoController, 'Apellido Materno'),
              _buildTextField(apellidoPaternoController, 'Apellido Paterno'),
              _buildTextField(telefonoController, 'Teléfono', keyboardType: TextInputType.phone),
              TextFormField(
                controller: nacimientoController,
                decoration: const InputDecoration(
                  labelText: "Fecha de Nacimiento",
                  labelStyle: TextStyle(color: Color(0xFF005954)), // Cambia el color de la etiqueta
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF005954)), // Cambia el color de la línea inferior cuando el campo no está enfocado
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF005954)), // Cambia el color de la línea inferior cuando el campo está enfocado
                  ),
                ),
                readOnly: true,
                onTap: () => _seleccionarFecha(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la fecha de nacimiento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Género',
                style: TextStyle(fontSize: 16, color: Color(0xFF005954)),
              ),
              ListTile(
                title: const Text('Femenino', style: TextStyle(color: Color(0xFF005954))),
                leading: Radio<String>(
                  value: 'Femenino',
                  groupValue: _generoSeleccionado,
                  onChanged: (String? value) {
                    setState(() {
                      _generoSeleccionado = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Masculino', style: TextStyle(color: Color(0xFF005954))),
                leading: Radio<String>(
                  value: 'Masculino',
                  groupValue: _generoSeleccionado,
                  onChanged: (String? value) {
                    setState(() {
                      _generoSeleccionado = value;
                    });
                  },
                ),
              ),
              _buildTextField(correoController, 'Correo', keyboardType: TextInputType.emailAddress),
              _buildTextField(direccionController, 'Dirección'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _seleccionarUbicacion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5dc1b9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                    _selectedLocation == null ? 'Seleccionar Ubicación' : 'Ubicación Seleccionada',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registrarPaciente,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF005954),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Registrar Paciente',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xFF005954)), // Cambia el color de la etiqueta
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF005954)), // Cambia el color de la línea inferior cuando el campo no está enfocado
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF005954)), // Cambia el color de la línea inferior cuando el campo está enfocado
          ),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese $labelText';
          }
          return null;
        },
      ),
    );
  }

}
