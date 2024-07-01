class SolicitudCita {
  final int? id;
  final int pacienteId;
  final DateTime fecha;
  final DateTime horario;
  final String direccion;

  SolicitudCita({
    this.id,
    required this.pacienteId,
    required this.fecha,
    required this.horario,
    required this.direccion,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_cita': id,
      'paciente_id_paciente': pacienteId,
      'fecha': fecha.toIso8601String(),
      'horario': horario.toIso8601String(),
      'direccion': direccion,
    };
  }

  factory SolicitudCita.fromMap(Map<String, dynamic> map) {
    return SolicitudCita(
      id: map['id_cita'],
      pacienteId: map['paciente_id_paciente'],
      fecha: DateTime.parse(map['fecha']),
      horario: DateTime.parse(map['horario']),
      direccion: map['direccion'],
    );
  }

}
