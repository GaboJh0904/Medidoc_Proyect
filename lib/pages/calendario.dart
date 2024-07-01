import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class VisualizarCalendario extends StatefulWidget {
  @override
  _VisualizarCalendarioState createState() => _VisualizarCalendarioState();
}

class _VisualizarCalendarioState extends State<VisualizarCalendario> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Visualizar Calendario',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF005954), // Dark Blueberry
        elevation: 0,
      ),
      body: TableCalendar(
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
            color:
                Color.fromARGB(255, 51, 133, 209), // Color del esquema anterior
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
    );
  }
}
