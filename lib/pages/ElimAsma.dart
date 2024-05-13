import 'package:flutter/material.dart';

class Asma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsmaPage();  // Se ha eliminado MaterialApp y solo se devuelve ChatScreen.
  }
}

class AsmaPage extends StatelessWidget {
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
          'Asma',
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
            text: 'Paso 1: Retiramos el tapón\nAntes de usar el inhalador, es importante retirar el tapón de la boquilla para asegurar que el medicamento pueda ser administrado correctamente.',
            imageName: 'assets/step1.png',  // Asegúrate de tener la imagen correcta en tus assets
          ),
          _buildTextImageSection(
            text: 'Paso 2: Giramos la base del inhalador\nGira la base del inhalador de un lado a otro hasta escuchar un clic. Esto indica que el inhalador está listo para ser usado.',
            imageName: 'assets/step2.png',
          ),
          _buildTextImageSection(
            text: 'Paso 3: Inhalamos de forma fuerte y profunda\nColoca el inhalador en tu boca y realiza una inhalación fuerte y profunda. Esto ayuda a que el medicamento llegue profundamente a tus pulmones.',
            imageName: 'assets/step3.png',
          ),
          _buildTextImageSection(
            text: 'Paso 4: Aguantamos la respiración\nDespués de inhalar, trata de aguantar tu respiración durante 10 segundos para permitir que el medicamento se asiente en los pulmones.',
            imageName: 'assets/step4.png',
          ),
          _buildTextImageSection(
            text: 'Paso 5: Exhalamos lentamente\nFinalmente, exhala lentamente el aire pero no por la boquilla del inhalador. Es mejor hacerlo lentamente por la nariz para mantener los medicamentos en los pulmones el mayor tiempo posible.',
            imageName: 'assets/step5.png',
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
