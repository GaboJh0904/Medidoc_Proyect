import 'package:flutter/material.dart';
import 'package:medidoc_proyect/components/footer_asistente.dart';
import 'package:medidoc_proyect/components/menu_button.dart';
import 'package:medidoc_proyect/pages/EmergenciaSOS.dart';
import 'package:medidoc_proyect/pages/SOS.dart';
import 'package:medidoc_proyect/pages/TutorialesPA.dart';
import 'package:medidoc_proyect/pages/agendarCita.dart';
import 'package:medidoc_proyect/pages/chat.dart';
import 'package:medidoc_proyect/pages/elimCancelacion.dart';
import 'package:medidoc_proyect/pages/elimConsulta.dart';
import 'package:medidoc_proyect/pages/elimTeleconsulta.dart';
import 'package:medidoc_proyect/pages/navBar.dart';
import 'package:medidoc_proyect/pages/historialMedico.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidoc'),
      ),
      drawer: NavbarOptions(),
      backgroundColor: Color.fromARGB(255, 192, 196, 199),
      body: SafeArea(
        child: Column(
          children: [
            HomeIndicator(),
            Expanded(
              child: MyCustomButtonGrid(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FooterAsistente(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // La mitad del ancho de la pantalla
    double screenWidth = MediaQuery.of(context).size.width / 2;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(8.0),
        child: ClipPath(
          clipper: BannerClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4B3D82),  // Dark Blueberry
                  Color(0xFF6C62B6),  // Blueberry
                  //Color(0xFF9A92D6),  // Medium Light Blueberry
                  //Color(0xFFA6C6E4),  // Light Cornflower Blue
                  Color(0xFF5788A8),  // Medium Wedgwood
                  Color(0xFF204C67),  // Very Dark Peacock Blue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: 30,
            child: Center(
              child: Text(
                'Inicio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.75, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo lanzar $url';
  }
}

class MyCustomButtonGrid extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {
      "text": "Historial médico",
      "icon": Icons.medical_services,
      "page": HistorialMedicoPage()
    },
    {"text": "Botón de alerta", "icon": Icons.warning, "page": BotonSOS()},
    {
      "text": "Solicitud de cita",
      "icon": Icons.calendar_today,
      "page": AgendarCita()
    },
    {
      "text": "Cancelación de cita",
      "icon": Icons.cancel,
      "page": Cancelacion()
    },
    {
      "text": "Mapa de hospitales",
      "icon": Icons.map,
      "url":
          'https://www.google.com/maps/search/hospital/@-16.5215258,-68.1111076,15z/data=!3m1!4b1?entry=ttu'
    },
    {
      "text": "Cuestionarios médicos",
      "icon": Icons.question_answer,
      "page": BotonSOS()
    },
    {"text": "Teleconsulta", "icon": Icons.video_call, "page": Teleconsulta()},
    {
      "text": "Ver cita programada",
      "icon": Icons.event_note,
      "page": BotonSOS()
    },
    {"text": "Receta médica", "icon": Icons.receipt, "page": BotonSOS()},
    {"text": "Alimentaciones", "icon": Icons.fastfood, "page": BotonSOS()},
    {"text": "BPO", "icon": Icons.business_center, "page": BotonSOS()},
    {
      "text": "Tutoriales de primeros auxilios",
      "icon": Icons.school,
      "page": TutorialesPA()
    },
    {
      "text": "Emergencia SOS",
      "icon": Icons.phone_in_talk,
      "page": EmergenciaSOS()
    },
    {"text": "Consulta en casa", "icon": Icons.home, "page": Consulta()},
    {"text": "Chat asistente", "icon": Icons.chat, "page": ChatBot()},
    {"text": "Calendario", "icon": Icons.calendar_today, "page": BotonSOS()},
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return MenuButton(
          text: option['text'],
          icon: option['icon'],
          onPressed: () {
            if (option.containsKey('page')) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => option['page']),
              );
            } else if (option.containsKey('url')) {
              _launchURL(option['url']);
            }
          },
        );
      },
    );
  }
}