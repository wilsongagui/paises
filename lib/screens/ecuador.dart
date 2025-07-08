import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EcuadorScreen extends StatefulWidget {
  const EcuadorScreen({super.key});

  @override
  State<EcuadorScreen> createState() => _EcuadorScreenState();
}

class _EcuadorScreenState extends State<EcuadorScreen> {
  String linkBandera = "";
  String linkEscudo = "";

  Future<void> getData() async {
    final url = Uri.parse("https://restcountries.com/v3.1/name/ecuador");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var flag = data[0]['flags']['png']; // ✅ link bandera
      var escudo = data[0]['coatOfArms']['png']; // ✅ link escudo

      print("Bandera: $flag");
      print("Escudo: $escudo");

      setState(() {
        linkBandera = flag;
        linkEscudo = escudo;
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    getData(); // Llama a la API y carga ambos links
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecuador'),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Bandera de Ecuador',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              linkBandera.isNotEmpty
                  ? Image.network(linkBandera, width: 300)
                  : const CircularProgressIndicator(),

              const SizedBox(height: 30),
              const Text(
                'Escudo de Ecuador',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              linkEscudo.isNotEmpty
                  ? Image.network(linkEscudo, width: 300)
                  : const CircularProgressIndicator(),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Volver'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
