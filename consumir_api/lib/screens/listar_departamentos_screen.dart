import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//https://www.datos.gov.co/resource/vcjz-niiq.json
class Departamentos {
  // ignore: non_constant_identifier_names
  final String codigo_departamento;
  // ignore: non_constant_identifier_names
  final String nombre_departamento;

  Departamentos(
      // ignore: non_constant_identifier_names
      {required this.codigo_departamento,
      // ignore: non_constant_identifier_names
      required this.nombre_departamento});
  factory Departamentos.fromJson(Map<String, dynamic> json) {
    return Departamentos(
        codigo_departamento: json['codigo_departamento'],
        nombre_departamento: json['nombre_departamento']);
  }

//Incorporar Future para traer los datos del api
  Future<List<Departamentos>> fetchDepartamentos() async {
    final response = await http
        .get(Uri.parse('https://www.datos.gov.co/resource/vcjz-niiq.json'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((departamento) => Departamentos.fromJson(departamento))
          .toList();
    } else {
      throw Exception('Failed to load departamentos from API');
    }
  }
}

class ListarDepartamentosScreen extends StatefulWidget {
  const ListarDepartamentosScreen({super.key});

  @override
  State<ListarDepartamentosScreen> createState() =>
      _ListarDepartamentosScreenState();
}

class _ListarDepartamentosScreenState extends State<ListarDepartamentosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Departamentos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Departamentos>>(
        future: Departamentos(codigo_departamento: '', nombre_departamento: '')
            .fetchDepartamentos(),
        builder: (context, snapshot) {
          if (snapshot .hasData) {
            List<Departamentos>? departamentos = snapshot.data;
            return ListView(
              children: departamentos!
                  .map((departamento) => ListTile(
                        title: Text(departamento.nombre_departamento),
                        subtitle: Text(departamento.codigo_departamento),
                      ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
