import 'package:flutter/material.dart';


Color purpleAccentWithOpacity = Colors.deepPurpleAccent.withOpacity(0.3);
class NavbarOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Opciones Medidoc'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.account_circle_sharp,
                size: 200,
                color: Colors.black54,
              ),
              const SizedBox(height: 20),//espacio
              const Text(
                'medidoc@ucb.edu.bo',
                style: TextStyle(fontSize: 22, color: Colors.deepPurpleAccent),
              ),
              const SizedBox(height: 20), //espacio
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    OptionButton(
                      icon: Icons.fingerprint,
                      label: 'Uso de huella',
                      onPressed: () {
                        print("Uso de huella");
                      },
                    ),
                    OptionButton(
                      icon: Icons.g_mobiledata,
                      label: 'Correo electronico',
                      onPressed: () {
                        print("Correo electronico");
                      },
                    ),
                    OptionButton(
                      icon: Icons.privacy_tip_outlined,
                      label: 'Politica de privacidad',
                      onPressed: () {
                        print("Politica de privacidad");
                      },
                    ),
                    OptionButton(
                      icon: Icons.settings,
                      label: 'Configuración',
                      onPressed: () {
                        print("Configuración");
                      },
                    ),
                    OptionButton(
                      icon: Icons.card_membership,
                      label: 'Identificador del dispositivo',
                      onPressed: () {
                        print("Identificador del dispositivo");
                      },
                    ),
                    OptionButton(
                      icon: Icons.medical_services_rounded,
                      label: 'Medicaciones',
                      onPressed: () {
                        print("Medicaciones");
                      },
                    ),
                    OptionButton(
                      icon: Icons.exit_to_app,
                      label: 'Cerrar sesion',
                      onPressed: () {
                        print("Cerrar sesion");
                      },
                    ),
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const OptionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
          icon,
          size: 40,
      ),
      label: Text(
        label,
        style: const TextStyle(fontSize: 22)
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),

      ),
    );
  }
}
