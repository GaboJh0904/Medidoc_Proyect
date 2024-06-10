import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestión de Alimentaciones')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DietListPage(
                      dietCategory: 'Alimentaciones Personalizadas',
                      diets: personalizedDiets,
                    ),
                  ),
                );
              },
              child: Text('Alimentaciones Personalizadas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DietListPage(
                      dietCategory: 'Alimentaciones Gluten',
                      diets: glutenDiets,
                    ),
                  ),
                );
              },
              child: Text('Alimentaciones Gluten'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DietListPage(
                      dietCategory: 'Alimentaciones Alergias',
                      diets: allergyDiets,
                    ),
                  ),
                );
              },
              child: Text('Alimentaciones Alergias'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DietListPage(
                      dietCategory: 'Alimentaciones Cáncer',
                      diets: cancerDiets,
                    ),
                  ),
                );
              },
              child: Text('Alimentaciones Cáncer'),
            ),
          ],
        ),
      ),
    );
  }
}

class Diet {
  final String name;
  final Map<String, Map<String, String>> weeklyDiet;
  final List<String> mandatoryFoods;
  final List<String> forbiddenFoods;

  Diet({
    required this.name,
    required this.weeklyDiet,
    required this.mandatoryFoods,
    required this.forbiddenFoods,
  });
}

class DietListPage extends StatelessWidget {
  final String dietCategory;
  final List<Diet> diets;

