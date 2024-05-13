import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/ElimAsma.dart';
import 'package:medidoc_proyect/pages/ElimReanimaci%C3%B3n.dart';
import 'package:medidoc_proyect/pages/ElimTorniquete.dart';
import 'package:medidoc_proyect/pages/ElimVendajes.dart';
import 'package:medidoc_proyect/pages/navBar.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergenciaSOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergencia SOS',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: SOSPage(),
      debugShowCheckedModeBanner: false, 
    );
  }
}

class SOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
              'Emergencia SOS',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade400,
              ),
              textAlign: TextAlign.center,
            ),
        backgroundColor: const Color.fromARGB(255, 220, 205, 223),
        elevation: 0,
      ),
      drawer: NavbarOptions(),
      backgroundColor: const Color.fromARGB(255, 220, 205, 223),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                _buildListItem('Llamada de emergencia', onTap: () {
                  _makePhoneCall('tel:165'); // Suponiendo 112 como número de emergencia
                }),
                _buildListItem('Reanimación', onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reanimacion())
                );
                }),
                _buildListItem('Torniquetes', onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Torniquete())
                );
                }),
                _buildListItem('Vendaje', onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Vendaje())
                );
                }),
                _buildListItem('Asma', onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Asma())
                );
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

  void _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
