import 'package:flutter/material.dart';
//ejemplo para citas
class Cita {
  final String especialidad;
  final DateTime fecha;
  final String hora;
  final String paciente;
  final String medico;
  final String direccion;

  Cita({
    required this.especialidad,
    required this.fecha,
    required this.hora,
    required this.paciente,
    required this.medico,
    required this.direccion,
  });
}

List<Cita> listaDeCitasGlobal = [];
