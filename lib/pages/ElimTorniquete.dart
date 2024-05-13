import 'package:flutter/material.dart';

class Torniquete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TorniquetePage();  // Se ha eliminado MaterialApp y solo se devuelve ChatScreen.
  }
}

class TorniquetePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 205, 223),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Torniquetes',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple.shade400,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 220, 205, 223),
      ),
      body: ListView(
        children: <Widget>[
          _buildTextImageSection(
            text: 'Paso 1: Retire el torniquete CAT del botiquín (Bic) o de la funda de transporte. Asegúrese de tener acceso rápido a estos equipos en caso de emergencia.',
            imageName: 'assets/step1.png',
          ),
          _buildTextImageSection(
            text: 'Paso 2: Disponga el torniquete para su uso inmediato, preparándolo para colocarlo ya sea en el brazo o la pierna, según donde esté la lesión.',
            imageName: 'assets/step2.png',
          ),
          _buildTextImageSection(
            text: 'Paso 3: Coloque el torniquete lo más cerca posible del área de la herida que sangra, pero no sobre la herida misma. Esto ayudará a controlar el sangrado de manera más efectiva.',
            imageName: 'assets/step3.png',
          ),
          _buildTextImageSection(
            text: 'Paso 4: Ajuste la banda del torniquete alrededor del miembro lesionado, asegurándose de que esté suficientemente apretada para detener el flujo sanguíneo, pero sin causar daño adicional.',
            imageName: 'assets/step4.png',
          ),
          _buildTextImageSection(
            text: 'Paso 5: Gire el bastón de torsión del torniquete hasta que la hemorragia se detenga o hasta que desaparezcan los pulsos distales. Este paso es crucial para asegurar que el sangrado se ha controlado adecuadamente.',
            imageName: 'assets/step5.png',
          ),
          _buildTextImageSection(
            text: 'Paso 6: Asegure el bastón de torsión en una de las pestañas de anclaje del torniquete. Esto evitará que el torniquete se afloje y que el sangrado se reanude.',
            imageName: 'assets/step6.png',
          ),
          _buildTextImageSection(
            text: 'Paso 7: Coloque el resto de la cinta del torniquete entre las pestañas de anclaje, asegurándose de que todo el dispositivo está seguro y no se moverá.',
            imageName: 'assets/step7.png',
          ),
          _buildTextImageSection(
            text: 'Paso 8: Asegure el bastón de torsión y la cinta sobrante con la correa de velcro sobre las pestañas de anclaje. Esto proporciona una seguridad adicional para mantener el torniquete en su lugar durante el transporte o hasta que llegue ayuda médica.',
            imageName: 'assets/step8.png',
          ),
          _buildTextImageSection(
            text: 'Paso 9: Es importante documentar el momento exacto de la aplicación del torniquete, escribiéndolo en la correa de seguridad del torniquete y en una tarjeta de heridos TCCC, o incluso en la frente del herido si es necesario. Esto es vital para el tratamiento posterior.',
            imageName: 'assets/step9.png',
          ),
          _buildTextImageSection(
            text: 'Paso 10: Comunique con el personal de sanidad cualquier ayuda proporcionada y detalles del uso del torniquete. La comunicación efectiva puede ser crucial para el tratamiento posterior del herido.',
            imageName: 'assets/step10.png',
          ),
        ],
      ),
    );
  }

  Widget _buildTextImageSection({required String text, required String imageName}) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          color: const Color.fromARGB(255, 220, 205, 223),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.purple.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(imageName),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