  DietListPage({required this.dietCategory, required this.diets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dietCategory),
      ),
      body: ListView.builder(
        itemCount: diets.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DietDetailPage(diet: diets[index]),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                padding: EdgeInsets.all(20), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Button border radius
                ),
              ),
              child: Text(
                diets[index].name,
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<Diet> personalizedDiets = [
  Diet(
    name: "Dieta Personalizada 1",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Batido de espinacas, plátano y leche de almendras',
        'Almuerzo': 'Ensalada de quinoa con aguacate, tomate y garbanzos',
        'Cena': 'Salmón al horno con espárragos',
      },
      'Martes': {
        'Desayuno': 'Tostadas integrales con aguacate y huevo pochado',
        'Almuerzo': 'Pollo a la plancha con brócoli al vapor y arroz integral',
        'Cena': 'Ensalada de lentejas con vegetales asados',
      },
      'Miércoles': {
        'Desayuno': 'Yogurt griego con granola y frutas frescas',
        'Almuerzo': 'Tacos de pavo con tortillas de maíz integral y guacamole',
        'Cena': 'Pescado al horno con espárragos y batata asada',
      },
      'Jueves': {
        'Desayuno': 'Smoothie bowl de bayas con semillas de chía',
        'Almuerzo': 'Ensalada de garbanzos, pepino, tomate y queso feta',
        'Cena': 'Pechuga de pollo a la plancha con verduras salteadas',
      },
      'Viernes': {
        'Desayuno': 'Pan integral con aguacate y salmón ahumado',
        'Almuerzo': 'Pasta integral con salsa de tomate casera y espinacas',
        'Cena': 'Tortilla francesa de claras de huevo con espárragos y champiñones',
      },
      'Sábado': {
        'Desayuno': 'Tortitas de avena con plátano y nueces',
        'Almuerzo': 'Wrap integral con pollo, lechuga, tomate y hummus',
        'Cena': 'Sopa de verduras casera con una rebanada de pan integral',
      },
      'Domingo': {
        'Desayuno': 'Huevos revueltos con espinacas y tomate',
        'Almuerzo': 'Pescado a la parrilla con ensalada de quinoa y aguacate',
        'Cena': 'Vegetales al horno con tofu marinado',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Granos enteros'],
    forbiddenFoods: ['Azúcar refinada', 'Alimentos procesados', 'Grasas trans', 'Bebidas azucaradas'],
  ),
  Diet(
    name: "Dieta Personalizada 2",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Tostadas integrales con aguacate y tomate',
        'Almuerzo': 'Sopa de lentejas con vegetales',
        'Cena': 'Pechuga de pollo al horno con brócoli al vapor',
      },
      'Martes': {
        'Desayuno': 'Batido de plátano, espinacas y leche de almendras',
        'Almuerzo': 'Ensalada de quinoa con garbanzos y vegetales asados',
        'Cena': 'Pescado al horno con espárragos',
      },
      'Miércoles': {
        'Desayuno': 'Yogurt griego con granola y frutas frescas',
        'Almuerzo': 'Wrap integral con pollo, lechuga, tomate y hummus',
        'Cena': 'Ensalada de garbanzos con aguacate, pepino y tomate',
      },
      'Jueves': {
        'Desayuno': 'Tortitas de avena con plátano y nueces',
        'Almuerzo': 'Pasta integral con salsa de tomate casera y espinacas',
        'Cena': 'Pollo a la plancha con quinoa y brócoli al vapor',
      },
      'Viernes': {
        'Desayuno': 'Smoothie bowl de bayas con semillas de chía',
        'Almuerzo': 'Tacos de pavo con tortillas de maíz integral y guacamole',
        'Cena': 'Salmón al horno con espárragos y batata asada',
      },
      'Sábado': {
        'Desayuno': 'Huevos revueltos con espinacas y champiñones',
        'Almuerzo': 'Ensalada de garbanzos, pepino, tomate y queso feta',
        'Cena': 'Sopa de verduras casera con una rebanada de pan integral',
      },
      'Domingo': {
        'Desayuno': 'Pan integral con aguacate y huevo pochado',
        'Almuerzo': 'Pescado a la parrilla con ensalada de quinoa y aguacate',
        'Cena': 'Vegetales al horno con tofu marinado',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Granos enteros'],
    forbiddenFoods: ['Azúcar refinada', 'Alimentos procesados', 'Grasas trans', 'Bebidas azucaradas'],
  ),
];


final List<Diet> glutenDiets = [
  Diet(
    name: "Dieta sin Gluten 1",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Batido de frutas con leche de almendras',
        'Almuerzo': 'Pechuga de pollo a la plancha con quinoa y vegetales',
        'Cena': 'Sopa de calabaza y zanahoria',
      },
      'Martes': {
        'Desayuno': 'Tostadas de pan sin gluten con aguacate y tomate',
        'Almuerzo': 'Ensalada de garbanzos, pepino, tomate y atún',
        'Cena': 'Salmón al horno con espárragos y patatas al vapor',
      },
      'Miércoles': {
        'Desayuno': 'Yogurt natural con frutas frescas y nueces',
        'Almuerzo': 'Tacos de carne de res con tortillas de maíz y guacamole',
        'Cena': 'Ensalada verde con pollo a la plancha',
      },
      'Jueves': {
        'Desayuno': 'Avena sin gluten con plátano y miel',
        'Almuerzo': 'Pasta de arroz integral con salsa de tomate y verduras',
        'Cena': 'Filete de pescado con brócoli al vapor',
      },
      'Viernes': {
        'Desayuno': 'Smoothie bowl de bayas con semillas de chía',
        'Almuerzo': 'Wrap de pavo con lechuga, tomate y hummus en tortilla de maíz',
        'Cena': 'Ensalada de quinoa con vegetales asados',
      },
      'Sábado': {
        'Desayuno': 'Tortitas de plátano y huevo con frutas frescas',
        'Almuerzo': 'Pollo al horno con batatas asadas y espárragos',
        'Cena': 'Sopa de verduras con pollo desmenuzado',
      },
      'Domingo': {
        'Desayuno': 'Huevos revueltos con espinacas y champiñones',
        'Almuerzo': 'Ensalada de lentejas con aguacate, tomate y huevo duro',
        'Cena': 'Pechuga de pollo a la parrilla con vegetales al vapor',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Quinoa'],
    forbiddenFoods: ['Trigo', 'Cebada', 'Centeno', 'Avena (a menos que sea sin gluten)'],
  ),
  Diet(
    name: "Dieta sin Gluten 2",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Smoothie verde con espinacas, piña y leche de coco',
        'Almuerzo': 'Ensalada de garbanzos, pepino, tomate y queso feta',
        'Cena': 'Salmón al horno con espárragos',
      },
      'Martes': {
        'Desayuno': 'Tostadas de pan sin gluten con aguacate y huevo pochado',
        'Almuerzo': 'Wrap de pollo con tortillas de maíz y guacamole',
        'Cena': 'Ensalada de quinoa con aguacate, tomate y pepino',
      },
      'Miércoles': {
        'Desayuno': 'Yogurt griego con frutas frescas y granola sin gluten',
        'Almuerzo': 'Pasta de arroz integral con salsa de tomate casera y espinacas',
        'Cena': 'Pollo a la plancha con batatas asadas y brócoli al vapor',
      },
      'Jueves': {
        'Desayuno': 'Batido de plátano, espinacas y leche de almendras',
        'Almuerzo': 'Sopa de lentejas con vegetales',
        'Cena': 'Tortilla francesa de claras de huevo con espárragos y champiñones',
      },
      'Viernes': {
        'Desayuno': 'Avena sin gluten con plátano y nueces',
        'Almuerzo': 'Ensalada de quinoa con aguacate, pepino y tomate',
        'Cena': 'Pescado al horno con vegetales asados',
      },
      'Sábado': {
        'Desayuno': 'Tortitas de avena y plátano sin gluten con frutas frescas',
        'Almuerzo': 'Pavo a la plancha con ensalada verde y aderezo balsámico',
        'Cena': 'Sopa de calabaza y zanahoria',
      },
      'Domingo': {
        'Desayuno': 'Huevos revueltos con espinacas y tomate',
        'Almuerzo': 'Pollo al horno con batatas asadas y espárragos',
        'Cena': 'Ensalada de garbanzos, pepino, tomate y atún',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Quinoa'],
    forbiddenFoods: ['Trigo', 'Cebada', 'Centeno', 'Avena (a menos que sea sin gluten)'],
  ),
];

final List<Diet> allergyDiets = [
  Diet(
    name: "Alimentación para Alergia a los Frutos Secos",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Batido de frutas con leche de almendras',
        'Almuerzo': 'Ensalada de pollo con aguacate y vegetales',
        'Cena': 'Pescado al horno con verduras al vapor',
      },
      'Martes': {
        'Desayuno': 'Tostadas de pan integral con mantequilla de semillas de girasol',
        'Almuerzo': 'Wrap de pavo con vegetales y mayonesa sin frutos secos',
        'Cena': 'Pasta integral con salsa de tomate y pollo desmenuzado',
      },
      'Miércoles': {
        'Desayuno': 'Smoothie bowl de bayas con leche de coco',
        'Almuerzo': 'Ensalada de quinoa con aguacate, tomate y huevo duro',
        'Cena': 'Salmón al horno con quinoa y espárragos',
      },
      'Jueves': {
        'Desayuno': 'Avena con plátano y miel',
        'Almuerzo': 'Wrap de pollo con hummus y vegetales en tortilla integral',
        'Cena': 'Ensalada verde con atún en conserva y vinagreta de limón',
      },
      'Viernes': {
        'Desayuno': 'Yogurt de soja con frutas frescas y granola sin frutos secos',
        'Almuerzo': 'Pechuga de pollo a la plancha con arroz integral y brócoli al vapor',
        'Cena': 'Tortilla francesa de claras de huevo con espinacas y champiñones',
      },
      'Sábado': {
        'Desayuno': 'Huevos revueltos con tomate y aguacate',
        'Almuerzo': 'Ensalada de garbanzos con tomate, pepino y pimiento',
        'Cena': 'Pasta integral con pesto de albahaca y pollo a la parrilla',
      },
      'Domingo': {
        'Desayuno': 'Tostadas de pan sin frutos secos con mermelada de frutas naturales',
        'Almuerzo': 'Wrap de atún con aguacate, lechuga y tomate en tortilla integral',
        'Cena': 'Salmón al horno con patatas asadas y espárragos',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Granos enteros'],
    forbiddenFoods: ['Almendras', 'Nueces', 'Cacahuetes', 'Otros frutos secos y semillas'],
  ),
  Diet(
    name: "Alimentación para Alergia al Marisco",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Batido de frutas con leche de coco',
        'Almuerzo': 'Ensalada de pollo con aguacate y vegetales',
        'Cena': 'Pescado al horno con verduras al vapor',
      },
      'Martes': {
        'Desayuno': 'Tostadas de pan integral con mermelada de frutas naturales',
        'Almuerzo': 'Pasta integral con salsa de tomate y pollo desmenuzado',
        'Cena': 'Salmón al horno con quinoa y espárragos',
      },
      'Miércoles': {
        'Desayuno': 'Yogurt de soja con frutas frescas y granola sin frutos secos',
        'Almuerzo': 'Wrap de pollo con vegetales y mayonesa sin frutos secos',
        'Cena': 'Ensalada verde con atún en conserva y aguacate',
      },
      'Jueves': {
        'Desayuno': 'Avena con plátano y miel',
        'Almuerzo': 'Ensalada de garbanzos con aguacate, tomate y pepino',
        'Cena': 'Pechuga de pollo a la plancha con arroz integral y brócoli al vapor',
      },
      'Viernes': {
        'Desayuno': 'Smoothie bowl de bayas con leche de almendras',
        'Almuerzo': 'Wrap de pavo con aguacate, tomate y lechuga en tortilla integral',
        'Cena': 'Ensalada de quinoa con vegetales asados y pollo a la parrilla',
      },
      'Sábado': {
        'Desayuno': 'Huevos revueltos con espinacas y champiñones',
        'Almuerzo': 'Pasta integral con salsa de tomate casera y verduras',
        'Cena': 'Sopa de verduras con carne de pollo desmenuzada',
      },
      'Domingo': {
        'Desayuno': 'Tostadas de pan integral con aguacate y tomate',
        'Almuerzo': 'Ensalada de quinoa con aguacate, tomate y huevo duro',
        'Cena': 'Pechuga de pollo a la plancha con puré de boniato',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Granos enteros'],
    forbiddenFoods: ['Camarones', 'Langostinos', 'Cangrejo', 'Otros mariscos y productos del mar'],
  ),
  Diet(
    name: "Alimentación para Alergia a los Lácteos",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Batido de frutas con leche de almendras',
        'Almuerzo': 'Ensalada de pollo con aguacate y vegetales',
        'Cena': 'Pescado al horno con verduras al vapor',
      },
      'Martes': {
        'Desayuno': 'Tostadas de pan integral con mermelada de frutas naturales',
        'Almuerzo': 'Wrap de pavo con vegetales y hummus',
        'Cena': 'Pasta integral con salsa de tomate y pollo desmenuzado',
      },
      'Miércoles': {
        'Desayuno': 'Smoothie bowl de bayas con yogurt de soja y granola sin lácteos',
        'Almuerzo': 'Ensalada de quinoa con aguacate, tomate y huevo duro',
        'Cena': 'Salmón al horno con quinoa y espárragos',
      },
      'Jueves': {
        'Desayuno': 'Avena con plátano y miel',
        'Almuerzo': 'Wrap de pollo con vegetales y mayonesa sin lácteos en tortilla integral',
        'Cena': 'Ensalada verde con atún en conserva y aguacate',
      },
      'Viernes': {
        'Desayuno': 'Yogurt de soja con frutas frescas y semillas de chía',
        'Almuerzo': 'Pechuga de pollo a la plancha con arroz integral y brócoli al vapor',
        'Cena': 'Tortilla francesa de claras de huevo con espinacas y champiñones',
      },
      'Sábado': {
        'Desayuno': 'Huevos revueltos con tomate y aguacate',
        'Almuerzo': 'Ensalada de garbanzos con tomate, pepino y pimiento',
        'Cena': 'Pasta integral con pesto de albahaca y pollo a la parrilla',
      },
      'Domingo': {
        'Desayuno': 'Tostadas de pan integral con mermelada de frutas naturales',
        'Almuerzo': 'Wrap de atún con aguacate, lechuga y tomate en tortilla integral',
        'Cena': 'Pechuga de pollo a la plancha con puré de boniato',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Granos enteros'],
    forbiddenFoods: ['Leche de vaca', 'Quesos', 'Yogurt', 'Mantequilla y otros lácteos'],
  ),
];


final List<Diet> cancerDiets = [
  Diet(
    name: "Alimentación para Cáncer de Colon",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Batido verde de espinacas, piña y jengibre',
        'Almuerzo': 'Ensalada de quinoa con vegetales y pollo a la plancha',
        'Cena': 'Sopa de calabaza y zanahoria con trozos de pollo',
      },
      'Martes': {
        'Desayuno': 'Avena con plátano y nueces',
        'Almuerzo': 'Salmón al horno con espárragos y patatas dulces',
        'Cena': 'Ensalada de garbanzos con aguacate, tomate y pepino',
      },
      'Miércoles': {
        'Desayuno': 'Yogurt natural con frutas frescas y semillas de chía',
        'Almuerzo': 'Pasta integral con salsa de tomate casera y vegetales',
        'Cena': 'Pechuga de pollo a la plancha con brócoli al vapor',
      },
      'Jueves': {
        'Desayuno': 'Tostadas integrales con aguacate y huevo pochado',
        'Almuerzo': 'Ensalada de lentejas con vegetales y atún en conserva',
        'Cena': 'Salmón al horno con brócoli y quinoa',
      },
      'Viernes': {
        'Desayuno': 'Smoothie bowl de frutas y espinacas con semillas de calabaza',
        'Almuerzo': 'Wrap integral con pollo, vegetales y hummus',
        'Cena': 'Ensalada verde con quinoa, aguacate y tomate',
      },
      'Sábado': {
        'Desayuno': 'Huevos revueltos con espinacas y champiñones',
        'Almuerzo': 'Pavo a la plancha con puré de batata y espárragos al vapor',
        'Cena': 'Sopa de verduras casera con una rebanada de pan integral',
      },
      'Domingo': {
        'Desayuno': 'Tortitas de avena y plátano con miel y frutas frescas',
        'Almuerzo': 'Ensalada de garbanzos con aguacate, tomate y huevo duro',
        'Cena': 'Pechuga de pollo al horno con vegetales asados',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Granos integrales'],
    forbiddenFoods: ['Azúcares refinados', 'Alimentos procesados', 'Grasas trans', 'Bebidas azucaradas'],
  ),
  Diet(
    name: "Alimentación para Cáncer de Pulmón",
    weeklyDiet: {
      'Lunes': {
        'Desayuno': 'Batido verde de espinacas, manzana verde y jengibre',
        'Almuerzo': 'Sándwich de pavo con aguacate y ensalada verde',
        'Cena': 'Salmón al horno con espárragos y quinoa',
      },
      'Martes': {
        'Desayuno': 'Avena con plátano y nueces',
        'Almuerzo': 'Ensalada de garbanzos con tomate, pepino y pimiento',
        'Cena': 'Pechuga de pollo a la plancha con verduras salteadas',
      },
      'Miércoles': {
        'Desayuno': 'Yogurt natural con granola sin azúcar añadido y frutas frescas',
        'Almuerzo': 'Wrap integral con salmón ahumado, aguacate y espinacas',
        'Cena': 'Ensalada de quinoa con pollo a la parrilla y vegetales',
      },
      'Jueves': {
        'Desayuno': 'Tostadas integrales con mantequilla de almendras y plátano',
        'Almuerzo': 'Ensalada verde con salmón ahumado y aguacate',
        'Cena': 'Pollo al curry con arroz integral',
      },
      'Viernes': {
        'Desayuno': 'Batido verde de espinacas, piña, mango y leche de coco',
        'Almuerzo': 'Ensalada de garbanzos con vegetales y atún en conserva',
        'Cena': 'Tortilla francesa de claras de huevo con espinacas y champiñones',
      },
      'Sábado': {
        'Desayuno': 'Tortitas de avena y plátano con frutas frescas y miel',
        'Almuerzo': 'Pechuga de pollo a la plancha con puré de boniato y espárragos al vapor',
        'Cena': 'Sopa de calabaza y zanahoria con trozos de pollo',
      },
      'Domingo': {
        'Desayuno': 'Huevos revueltos con espinacas y tomate',
        'Almuerzo': 'Ensalada de quinoa con vegetales, aguacate y huevo duro',
        'Cena': 'Pescado al horno con espárragos y patatas asadas',
      },
    },
    mandatoryFoods: ['Frutas frescas', 'Verduras verdes', 'Proteína magra', 'Granos integrales'],
    forbiddenFoods: ['Azúcares refinados', 'Alimentos procesados', 'Grasas trans', 'Bebidas azucaradas'],
  ),
];


class DietDetailPage extends StatelessWidget {
  final Diet diet;

  DietDetailPage({required this.diet});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(diet.name),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Dieta Semanal'),
              Tab(text: 'Alimentos Obligatorios'),
              Tab(text: 'Alimentos Prohibidos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WeeklyDietTab(weeklyDiet: diet.weeklyDiet),
            MandatoryFoodsTab(mandatoryFoods: diet.mandatoryFoods),
            ForbiddenFoodsTab(forbiddenFoods: diet.forbiddenFoods),
          ],
        ),
      ),
    );
  }
}

class WeeklyDietTab extends StatelessWidget {
  final Map<String, Map<String, String>> weeklyDiet;

  WeeklyDietTab({required this.weeklyDiet});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: weeklyDiet.entries.map((entry) {
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Desayuno: ${entry.value['Desayuno']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Almuerzo: ${entry.value['Almuerzo']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Cena: ${entry.value['Cena']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class MandatoryFoodsTab extends StatelessWidget {
  final List<String> mandatoryFoods;

  MandatoryFoodsTab({required this.mandatoryFoods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mandatoryFoods.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              mandatoryFoods[index],
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        );
      },
    );
  }
}

class ForbiddenFoodsTab extends StatelessWidget {
  final List<String> forbiddenFoods;

  ForbiddenFoodsTab({required this.forbiddenFoods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forbiddenFoods.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              forbiddenFoods[index],
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        );
      },
    );
  }
}
