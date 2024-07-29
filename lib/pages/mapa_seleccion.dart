import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapaSeleccionPage extends StatefulWidget {
  final Function(LatLng) onLocationSelected;

  MapaSeleccionPage({required this.onLocationSelected});

  @override
  _MapaSeleccionPageState createState() => _MapaSeleccionPageState();
}

class _MapaSeleccionPageState extends State<MapaSeleccionPage> {
  GoogleMapController? _controller;
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selecciona tu ubicación',
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
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        onTap: (location) {
          setState(() {
            _selectedLocation = location;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(-16.52258664198911, -68.11198385265138), // Ubicación inicial
          zoom: 15,
        ),
        markers: _selectedLocation != null
            ? {
          Marker(
            markerId: MarkerId('selectedLocation'),
            position: _selectedLocation!,
          )
        }
            : {},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          if (_selectedLocation != null) {
            widget.onLocationSelected(_selectedLocation!);
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Por favor selecciona una ubicación')),
            );
          }
        },
        backgroundColor: Color(0xFF005954),
        foregroundColor: Colors.white,
      ),

    );
  }
}
