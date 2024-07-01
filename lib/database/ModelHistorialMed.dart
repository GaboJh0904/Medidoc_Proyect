class HistorialMedico {
  final int? id;
  final int especialidadId;
  final int pacienteId;
  final List<int> documento;
  final String tipo;

  HistorialMedico({
    this.id,
    required this.especialidadId,
    required this.pacienteId,
    required this.documento,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_historialM': id,
      'Especialidad_id_especialidad': especialidadId,
      'Paciente_id_paciente': pacienteId,
      'documento': documento,
      'tipo': tipo,
    };
  }

  factory HistorialMedico.fromMap(Map<String, dynamic> map) {
    return HistorialMedico(
      id: map['id_historialM'],
      especialidadId: map['Especialidad_id_especialidad'],
      pacienteId: map['Paciente_id_paciente'],
      documento: List<int>.from(map['documento']),
      tipo: map['tipo'],
    );
  }
}
