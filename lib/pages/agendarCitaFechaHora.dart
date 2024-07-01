import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'citasConfirmadas.dart';

class AgendarCitaFechaHora extends StatefulWidget {
  final String especialidad;
  final String medico;

  AgendarCitaFechaHora({required this.especialidad, required this.medico});

  @override
  _AgendarCitaFechaHoraState createState() => _AgendarCitaFechaHoraState();
}

class _AgendarCitaFechaHoraState extends State<AgendarCitaFechaHora> {
  DateTime _selectedDay = DateTime.now();
  String? _selectedTime;

  List<String> horarios = [
    '08:00',
    '09:30',
    '10:30',
    '11:00',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selecciona Fecha y Hora',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
        elevation: 0,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.black),
              weekendTextStyle: TextStyle(color: Colors.red),
              todayTextStyle: TextStyle(color: Colors.white),
              selectedTextStyle: TextStyle(color: Colors.white),
              selectedDecoration: BoxDecoration(
                color: Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Color.fromARGB(
                    255, 51, 133, 209), // Color del esquema anterior
                shape: BoxShape.circle,
              ),
              outsideTextStyle: TextStyle(color: Colors.grey),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
              titleCentered: true,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 52, 123, 230)), // Dark Blueberry
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white),
              weekendStyle: TextStyle(color: Colors.red),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: horarios.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTime = horarios[index];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedTime == horarios[index]
                          ? Color.fromARGB(255, 36, 83, 153)
                          : Color.fromARGB(255, 42, 107, 145),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        horarios[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedTime != null) {
                  _confirmarCita();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 36, 83, 153), // Dark Blueberry
              ),
              child: Text(
                'Confirmar Cita',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmarCita() async {
    final db = FirebaseFirestore.instance;

    final nuevaCita = {
      'doctor_id_doctor': widget.medico,
      'paciente_id_paciente': '1',
      'direccion': '123 Main St',
      'estado': 'pendiente',
      'fecha': _selectedDay,
      'horario': _selectedTime,
      'tipocita': widget.especialidad,
      'id_cita': await _obtenerProximoIdCita(),
    };

    await db.collection('SolicitudCita').add(nuevaCita);

    // Navegar a la página de confirmación de citas u otra página adecuada.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CitasConfirmadas()),
    );
  }

  Future<int> _obtenerProximoIdCita() async {
    final db = FirebaseFirestore.instance;
    final querySnapshot = await db
        .collection('SolicitudCita')
        .orderBy('id_cita', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final ultimoId = querySnapshot.docs.first.get('id_cita') as int;
      return ultimoId + 1;
    } else {
      return 1; // Si no hay citas, empieza en 1.
    }
  }
}
