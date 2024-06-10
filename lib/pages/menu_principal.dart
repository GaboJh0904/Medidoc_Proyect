import 'package:flutter/material.dart';
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
import 'package:medidoc_proyect/pages/fichaClinica.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidoc'),
      ),
      drawer: NavbarOptions(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            HomeIndicator(), // Banderita "Inicio" alineada a la izquierda
            Expanded(
              child: MyCustomButtonGrid(), // Cuadrícula de botones ajustada
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: PlaceholderWidget(), // Espacio ajustado para imagen/video
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
            color: Colors.purple,
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
  final List<String> options = [
    "Historial médico", "Botón de alerta", "Solicitud de cita", // Añade los títulos
    "Cancelación de cita", "Mapa de hospitales", "Cuestionarios médicos",
    "Teleconsulta", "Ver cita programada", "Receta médica", "Alimentaciones",
    "BPO", "Tutoriales de primeros auxilios", "Emergencia SOS",
    "Consulta en casa", "Chat asistente", "Calendario", // Asegúrate de tener 15 títulos
  ];

  void Function() _getActionForItem(String item, BuildContext context) {
    // Aquí puedes definir lo que cada opción debe hacer
    return () {
      if (item == 'Historial médico') {
        print("Redireccionar a la página de historial médico");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistorialMedicoPage()),
        );
      } else if (item == 'Tutoriales de primeros auxilios'){
        print("Redireccionar a la Tutoriales de primeros auxilios");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TutorialesPA()),
        );
      } else if (item == 'Solicitud de cita'){
        print("Redireccionar a agendar cita");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AgendarCita()),
        );
      } else if (item == 'Cancelación de cita'){
        print("Redireccionar a Cancelación de cita");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cancelacion()),
        );
      } else if (item == 'Consulta en casa'){
        print("Redireccionar a Consulta en casa");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Consulta()),
        );
      } else if (item == 'Mapa de hospitales'){
        print("Redireccionar a Mapa de hospitales");
        _launchURL('https://www.google.com/maps/search/hospital/@-16.5215258,-68.1111076,15z/data=!3m1!4b1?entry=ttu');
      } else if (item == 'Teleconsulta'){
        print("Redireccionar a Teleconsulta");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Teleconsulta()),
        );
      } else if (item == 'Chat asistente'){
        print("Redireccionar a Chat asistente");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatBot()),
        );
      } else if (item == 'Emergencia SOS'){
        print("Redireccionar a Emergencia SOS");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmergenciaSOS()),
        );
      } else if (item == 'Botón de alerta'){
        print("Redireccionar a Boton de alerta");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BotonSOS()),
        );
      } else if (item == 'Alimentaciones'){
        print("Redireccionar a Alimentaciones");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BotonSOS()),
        );
      }
      else if (item == 'Cuestionarios médicos'){
        print("Redireccionar a Cuestionarios médicos");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FichaClinica()),
        );
      }
      print('Se seleccionó: $item');
      // Aquí iría la lógica para cada acción
    };
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
        return GestureDetector(
          onTap: _getActionForItem(options[index], context),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                options[index],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MyCustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Botón simplificado sin estado interno
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0), // Espaciado entre botones
        width: 80, // Ancho del botón
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0), // Padding dentro del botón
              decoration: BoxDecoration(
                color: Colors.purple, // Color de fondo del botón
                borderRadius: BorderRadius.circular(10), // Borde redondeado
              ),
              child: Icon(
                Icons.add, // Icono del botón, cámbialo por el que necesites
                color: Colors.white,
                size: 24, // Tamaño del icono
              ),
            ),
            SizedBox(height: 8), // Espaciado entre icono y texto
            Text(
              text, // Texto del botón
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Reducir tamaño y mover a la esquina inferior derecha
    return Padding(
      padding: EdgeInsets.only(
        right: 16.0, // Ajustar según sea necesario
        bottom: 16.0, // Ajustar según sea necesario
      ),
      child: Container(
        width: 50, // Ancho del espacio para imagen/video
        height: 50, // Altura del espacio para imagen/video
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.person_outline,
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }
}