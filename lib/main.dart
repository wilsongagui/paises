import 'package:app_paises/screens/colombia.dart';
import 'package:app_paises/screens/peru.dart';
import 'package:flutter/material.dart';
import 'screens/ecuador.dart'; // Importa tu archivo ecuador.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Países', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EcuadorScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: const Color.fromARGB(255, 253, 249, 3),
                ),
                child: const Center(
                  child: Text(
                    'ECUADOR',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          //CONTENIDO DE PAIS PERU
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PeruScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: const Color.fromARGB(255, 18, 6, 197),
                ),
                child: const Center(
                  child: Text(
                    'PERU',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          // CONTENIDO COLOMBIA
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColombiaScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: const Color.fromARGB(255, 236, 33, 33),
                ),
                child: const Center(
                  child: Text(
                    'CCOLOMBIA',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
