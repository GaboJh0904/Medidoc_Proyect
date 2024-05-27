import 'package:flutter/material.dart';


class rpo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildTitleWithCard(
                title: "Ritmo cardíaco",
                child: StatsCard(
                  value: "96",   //reemplazar
                  chart: Image.asset('assets/images/heart.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,

                  )
                  // Asume que tienes una imagen llamada heart_wave.png
                ),
              ),
              buildTitleWithCard(
                title: "Presión Sanguínea",
                child: StatsCard(
                  value: "80",  //reemplazar
                  chart: Image.asset('assets/images/heart.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,)

                ),
              ),
              buildTitleWithCircle(
                title: "Oxígeno en sangre",
                percentage: 70,
              ),
              buildTitleWithCircle(
                title: "Oxígeno en pulmones",
                percentage: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleWithCard({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Color(0xFFA836F4), fontSize: 20, fontWeight: FontWeight.bold), // Aumentado tamaño de fuente
        ),
        SizedBox(height: 10),
        child,
      ],
    );
  }

  Widget buildTitleWithCircle({required String title, required int percentage}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Color(0xFFA836F4), fontSize: 20, fontWeight: FontWeight.bold), // Aumentado tamaño de fuente
        ),
        SizedBox(height: 10),
        OxygenStats(percentage: percentage),
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  final String value;
  final Widget chart;

  const StatsCard({Key? key, required this.value, required this.chart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFA836F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Expanded(
            child: chart,
          ),
        ],
      ),
    );
  }
}

class OxygenStats extends StatelessWidget {
  final int percentage;

  const OxygenStats({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),  // Aumentado padding para agrandar el círculo
      decoration: BoxDecoration(
        color: Color(0xFFA836F4),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$percentage%',
          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),  // Aumentado tamaño de fuente
        ),
      ),
    );
  }
}
