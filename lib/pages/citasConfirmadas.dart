import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'modeloCita.dart';
import 'package:intl/intl.dart';

class CitasConfirmadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citas Confirmadas'),
        backgroundColor: Colors.deepPurple,
      ),
      body: listaDeCitasGlobal.isEmpty
          ? Center(child: Text('No hay citas confirmadas.'))
          : AnimationLimiter(
        child: ListView.builder(
          itemCount: listaDeCitasGlobal.length,
          itemBuilder: (context, index) {
            Cita cita = listaDeCitasGlobal[index];
            String formattedDate = DateFormat('dd/MM/yyyy').format(cita.fecha);
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
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
                        Text("Fecha: $formattedDate", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text("Hora: ${cita.hora}", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        Text("Paciente: ${cita.paciente}", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        Text("Especialidad: ${cita.especialidad}", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        Text("Médico: ${cita.medico}", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        Text("Dirección: ${cita.direccion}", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
