import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'modeloCita.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VisualizarCitas extends StatefulWidget {
  @override
  _VisualizarCitasState createState() => _VisualizarCitasState();
}

class _VisualizarCitasState extends State<VisualizarCitas> {
  String filtroActual = 'fecha';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Visualizar Citas Programadas',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF005954), // Color 1
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('SolicitudCita').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No hay citas programadas.'));
          }

          List<Cita> citas = snapshot.data!.docs.map((doc) {
            final data = doc.data()
                as Map<String, dynamic>?; // Cast to Map<String, dynamic>
            return Cita(
              especialidad: data?.containsKey('tipocita') == true
                  ? data!['tipocita']
                  : 'Especialidad no especificada',
              fecha: (data?.containsKey('fecha') == true
                      ? data!['fecha']
                      : Timestamp.now())
                  .toDate(),
              hora: data?.containsKey('horario') == true
                  ? data!['horario']
                  : 'Hora no especificada',
              paciente:
                  'Nombre del Paciente', // Asignar el nombre del paciente según sea necesario
              medico: data?.containsKey('doctor_id_doctor') == true
                  ? data!['doctor_id_doctor']
                  : 'Doctor no especificado',
              direccion: data?.containsKey('direccion') == true
                  ? data!['direccion']
                  : 'Dirección no especificada',
            );
          }).toList();

          List<Cita> citasFiltradas = _filtrarCitas(citas);

          return Column(
            children: [
              citasFiltradas.isEmpty
                  ? Expanded(
                      child: Center(child: Text('No hay citas programadas.')))
                  : Expanded(
                      child: CarouselSlider.builder(
                        itemCount: citasFiltradas.length,
                        itemBuilder: (context, index, realIndex) {
                          Cita cita = citasFiltradas[index];
                          String formattedDate =
                              DateFormat('dd/MM/yyyy').format(cita.fecha);
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[100], // Dark Blueberry
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Fecha: $formattedDate",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                SizedBox(height: 10),
                                Text("Hora: ${cita.hora}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                SizedBox(height: 10),
                                Text("Paciente: ${cita.paciente}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                SizedBox(height: 10),
                                Text("Especialidad: ${cita.especialidad}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                SizedBox(height: 10),
                                Text("Médico: ${cita.medico}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                SizedBox(height: 10),
                                Text("Dirección: ${cita.direccion}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 400,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        filtroActual = 'fecha';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          filtroActual == 'fecha' ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Por Fecha'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        filtroActual = 'medico';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          filtroActual == 'medico' ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Por Médico'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        filtroActual = 'especialidad';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: filtroActual == 'especialidad'
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text('Por Especialidad'),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  List<Cita> _filtrarCitas(List<Cita> citas) {
    List<Cita> citasOrdenadas = List.from(citas);
    if (filtroActual == 'fecha') {
      citasOrdenadas.sort((a, b) => a.fecha.compareTo(b.fecha));
    } else if (filtroActual == 'medico') {
      citasOrdenadas.sort((a, b) => a.medico.compareTo(b.medico));
    } else if (filtroActual == 'especialidad') {
      citasOrdenadas.sort((a, b) => a.especialidad.compareTo(b.especialidad));
    }
    return citasOrdenadas;
  }
}
