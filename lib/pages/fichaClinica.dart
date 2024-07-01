import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FichaClinica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha Clinica de Paciente'),
      ),
      body: FichaClinicaForm(),
    );
  }
}

class FichaClinicaForm extends StatefulWidget {
  @override
  _FichaClinicaFormState createState() => _FichaClinicaFormState();
}

class _FichaClinicaFormState extends State<FichaClinicaForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;

  List<Step> _buildSteps() {
    return [
      Step(
        title: Text('Datos Personales'),
        content: Column(
          children: [
            FormBuilderTextField(
              name: 'nombre',
              decoration: InputDecoration(labelText: 'Nombre', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            FormBuilderDateTimePicker(
              name: 'fecha_nacimiento',
              inputType: InputType.date,
              decoration: InputDecoration(labelText: 'Fecha de Nacimiento', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            FormBuilderTextField(
              name: 'edad',
              decoration: InputDecoration(labelText: 'Edad', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            FormBuilderDateTimePicker(
              name: 'fecha',
              inputType: InputType.date,
              decoration: InputDecoration(labelText: 'Fecha', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            FormBuilderTextField(
              name: 'direccion',
              decoration: InputDecoration(labelText: 'Dirección', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            FormBuilderTextField(
              name: 'numero_telefono',
              decoration: InputDecoration(labelText: 'Número de Teléfono', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            FormBuilderTextField(
              name: 'nombre_doctor',
              decoration: InputDecoration(labelText: 'Nombre del Doctor Primario', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            FormBuilderTextField(
              name: 'correo_electronico',
              decoration: InputDecoration(labelText: 'Correo Electrónico del Paciente', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Historial Clínico'),
        content: Column(
          children: [
            FormBuilderTextField(
              name: 'medicamentos',
              decoration: InputDecoration(labelText: 'Enumere cualquier medicamento que esté tomando (orales, caseros, aspirina, etc)', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            FormBuilderTextField(
              name: 'alergias',
              decoration: InputDecoration(labelText: '¿Tiene alergias? Enumérelas', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            FormBuilderTextField(
              name: 'lesiones_cirugias_hospitalizaciones',
              decoration: InputDecoration(labelText: 'Enumere todas las lesiones importantes, cirugías y/o hospitalizaciones', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            FormBuilderCheckbox(
              name: 'amamantando_embarazada',
              title: Text('Para las mujeres: ¿Está amamantando o embarazada?', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'constitucional',
              decoration: InputDecoration(labelText: 'Constitucional', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'integumentaria',
              decoration: InputDecoration(labelText: 'Integumentaria', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'fiebre',
              decoration: InputDecoration(labelText: 'Fiebre', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'perdida_aumento_peso',
              decoration: InputDecoration(labelText: 'Pérdida / Aumento de Peso', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'dolores_cabeza',
              decoration: InputDecoration(labelText: 'Dolores de Cabeza', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'mareos',
              decoration: InputDecoration(labelText: 'Mareos', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'depresion',
              decoration: InputDecoration(labelText: 'Depresión', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'ansiedad',
              decoration: InputDecoration(labelText: 'Ansiedad', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'artritis',
              decoration: InputDecoration(labelText: 'Artritis', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'deficit_atencion',
              decoration: InputDecoration(labelText: 'Déficit de Atención', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
            SizedBox(height: 10),
            FormBuilderRadioGroup(
              name: 'desorden_sangre',
              decoration: InputDecoration(labelText: 'Desorden de Sangre', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              options: ['Sí', 'No']
                  .map((opcion) => FormBuilderFieldOption(value: opcion, child: Text(opcion)))
                  .toList(),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < _buildSteps().length - 1) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              if (_formKey.currentState!.saveAndValidate()) {
                print(_formKey.currentState!.value);
              } else {
                print("Validation failed");
              }
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
          },
          steps: _buildSteps(),
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (_currentStep > 0)
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('Atrás'),
                  ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: const Text('Siguiente'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
