import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  final LatLng _destination =
      LatLng(-16.5037, -68.1342); // Coordenadas del lugar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF005954), // Dark Blueberry
        title: Text(
          'Mapa y Contador',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
                context); // Esto llevará al usuario de vuelta a la página anterior
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _destination,
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('destination'),
                    position: _destination,
                  ),
                },
                onMapCreated: (controller) {
                  _controller = controller;
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Tiempo de llegada de la ayuda:',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.red,
              ),
            ),
          ),
          CountdownTimer(
            endTime: DateTime.now().millisecondsSinceEpoch +
                1000 * 60 * 5, // 5 minutos de cuenta regresiva
            widgetBuilder: (_, time) {
              if (time == null) {
                return Text('Llegaste a tu destino');
              }
              return Text(
                '${time.min ?? 0}:${time.sec ?? 0}',
                style: TextStyle(
                  fontSize: 48,
                  color: Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
