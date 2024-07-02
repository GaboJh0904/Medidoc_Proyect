import 'package:flutter/material.dart';
import 'package:medidoc_proyect/components/footer_asistente.dart';
import 'package:medidoc_proyect/components/menu_button.dart';
import 'package:medidoc_proyect/pages/EmergenciaSOS.dart';
import 'package:medidoc_proyect/pages/RPO.dart';
import 'package:medidoc_proyect/pages/RecetaMedica.dart';
import 'package:medidoc_proyect/pages/SOS.dart';
import 'package:medidoc_proyect/pages/TutorialesPA.dart';
import 'package:medidoc_proyect/pages/catalogoEspecialidades.dart';
import 'package:medidoc_proyect/pages/alimentaciones.dart';
import 'package:medidoc_proyect/pages/chat.dart';
import 'package:medidoc_proyect/pages/citasConfirmadasEliminar.dart';
import 'package:medidoc_proyect/pages/EspecialidadesCasa.dart';
import 'package:medidoc_proyect/pages/navBar.dart';
import 'package:medidoc_proyect/pages/historialMedico.dart';
import 'package:medidoc_proyect/pages/fichaClinica.dart';
import 'package:medidoc_proyect/pages/calendario.dart';
import 'package:medidoc_proyect/pages/visualizar_citas.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu Principal',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF005954), // Color 1
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: NavbarOptions(),
      backgroundColor: Color.fromARGB(255, 233, 236, 240),
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
                  Color(0xFF005954), // Color 1
                  Color(0xFF005954), // Color 1
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15), // Añade bordes redondeados
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
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
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
      "image": "assets/icons/historial_medico.png",
      "page": HistorialMedicoPage()
    },
    {"text": "Botón de alerta", "image": "assets/icons/boton_alerta.png", "page": BotonSOS()},
    {
      "text": "Solicitud de cita",
      "image": "assets/icons/cita_programable.png",
      "page": CatalogoEspecialidades(
        titulo: "Solicitar Cita",
        numFuncion: 1,
      )
    },
    {
      "text": "Cancelación de cita",
      "image": "assets/icons/cancelar_cita.png",
      "page": CitasConfirmadasEliminar()
    },
    {
      "text": "Mapa de hospitales",
      "image": "assets/icons/mapa_hospital.png",
      "url":
          'https://www.google.com/maps/search/hospital/@-16.5215258,-68.1111076,15z/data=!3m1!4b1?entry=ttu'
    },
    {
      "text": "Cuestionarios médicos",
      "image": "assets/icons/ficha_clinica.png",
      "page": FichaClinica(idPaciente: 1,)
    },
    {
      "text": "Teleconsulta",
      "image": "assets/icons/teleconsulta.png",
      "page": CatalogoEspecialidades(
        titulo: "Teleconsulta",
        numFuncion: 2,
      )
    },
    {
      "text": "Ver cita programada",
      "image": "assets/icons/ver_cita_programable.png",
      "page": VisualizarCitas()
    },
    {"text": "Receta médica", "image": "assets/icons/receta_medica.png", "page": RecetaMedica()},
    {
      "text": "Alimentaciones",
      "image": "assets/icons/alimentacion.png",
      "page": Alimentaciones()
    },
    {"text": "RPO", "image": "assets/icons/rpo.png", "page": rpo()},
    {
      "text": "Tutoriales de primeros auxilios",
      "image": "assets/icons/tutorial_primeros_auxilios.png",
      "page": TutorialesPA()
    },
    {
      "text": "Emergencia SOS",
      "image": "assets/icons/emergencia_sos.png",
      "page": EmergenciaSOS()
    },
    {
      "text": "Consulta en casa",
      "image": "assets/icons/consulta_en_casa.png",
      "page": EspecialidadesCasa(
        titulo: 'Consulta en casa',
        numFuncion: 2,
      )
    },
    {
      "text": "Chat asistente",
      "image": "assets/icons/chatbot.png",
      "page": ChatBot(nombreDoctor: "Asistente Bot", estado: 3)
    },
    {
      "text": "Calendario",
      "image": "assets/icons/calendario.png",
      "page": VisualizarCalendario()
    },
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
          imagePath: option['image'],
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
