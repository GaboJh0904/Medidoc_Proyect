import 'package:flutter/material.dart';

class FooterAsistente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 58, 94, 124),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Bienvenido al menú principal de MediDoc. Aquí puedes acceder a todas las funciones y herramientas de la aplicación.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/Hablando.gif',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
