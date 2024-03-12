import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListarHurtosScreen extends StatefulWidget {
  const ListarHurtosScreen({super.key});

  @override
  State<ListarHurtosScreen> createState() => _ListarHurtosScreenState();
}

//Link api https://www.datos.gov.co/resource/9vha-vh9n.json?departamento=ANTIOQUIA
class Hurtos {
  final String departamento;
  final String municipio;
  // ignore: non_constant_identifier_names
  final String armas_medios;
  // ignore: non_constant_identifier_names
  final String fecha_hecho;
  final String genero;
  // ignore: non_constant_identifier_names
  final String grupo_etario;
  // ignore: non_constant_identifier_names
  final String tipo_de_hurto;
  final String cantidad;

  //Creamos el constructor
  Hurtos(
      // ignore: non_constant_identifier_names
      {required this.departamento,
      required this.municipio,
      // ignore: non_constant_identifier_names
      required this.armas_medios,
      // ignore: non_constant_identifier_names
      required this.fecha_hecho,
      required this.cantidad,
      required this.genero,
      // ignore: non_constant_identifier_names
      required this.grupo_etario,
      // ignore: non_constant_identifier_names
      required this.tipo_de_hurto});
  factory Hurtos.fromJson(Map<dynamic, dynamic> json) {
    return Hurtos(
        departamento: json['departamento'],
        municipio: json['municipio'],
        armas_medios: json['armas_medios'],
        fecha_hecho: json['fecha_hecho'],
        cantidad: json['cantidad'],
        genero: json['genero'],
        grupo_etario: json['grupo_etario'],
        tipo_de_hurto: json['tipo_de_hurto']);
  }

  //Realizamos el future a la   API para listar unicamente los hurtos con Armas de fuego
  Future<List<Hurtos>> fetchHurtos() async {
    final response = await http.get(Uri.parse(
        'https://www.datos.gov.co/resource/9vha-vh9n.json?departamento=ANTIOQUIA&armas_medios=ARMA%20DE%20FUEGO&municipio=MEDELL%C3%8DN%20(CT)'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((departamento) => Hurtos.fromJson(departamento))
          .toList();
    } else {
      throw Exception('Failed to load departamentos from API');
    }
  }
}

class _ListarHurtosScreenState extends State<ListarHurtosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hurtos'),
        ),
        body: FutureBuilder<List<Hurtos>>(
          future: Hurtos(
            departamento: '',
            municipio: '',
            armas_medios: '',
            fecha_hecho: '',
            cantidad: '',
            genero: '',
            grupo_etario: '',
            tipo_de_hurto: '',
          ).fetchHurtos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final departamento = snapshot.data![index];
                return ListTile(
                  title: Text(departamento.departamento),
                  subtitle: Text(
                    'Municipio: ${departamento.municipio}\n'
                    'Armas/Medios: ${departamento.armas_medios}\n'
                    'Fecha del hecho: ${departamento.fecha_hecho}\n'
                    'Cantidad: ${departamento.cantidad}\n'
                    'Género: ${departamento.genero}\n'
                    'Grupo etario: ${departamento.grupo_etario}\n'
                    'Tipo de hurto: ${departamento.tipo_de_hurto}',
                  ),
                );
              },
            );
          },
        ));
  }
}
