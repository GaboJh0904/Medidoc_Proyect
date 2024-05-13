import 'package:flutter/material.dart';
import 'dart:async';

import 'package:medidoc_proyect/pages/ElimAsma.dart';
import 'package:medidoc_proyect/pages/ElimReanimación.dart';
import 'package:medidoc_proyect/pages/ElimTorniquete.dart';
import 'package:medidoc_proyect/pages/ElimVendajes.dart';

class BotonSOS extends StatefulWidget {
  @override
  _BotonSOSState createState() => _BotonSOSState();
}

class _BotonSOSState extends State<BotonSOS> {
  Timer? _timer;
  int _remainingTime = 3600;  // 1 hour for countdown

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();  // Stops timer when it reaches 0
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'SOS',
              style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Tiempo de llegada de la ayuda: ${_formatTime(_remainingTime)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                _buildListItem('Cancelar llamado SOS', onTap: () {
                  _showCancelDialog();
                }),
                _buildListItem('Reanimación', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Reanimacion()));
                }),
                _buildListItem('Torniquetes', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Torniquete()));
                }),
                _buildListItem('Vendaje', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Vendaje()));
                }),
                _buildListItem('Asma', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Asma()));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, {required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade400,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancelar llamada SOS'),
          content: Text('¿Seguro que quieres cancelar la llamada SOS?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog
              },
            ),
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                _timer?.cancel();
                Navigator.of(context).pop();  // Close the dialog
                Navigator.of(context).pop();  // Go back to previous screen
              },
            ),
          ],
        );
      },
    );
  }
}
