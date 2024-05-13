import 'package:flutter/material.dart';

class Vendaje extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VendajePage();  // Se ha eliminado MaterialApp y solo se devuelve ChatScreen.
  }
}

class VendajePage extends StatelessWidget {
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
              'Vendaje',
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
            text: 'Tipo 1: Vendaje Circular\nUtiliza este método para cubrir pequeñas áreas uniformemente. Simplemente enrolla el vendaje alrededor de la zona afectada de forma circular, asegurando que cada vuelta cubra parcialmente la anterior.',
            imageName: 'assets/vendaje_circular.png',
          ),
          _buildTextImageSection(
            text: 'Tipo 2: Vendaje en Espiral\nIdeal para extremidades, este método implica envolver el vendaje en espiral ascendente, asegurando que cada vuelta cubra al menos la mitad de la vuelta anterior.',
            imageName: 'assets/vendaje_espiral.png',
          ),
          _buildTextImageSection(
            text: 'Tipo 3: Espiral Invertida\nUsa este método para zonas más difíciles como el codo o la rodilla. Involucra un giro del vendaje en cada vuelta para acomodarse a la forma de la articulación.',
            imageName: 'assets/espiral_invertida.png',
          ),
          _buildTextImageSection(
            text: 'Tipo 4: Vendaje en Espiga\nSe utiliza para cubrir áreas que cambian de diámetro, como el antebrazo al codo. Se envuelve en forma de X alternando las direcciones con cada vuelta.',
            imageName: 'assets/vendaje_espega.png',
          ),
          _buildTextImageSection(
            text: 'Tipo 5: Vendaje Recurrente\nPerfecto para la cabeza o los muñones, donde el vendaje va de ida y vuelta sobre la parte superior de la zona afectada, cubriendo completamente el área.',
            imageName: 'assets/vendaje_recurrente.png',
          ),
          _buildTextImageSection(
            text: 'Tipo 6: Vendaje en Ocho\nFrecuentemente usado para las articulaciones, este método asegura soporte y movilidad limitada. Las vueltas del vendaje forman un ocho alrededor de la articulación.',
            imageName: 'assets/vendaje_ocho.png',
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
