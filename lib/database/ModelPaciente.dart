class Paciente {
  final int? id;
  final String nombres;
  final String correo;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String genero;
  final String modoIngreso;
  final String direccion;
  final DateTime nacimiento;
  final String telefono;

  Paciente({
    this.id,
    required this.nombres,
    required this.correo,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.genero,
    required this.modoIngreso,
    required this.direccion,
    required this.nacimiento,
    required this.telefono,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_paciente': id,
      'nombres': nombres,
      'correo': correo,
      'apellidoPaterno': apellidoPaterno,
      'apellidoMaterno': apellidoMaterno,
      'genero': genero,
      'modoIngreso': modoIngreso,
      'direccion': direccion,
      'nacimiento': nacimiento.toIso8601String(),
      'telefono': telefono,
    };
  }

  factory Paciente.fromMap(Map<String, dynamic> map) {
    return Paciente(
      id: map['id_paciente'],
      nombres: map['nombres'],
      correo: map['correo'],
      apellidoPaterno: map['apellidoPaterno'],
      apellidoMaterno: map['apellidoMaterno'],
      genero: map['genero'],
      modoIngreso: map['modoIngreso'],
      direccion: map['direccion'],
      nacimiento: DateTime.parse(map['nacimiento']),
      telefono: map['telefono'],
    );
  }
}
