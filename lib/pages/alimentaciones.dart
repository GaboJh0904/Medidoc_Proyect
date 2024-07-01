import 'package:flutter/material.dart';
import 'package:medidoc_proyect/pages/navBar.dart';
import 'package:medidoc_proyect/pages/DietaAlimentacion.dart';

class Alimentaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alimentaciones',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: AlimentacionesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AlimentacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alimentaciones',
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
      drawer: NavbarOptions(),
      backgroundColor: Color(0xFF6C62B6),  // Blueberry
      body: Container(
        color: Color.fromARGB(255, 192, 196, 199),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  _buildListItem('Pacientes', 'assets/images/alimentacion_1.jpg', onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Reanimacion()));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DietListPage(
                          dietCategory: 'Alimentaciones Personalizadas',
                          diets: personalizedDiets,
                        ),
                      ),
                    );
                  }),
                  _buildListItem('Gluten', 'assets/images/alimentacion_2.jpg', onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Torniquete()));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DietListPage(
                          dietCategory: 'Alimentaciones Gluten',
                          diets: glutenDiets,
                        ),
                      ),
                    );                  }),
                  _buildListItem('Alergias', 'assets/images/alimentacion_3.jpeg', onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Vendaje()));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DietListPage(
                          dietCategory: 'Alimentaciones Alergias',
                          diets: allergyDiets,
                        ),
                      ),
                    );
                  }),
                  _buildListItem('Cáncer', 'assets/images/alimentacion_4.jpg', onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Asma()));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DietListPage(
                          dietCategory: 'Alimentaciones Cáncer',
                          diets: cancerDiets,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, String imagePath, {required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: [
          // Imagen de fondo del botón
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
              ),
            ),
            height: 100.0,
          ),
          // Texto del botón
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}