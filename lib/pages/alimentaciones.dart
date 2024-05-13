import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/navBar.dart';
import 'package:url_launcher/url_launcher.dart';

class Alimentaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alimentaciones',
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
              'Alimentaciones:',
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
                _buildListItem('Pacientes', onTap: () {
                }),
                _buildListItem('Gluten', onTap: () {
                }),
                _buildListItem('Alergias', onTap: () {
                }),
                _buildListItem('Cáncer', onTap: () {
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
