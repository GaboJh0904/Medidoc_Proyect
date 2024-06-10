import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'ModelCita.dart';
import 'ModelEspecialidad.dart';
import 'ModelHistorialMed.dart';
import 'ModelPaciente.dart';


class DatabaseHelper {
  static late Database _database;
  static final DatabaseHelper instance = DatabaseHelper._();

  DatabaseHelper._();

  Future<Database> get database async {
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'products.db');

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute('''
   CREATE TABLE Doctor (
    id_doctor integer NOT NULL CONSTRAINT Doctor_pk PRIMARY KEY AUTOINCREMENT,
    Especialidad_id_especialidad integer NOT NULL,
    nombres varchar(45) NOT NULL,
    apellidoPaterno varchar(45) NOT NULL,
    apellidoMaterno varchar(45) NOT NULL,
    telefono varchar(45) NOT NULL,
    CONSTRAINT Doctor_Especialidad FOREIGN KEY (Especialidad_id_especialidad)
    REFERENCES Especialidad (id_especialidad)
);

-- Table: Especialidad
CREATE TABLE Especialidad (
    id_especialidad integer NOT NULL CONSTRAINT Especialidad_pk PRIMARY KEY AUTOINCREMENT,
    especialidad varchar(75) NOT NULL
);

-- Table: HistorialMedico
CREATE TABLE HistorialMedico (
    id_historialM integer NOT NULL CONSTRAINT HistorialMedico_pk PRIMARY KEY AUTOINCREMENT,
    Especialidad_id_especialidad integer NOT NULL,
    Paciente_id_paciente integer NOT NULL,
    documento blob NOT NULL,
    tipo varchar(45) NOT NULL,
    CONSTRAINT HistorialMedico_Especialidad FOREIGN KEY (Especialidad_id_especialidad)
    REFERENCES Especialidad (id_especialidad),
    CONSTRAINT HistorialMedico_Paciente FOREIGN KEY (Paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
);

-- Table: Medicamento
CREATE TABLE Medicamento (
    id_medicamento integer NOT NULL CONSTRAINT Medicamento_pk PRIMARY KEY AUTOINCREMENT,
    medicamento varchar(75) NOT NULL,
    RecetaMedica_id_recetaM integer NOT NULL,
    CONSTRAINT Medicamento_RecetaMedica FOREIGN KEY (RecetaMedica_id_recetaM)
    REFERENCES RecetaMedica (id_recetaM)
);

-- Table: Paciente
CREATE TABLE Paciente (
    id_paciente integer NOT NULL CONSTRAINT Paciente_pk PRIMARY KEY AUTOINCREMENT,
    nombres varchar(55) NOT NULL,
    correo varchar(45) NOT NULL,
    apellidoPaterno varchar(45) NOT NULL,
    apellidoMaterno varchar(45) NOT NULL,
    genero varchar(45) NOT NULL,
    modoIngreso varchar(45) NOT NULL,
    direccion varchar(255) NOT NULL,
    nacimiento date NOT NULL,
    telefono varchar(45) NOT NULL
);

-- Table: PacienteDoctor
CREATE TABLE PacienteDoctor (
    id_pd integer NOT NULL CONSTRAINT PacienteDoctor_pk PRIMARY KEY AUTOINCREMENT,
    Doctor_id_doctor integer NOT NULL,
    Paciente_id_paciente integer NOT NULL,
    CONSTRAINT PacienteDoctor_Doctor FOREIGN KEY (Doctor_id_doctor)
    REFERENCES Doctor (id_doctor),
    CONSTRAINT PacienteDoctor_Paciente FOREIGN KEY (Paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
);

-- Table: RecetaMedica
CREATE TABLE RecetaMedica (
    id_recetaM integer NOT NULL CONSTRAINT RecetaMedica_pk PRIMARY KEY AUTOINCREMENT,
    receta varchar(45) NOT NULL,
    tipoReceta varchar(45) NOT NULL,
    Paciente_id_paciente integer NOT NULL,
    CONSTRAINT RecetaMedica_Paciente FOREIGN KEY (Paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
);

-- Table: SolicitudCita
CREATE TABLE SolicitudCita (
    id_cita integer NOT NULL CONSTRAINT SolicitudCita_pk PRIMARY KEY AUTOINCREMENT,
    Paciente_id_paciente integer NOT NULL,
    fecha date NOT NULL,
    horario datetime NOT NULL,
    direccion varchar(255) NOT NULL,
    CONSTRAINT SolicitudCita_Paciente FOREIGN KEY (Paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
);

  ''');
  }

  Future<int> insertPaciente(Paciente paciente) async {
    Database db = await instance.database;
    return await db.insert('Paciente', paciente.toMap());
  }

  Future<List<Paciente>> getPacientes() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('Paciente');
    return List.generate(maps.length, (i) {
      return Paciente.fromMap(maps[i]);
    });
  }

  Future<int> updatePaciente(Paciente paciente) async {
    Database db = await instance.database;
    return await db.update(
      'Paciente',
      paciente.toMap(),
      where: 'id_paciente = ?',
      whereArgs: [paciente.id],
    );
  }

  Future<int> deletePaciente(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'Paciente',
      where: 'id_paciente = ?',
      whereArgs: [id],
    );
  }

  // CRUD Solicitud de Cita
  Future<int> insertSolicitudCita(SolicitudCita cita) async {
    Database db = await instance.database;
    return await db.insert('SolicitudCita', cita.toMap());
  }

  Future<List<SolicitudCita>> getSolicitudesCita() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('SolicitudCita');
    return List.generate(maps.length, (i) {
      return SolicitudCita.fromMap(maps[i]);
    });
  }

  Future<int> updateSolicitudCita(SolicitudCita cita) async {
    Database db = await instance.database;
    return await db.update(
      'SolicitudCita',
      cita.toMap(),
      where: 'id_cita = ?',
      whereArgs: [cita.id],
    );
  }

  Future<int> deleteSolicitudCita(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'SolicitudCita',
      where: 'id_cita = ?',
      whereArgs: [id],
    );
  }

  // CRUD Especialidad
  // Función para insertar una especialidad en la base de datos
  Future<int> insertEspecialidad(Especialidad especialidad) async {
    Database db = await instance.database;
    return await db.insert('Especialidad', especialidad.toMap());
  }

  // Función para obtener todas las especialidades de la base de datos
  Future<List<Especialidad>> getEspecialidades() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('Especialidad');
    return List.generate(maps.length, (i) {
      return Especialidad.fromMap(maps[i]);
    });
  }

  // Función para actualizar una especialidad en la base de datos
  Future<int> updateEspecialidad(Especialidad especialidad) async {
    Database db = await instance.database;
    return await db.update(
      'Especialidad',
      especialidad.toMap(),
      where: 'id_especialidad = ?',
      whereArgs: [especialidad.id],
    );
  }

  // Función para eliminar una especialidad de la base de datos
  Future<int> deleteEspecialidad(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'Especialidad',
      where: 'id_especialidad = ?',
      whereArgs: [id],
    );
  }

  // CRUD Historial Medico
  // Función para insertar un historial médico en la base de datos
  Future<int> insertHistorialMedico(HistorialMedico historial) async {
    Database db = await instance.database;
    return await db.insert('HistorialMedico', historial.toMap());
  }

  // Función para obtener todos los historiales médicos de la base de datos
  Future<List<HistorialMedico>> getHistorialesMedicos() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('HistorialMedico');
    return List.generate(maps.length, (i) {
      return HistorialMedico.fromMap(maps[i]);
    });
  }

  // Función para actualizar un historial médico en la base de datos
  Future<int> updateHistorialMedico(HistorialMedico historial) async {
    Database db = await instance.database;
    return await db.update(
      'HistorialMedico',
      historial.toMap(),
      where: 'id_historialM = ?',
      whereArgs: [historial.id],
    );
  }

  // Función para eliminar un historial médico de la base de datos
  Future<int> deleteHistorialMedico(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'HistorialMedico',
      where: 'id_historialM = ?',
      whereArgs: [id],
    );
  }

  // CRUD Doctor


}