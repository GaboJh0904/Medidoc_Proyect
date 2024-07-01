import 'dart:math';
import 'package:flutter/material.dart';

class rpo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF005954), // Dark Blueberry
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
                context); // Esto llevará al usuario de vuelta a la página anterior
          },
        ),
        title: Text(
          'RPO',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0,
      ),
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
                  value: "96",
                  icon: Icons.favorite,
                  chart: HeartbeatAnimation(),
                ),
              ),
              buildTitleWithCard(
                title: "Presión Sanguínea",
                child: StatsCard(
                  value: "80",
                  icon: Icons.monitor_heart_outlined,
                  chart: HeartbeatAnimation(),
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
          style: TextStyle(
            color: Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        child,
      ],
    );
  }

  Widget buildTitleWithCircle(
      {required String title, required int percentage}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        OxygenStats(percentage: percentage),
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  final String value;
  final IconData? icon;
  final Widget chart;

  const StatsCard(
      {Key? key, required this.value, required this.icon, required this.chart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(
            255, 123, 97, 167), // Purple shade from the color panel
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              if (icon != null) Icon(icon, color: Colors.white, size: 24),
              Text(
                value,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Spacer(),
          Expanded(
            flex: 6,
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
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Color.fromARGB(
            255, 123, 97, 167), // Purple shade from the color panel
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$percentage%',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HeartbeatPainter extends CustomPainter {
  final double progress;

  HeartbeatPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = LinearGradient(
      colors: [Colors.black, Colors.blueGrey, Colors.black],
    ).createShader(rect);

    final paint = Paint()
      ..shader = gradient
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    double x = 0.0;
    final y = size.height / 2;

    path.moveTo(x, y);

    while (x < size.width) {
      x += 1;
      final waveHeight = _getECGWaveHeight(x + progress);
      path.lineTo(x, y - waveHeight);
    }

    canvas.drawPath(path, paint);
  }

  double _getECGWaveHeight(double x) {
    double phase = (x % 300);
    if (phase < 30) {
      return 0.0;
    } else if (phase < 40) {
      return 20.0 * (phase - 30) / 10;
    } else if (phase < 50) {
      return 20.0 - 40.0 * (phase - 40) / 10;
    } else if (phase < 60) {
      return -20.0 + 40.0 * (phase - 50) / 10;
    } else if (phase < 70) {
      return -20.0 + 20.0 * (phase - 60) / 10;
    } else if (phase < 80) {
      return 0.0;
    } else if (phase < 90) {
      return 10.0 * (phase - 80) / 10;
    } else if (phase < 100) {
      return 10.0 - 20.0 * (phase - 90) / 10;
    } else if (phase < 110) {
      return -10.0 + 20.0 * (phase - 100) / 10;
    } else if (phase < 120) {
      return 0.0;
    } else if (phase < 130) {
      return 15.0 * (phase - 120) / 10;
    } else if (phase < 140) {
      return 15.0 - 30.0 * (phase - 130) / 10;
    } else if (phase < 150) {
      return -15.0 + 30.0 * (phase - 140) / 10;
    } else if (phase < 160) {
      return -15.0 + 15.0 * (phase - 150) / 10;
    } else if (phase < 180) {
      return 0.0;
    } else if (phase < 200) {
      return 5.0 * sin((phase - 180) * pi / 20);
    } else if (phase < 210) {
      return -5.0 * sin((phase - 200) * pi / 10);
    } else {
      return 0.0;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HeartbeatAnimation extends StatefulWidget {
  @override
  _HeartbeatAnimationState createState() => _HeartbeatAnimationState();
}

class _HeartbeatAnimationState extends State<HeartbeatAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return CustomPaint(
          painter: HeartbeatPainter(_controller!.value * 300),
          child: Container(
            width: 200,
            height: 100,
          ),
        );
      },
    );
  }
}
