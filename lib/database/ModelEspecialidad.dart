class Especialidad {
  final int? id;
  final String especialidad;

  Especialidad({this.id, required this.especialidad});

  Map<String, dynamic> toMap() {
    return {
      'id_especialidad': id,
      'especialidad': especialidad,
    };
  }

  factory Especialidad.fromMap(Map<String, dynamic> map) {
    return Especialidad(
      id: map['id_especialidad'],
      especialidad: map['especialidad'],
    );
  }
}