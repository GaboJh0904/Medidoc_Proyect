import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ConsultaCasa extends StatelessWidget {
  final String nombreDoctor;
  final int tiempo;

  ConsultaCasa({required this.nombreDoctor, required this.tiempo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruta del Doctor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(
          nombreDoctor: nombreDoctor,
          tiempo: tiempo), // Pasamos las variables al ChatScreen
    );
  }
}

class MapScreen extends StatefulWidget {
  final String nombreDoctor;
  final int tiempo;

  MapScreen({required this.nombreDoctor, required this.tiempo});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  // Coordenadas de ejemplo: ubicación del doctor y del paciente
  final LatLng _doctorLocation =
      LatLng(-16.523100, -68.112332); // Ejemplo: ubicación del doctor
  final LatLng _patientLocation = LatLng(-16.541149,
      -68.077625); // Ejemplo: ubicación del paciente (Ciudad de México)

  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _getDirections();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _setMapBounds();
  }

  Future<void> _getDirections() async {
    final String apiKey =
        'TU_API_KEY_DE_GOOGLE_MAPS'; // Usa tu API Key de Google Maps
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${_doctorLocation.latitude},${_doctorLocation.longitude}&destination=${_patientLocation.latitude},${_patientLocation.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['routes'].isNotEmpty) {
        final route = data['routes'][0];
        final polylinePoints = route['overview_polyline']['points'];

        setState(() {
          _polylines.add(
            Polyline(
              polylineId: PolylineId('route'),
              visible: true,
              points: _convertToLatLng(_decodePolyline(polylinePoints)),
              color: Colors.blue,
              width: 5,
            ),
          );
          _setMapBounds();
        });
      }
    } else {
      throw Exception('Error al obtener las direcciones');
    }
  }

  void _setMapBounds() {
    if (mapController != null) {
      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          _patientLocation.latitude < _doctorLocation.latitude
              ? _patientLocation.latitude
              : _doctorLocation.latitude,
          _patientLocation.longitude < _doctorLocation.longitude
              ? _patientLocation.longitude
              : _doctorLocation.longitude,
        ),
        northeast: LatLng(
          _patientLocation.latitude > _doctorLocation.latitude
              ? _patientLocation.latitude
              : _doctorLocation.latitude,
          _patientLocation.longitude > _doctorLocation.longitude
              ? _patientLocation.longitude
              : _doctorLocation.longitude,
        ),
      );

      CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
      mapController.animateCamera(cameraUpdate);
    }
  }

  List<LatLng> _convertToLatLng(List<dynamic> points) {
    final List<LatLng> result = [];
    for (final point in points) {
      result.add(LatLng(point[0], point[1]));
    }
    return result;
  }

  List<dynamic> _decodePolyline(String encoded) {
    List<dynamic> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      poly.add([lat / 1E5, lng / 1E5]);
    }

    return poly;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tutoriales Primeros Auxilios',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _patientLocation,
                    zoom: 14.0, // Ajusta el zoom inicial aquí
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('patient_location'),
                      position: _patientLocation,
                      infoWindow: InfoWindow(
                        title: 'Ubicación del Paciente',
                      ),
                    ),
                    Marker(
                      markerId: MarkerId('doctor_location'),
                      position: _doctorLocation,
                      infoWindow: InfoWindow(
                        title: 'Ubicación del Doctor',
                      ),
                    ),
                  },
                  polylines: _polylines,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detalles del Doctor',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(widget.nombreDoctor),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today, color: Colors.blue),
                        title: Text('Fecha de la cita'),
                        subtitle: Text("formattedDate"),
                      ),
                      ListTile(
                        leading: Icon(Icons.access_time, color: Colors.blue),
                        title: Text('Tiempo estimado de llegada'),
                        subtitle: Text('15 minutos'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
