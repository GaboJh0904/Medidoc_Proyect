import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'modeloCita.dart';
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

  List<String> horarios = ['08:00', '09:30', '10:30', '11:00', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona Fecha y Hora'),
        backgroundColor: Colors.purpleAccent,
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
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.deepPurple[200],
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
              decoration: BoxDecoration(color: Colors.purple),
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
                      color: _selectedTime == horarios[index] ? Colors.purple : Colors.purple[100],
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
                  Cita nuevaCita = Cita(
                    especialidad: widget.especialidad,
                    fecha: _selectedDay,
                    hora: _selectedTime!,
                    paciente: 'Nombre del Paciente',
                    medico: widget.medico,
                    direccion: 'Dirección del Consultorio',
                  );
                  listaDeCitasGlobal.add(nuevaCita);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CitasConfirmadas()));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: Text('Confirmar Cita'),
            ),
          ),
        ],
      ),
    );
  }
}
