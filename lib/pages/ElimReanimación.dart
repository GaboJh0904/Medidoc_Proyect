import 'package:flutter/material.dart';

class Reanimacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReanimationPage();  // Se ha eliminado MaterialApp y solo se devuelve ChatScreen.
  }
}

class ReanimationPage extends StatelessWidget {
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
              'Reanimación',
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
            text: '1. Llama a emergencias (165 - 160) \nSi presencias una emergencia, lo primero es llamar al número de emergencias. Mantén la calma y proporciona los detalles necesarios.',
            imageName: 'assets/step1.png',
          ),
          _buildTextImageSection(
            text: '2. Revisa signos vitales \nVerifica si la persona está consciente y respirando. Revisa el pulso y observa cualquier signo de vida.',
            imageName: 'assets/step2.png',
          ),
          _buildTextImageSection(
            text: '3. Escucha la respiración \nAcércate al pecho de la persona y trata de escuchar su respiración, además de observar si su pecho se eleva y desciende.',
            imageName: 'assets/step3.png',
          ),
          _buildTextImageSection(
            text: '4. Comienza la RCP \nSi la persona no está respirando normalmente, inicia la reanimación cardiopulmonar. Coloca tus manos entrelazadas sobre su pecho y presiona firmemente.',
            imageName: 'assets/step4.png',
          ),
          _buildTextImageSection(
            text: '5. Haz las compresiones \nRealiza compresiones torácicas firmes y rápidas. Asegúrate de presionar hacia abajo al menos 5 cm, pero no más de 6 cm.',
            imageName: 'assets/step5.png',
          ),
          _buildTextImageSection(
            text: '6. Postura de recuperación \nSi la persona recobra la respiración pero sigue inconsciente, colócala en posición lateral de seguridad. Esto ayuda a mantener despejada la vía aérea.',
            imageName: 'assets/step6.png',
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
              fontSize: 14.0, // Ajusta el tamaño de la fuente según necesites
            ),
          ),
        ),
        Container(
          height: 200, // Asumiendo una altura fija para las imágenes
          decoration: BoxDecoration(
            color: Colors.white, // Color de fondo para el área de la imagen
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
