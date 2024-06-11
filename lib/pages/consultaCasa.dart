import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:medidoc_proyect/pages/chat.dart';
import 'package:medidoc_proyect/pages/navBar.dart';

class ConsultaCasa extends StatefulWidget {
  @override
  _ConsultaCasaState createState() => _ConsultaCasaState();
}

class _ConsultaCasaState extends State<ConsultaCasa> {
  GoogleMapController? _mapController;
  DateTime? selectedDateTime;
  bool isMapExpanded = false;

  // Lista de doctores para diferentes horarios
  final List<String> doctorsMorning = [
    'Dr. John Doe',
    'Dr. Jane Smith',
    'Dr. Emily Johnson',
    'Dr. Michael Brown',
    'Dr. Jessica Williams',
    'Dr. David Jones',
    'Dr. Sarah Miller',
    'Dr. Daniel Garcia',
  ]; // Nombres de ejemplo variados

  final List<String> doctorsAfternoon = [
    'Dr. Laura Martinez',
    'Dr. James Rodriguez',
    'Dr. Linda Lee',
    'Dr. Robert Perez',
    'Dr. Barbara Thompson',
    'Dr. Charles Hernandez',
    'Dr. Elizabeth Robinson',
    'Dr. George Walker',
  ]; // Nombres de ejemplo variados

  List<String> doctors = [];

  void _updateLocationAndDoctors() {
    // Actualiza la ubicación y la lista de doctores basada en la hora y fecha seleccionada
    if (selectedDateTime != null) {
      // Aquí puedes agregar la lógica para actualizar la ubicación en el mapa y la lista de doctores según la hora y fecha seleccionada
      // Por ahora, solo actualizará la ubicación en el mapa
      _mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(-16.5037, -68.1342), // Actualiza con nuevas coordenadas según la lógica
          zoom: 14,
        ),
      ));

      // Actualiza la lista de doctores según la hora seleccionada
      if (selectedDateTime!.hour < 12) {
        doctors = doctorsMorning;
      } else {
        doctors = doctorsAfternoon;
      }
      setState(() {}); // Para actualizar la interfaz de usuario con la nueva lista de doctores
    }
  }

  void _selectDateTime() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime ?? DateTime.now()),
      );
      if (time != null) {
        setState(() {
          selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  void _toggleMapExpansion() {
    setState(() {
      isMapExpanded = !isMapExpanded;
    });
  }

  void _showDoctorDetails(String doctor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(doctor),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Información del doctor:'),
                SizedBox(height: 10),
                Text('Especialidad: Cardiología'),
                Text('Años de experiencia: 10'),
                Text('Hospital: Hospital General'),
                Text('Contacto: +123456789'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatBot(
                          nombreDoctor: doctor,
                          estado: 2,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 123, 97, 167),
                  ),
                  child: Text('Chatear', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Consulta en Casa",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
        elevation: 0,
      ),
      drawer: NavbarOptions(),
      body: Column(
        children: [
          // Primera división: Google Maps
          GestureDetector(
            onTap: _toggleMapExpansion,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: isMapExpanded ? 300.0 : 150.0,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(-16.5037, -68.1342),
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('destination'),
                    position: LatLng(-16.5037, -68.1342),
                  ),
                },
                onMapCreated: (controller) {
                  _mapController = controller;
                },
              ),
            ),
          ),
          // Segunda división: Fecha y hora con botón de búsqueda
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Fecha y Hora',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: _selectDateTime,
                    ),
                  ),
                  readOnly: true,
                  controller: TextEditingController(
                    text: selectedDateTime != null
                        ? DateFormat('yyyy-MM-dd – kk:mm').format(selectedDateTime!)
                        : '',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _updateLocationAndDoctors,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 123, 97, 167), // Purple shade from the color panel
                  ),
                  child: Text(
                    'Buscar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Tercera división: Lista de personal disponible
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 97, 110, 167), // Adaptado al panel de colores utilizado
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.white), // Ícono del personaje
                    title: Text(doctors[index], style: TextStyle(color: Colors.white)),
                    onTap: () => _showDoctorDetails(doctors[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
