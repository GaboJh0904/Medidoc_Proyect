import 'package:flutter/material.dart';
import 'package:medidoc_proyect/components/custom_button.dart';
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
          bodyMedium: TextStyle(
              color: Colors.white), // Cambiado de 'bodyText2' a 'bodyMedium'
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
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF005954), // Color 1
        elevation: 0,
      ),
      drawer: NavbarOptions(),
      backgroundColor: Color(0xFF6C62B6), // Blueberry
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  CustomButton(
                    text: 'Llamada de emergencia',
                    title: null,
                    sections: null,
                    color: Color(0xFF338b85), // Dark Blueberry
                    onTap: () {
                      _makePhoneCall(
                          'tel:165'); // Suponiendo 165 como número de emergencia
                    },
                  ),
                  CustomButton(
                    text: 'Reanimación',
                    title: 'Reanimación',
                    sections: [
                      {
                        'text':
                            'Paso 1. Llama a emergencias (165 - 160) \nSi presencias una emergencia, lo primero es llamar al número de emergencias. Mantén la calma y proporciona los detalles necesarios.',
                        'image': 'assets/images/reanimacion_1.png',
                      },
                      {
                        'text':
                            'Paso 2. Revisa signos vitales \nVerifica si la persona está consciente y respirando. Revisa el pulso y observa cualquier signo de vida.',
                        'image': 'assets/images/reanimacion_2.png',
                      },
                      {
                        'text':
                            'Paso 3. Escucha la respiración \nAcércate al pecho de la persona y trata de escuchar su respiración, además de observar si su pecho se eleva y desciende.',
                        'image': 'assets/images/reanimacion_3.png',
                      },
                      {
                        'text':
                            'Paso 4. Comienza la RCP \nSi la persona no está respirando normalmente, inicia la reanimación cardiopulmonar. Coloca tus manos entrelazadas sobre su pecho y presiona firmemente.',
                        'image': 'assets/images/reanimacion_4.png',
                      },
                      {
                        'text':
                            'Paso 5. Haz las compresiones \nRealiza compresiones torácicas firmes y rápidas. Asegúrate de presionar hacia abajo al menos 5 cm, pero no más de 6 cm.',
                        'image': 'assets/images/Reanimacion_5.png',
                      },
                      {
                        'text':
                            'Paso 6. Postura de recuperación \nSi la persona recobra la respiración pero sigue inconsciente, colócala en posición lateral de seguridad. Esto ayuda a mantener despejada la vía aérea.',
                        'image': 'assets/images/reanimacion_6.png',
                      },
                    ],
                    color: Color(0xFF338b85), // Dark Blueberry
                  ),
                  CustomButton(
                    text: 'Torniquetes',
                    title: 'Torniquetes',
                    sections: [
                      {
                        'text':
                            'Paso 1: Retire el torniquete CAT del botiquín (Bic) o de la funda de transporte. Asegúrese de tener acceso rápido a estos equipos en caso de emergencia.',
                        'image': 'assets/images/torniquete_1.jpg',
                      },
                      {
                        'text':
                            'Paso 2: Disponga el torniquete para su uso inmediato, preparándolo para colocarlo ya sea en el brazo o la pierna, según donde esté la lesión.',
                        'image': 'assets/images/torniquete_2.jpg',
                      },
                      {
                        'text':
                            'Paso 3: Coloque el torniquete lo más cerca posible del área de la herida que sangra, pero no sobre la herida misma. Esto ayudará a controlar el sangrado de manera más efectiva.',
                        'image': 'assets/images/torniquete_3.jpg',
                      },
                      {
                        'text':
                            'Paso 4: Ajuste la banda del torniquete alrededor del miembro lesionado, asegurándose de que esté suficientemente apretada para detener el flujo sanguíneo, pero sin causar daño adicional.',
                        'image': 'assets/images/torniquete_4.jpg',
                      },
                      {
                        'text':
                            'Paso 5: Gire el bastón de torsión del torniquete hasta que la hemorragia se detenga o hasta que desaparezcan los pulsos distales. Este paso es crucial para asegurar que el sangrado se ha controlado adecuadamente.',
                        'image': 'assets/images/torniquete_5.jpg',
                      },
                      {
                        'text':
                            'Paso 6: Asegure el bastón de torsión en una de las pestañas de anclaje del torniquete. Esto evitará que el torniquete se afloje y que el sangrado se reanude.',
                        'image': 'assets/images/torniquete_6.jpg',
                      },
                      {
                        'text':
                            'Paso 7: Coloque el resto de la cinta del torniquete entre las pestañas de anclaje, asegurándose de que todo el dispositivo está seguro y no se moverá.',
                        'image': 'assets/images/torniquete_7.jpg',
                      },
                      {
                        'text':
                            'Paso 8: Asegure el bastón de torsión y la cinta sobrante con la correa de velcro sobre las pestañas de anclaje. Esto proporciona una seguridad adicional para mantener el torniquete en su lugar durante el transporte o hasta que llegue ayuda médica.',
                        'image': 'assets/images/torniquete_8.jpg',
                      },
                      {
                        'text':
                            'Paso 9: Es importante documentar el momento exacto de la aplicación del torniquete, escribiéndolo en la correa de seguridad del torniquete y en una tarjeta de heridos TCCC, o incluso en la frente del herido si es necesario. Esto es vital para el tratamiento posterior.',
                        'image': 'assets/images/torniquete_9.jpg',
                      },
                      {
                        'text':
                            'Paso 10: Comunique con el personal de sanidad cualquier ayuda proporcionada y detalles del uso del torniquete. La comunicación efectiva puede ser crucial para el tratamiento posterior del herido.',
                        'image': 'assets/images/torniquete_10.jpg',
                      },
                    ],
                    color: Color(0xFF338b85), // Dark Blueberry
                  ),
                  CustomButton(
                    text: 'Vendaje',
                    title: 'Vendaje',
                    sections: [
                      {
                        'text':
                            'Tipo 1: Vendaje Circular\nUtiliza este método para cubrir pequeñas áreas uniformemente. Simplemente enrolla el vendaje alrededor de la zona afectada de forma circular, asegurando que cada vuelta cubra parcialmente la anterior.',
                        'image': 'assets/images/vendaje_1.jpg',
                      },
                      {
                        'text':
                            'Tipo 2: Vendaje en Espiral\nIdeal para extremidades, este método implica envolver el vendaje en espiral ascendente, asegurando que cada vuelta cubra al menos la mitad de la vuelta anterior.',
                        'image': 'assets/images/vendaje_2.jpg',
                      },
                      {
                        'text':
                            'Tipo 3: Espiral Invertida\nUsa este método para zonas más difíciles como el codo o la rodilla. Involucra un giro del vendaje en cada vuelta para acomodarse a la forma de la articulación.',
                        'image': 'assets/images/vendaje_3.jpg',
                      },
                      {
                        'text':
                            'Tipo 4: Vendaje en Espiga\nSe utiliza para cubrir áreas que cambian de diámetro, como el antebrazo al codo. Se envuelve en forma de X alternando las direcciones con cada vuelta.',
                        'image': 'assets/images/vendaje_4.jpg',
                      },
                      {
                        'text':
                            'Tipo 5: Vendaje Recurrente\nPerfecto para la cabeza o los muñones, donde el vendaje va de ida y vuelta sobre la parte superior de la zona afectada, cubriendo completamente el área.',
                        'image': 'assets/images/vendaje_5.jpg',
                      },
                      {
                        'text':
                            'Tipo 6: Vendaje en Ocho\nFrecuentemente usado para las articulaciones, este método asegura soporte y movilidad limitada. Las vueltas del vendaje forman un ocho alrededor de la articulación.',
                        'image': 'assets/images/vendaje_6.jpg',
                      },
                    ],
                    color: Color(0xFF338b85), // Dark Blueberry
                  ),
                  CustomButton(
                    text: 'Asma',
                    title: 'Asma',
                    sections: [
                      {
                        'text':
                            'Paso 1: Retiramos el tapón\nAntes de usar el inhalador, es importante retirar el tapón de la boquilla para asegurar que el medicamento pueda ser administrado correctamente.',
                        'image': 'assets/images/Asma_1.jpg',
                      },
                      {
                        'text':
                            'Paso 2: Giramos la base del inhalador\nGira la base del inhalador de un lado a otro hasta escuchar un clic. Esto indica que el inhalador está listo para ser usado.',
                        'image': 'assets/images/Asma_2.jpg',
                      },
                      {
                        'text':
                            'Paso 3: Inhalamos de forma fuerte y profunda\nColoca el inhalador en tu boca y realiza una inhalación fuerte y profunda. Esto ayuda a que el medicamento llegue profundamente a tus pulmones.',
                        'image': 'assets/images/Asma_4.jpg',
                      },
                      {
                        'text':
                            'Paso 4: Aguantamos la respiración\nDespués de inhalar, trata de aguantar tu respiración durante 10 segundos para permitir que el medicamento se asiente en los pulmones.',
                        'image': 'assets/images/Asma_5.jpg',
                      },
                      {
                        'text':
                            'Paso 5: Exhalamos lentamente\nFinalmente, exhala lentamente el aire pero no por la boquilla del inhalador. Es mejor hacerlo lentamente por la nariz para mantener los medicamentos en los pulmones el mayor tiempo posible.',
                        'image': 'assets/images/Asma_6.jpg',
                      },
                    ],
                    color: Color(0xFF338b85), // Dark Blueberry
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }
}
