import 'dart:convert';

import 'package:aplicacion_exportacion/screens/listar_exportaciones_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrarExportacionScreen extends StatefulWidget {
  const RegistrarExportacionScreen({super.key});

  @override
  State<RegistrarExportacionScreen> createState() =>
      _RegistrarExportacionScreenState();
}

String? ultimoValor;
// Link del api que vamos a consumir
// https://apiexportaciones.onrender.com/api/exportaciones
// Creamos los controladores para los campos de texto
TextEditingController productoController = TextEditingController();
TextEditingController kilosController = TextEditingController();
TextEditingController precioKiloController = TextEditingController();
TextEditingController precioActualDolarController = TextEditingController();

// Creamos el método para registrar la exportación
class _RegistrarExportacionScreenState
    extends State<RegistrarExportacionScreen> {
  void registrarExportacion(exportacion) async {
    var url = 'https://apiexportaciones.onrender.com/api/exportacion';
    var response = await http.post(url as Uri, body: exportacion);
    if (response.statusCode == 200) {
      // Mostramos una alerta de exportacion registrada con exito
      // Redirigimos a la pantalla de listar exportaciones para que se muestre la exportacion registrada con exito
      // ignore: unused_local_variable
      final route = MaterialPageRoute(
          builder: (context) => const ListarExportacionesScreen());
    } else {
      // Mostramos una alerta de error al registrar la exportacion
    }
  }

  void eliminarExportacion(id) async {
    var url =
        ('https://apiexportaciones.onrender.com/api/exportacion/$id' as Uri);
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      // Mostramos un dialogo de exportacion eliminada con exito
    } else {
      // Mostramos un dialogo de error al eliminar la exportacion
    }
  }

  //Creamos un metodo que nos traiga el valor del dolar actua solo el campo valor con index 0 y que se muestre en el campo de texto precioActualDolarController
  Future<String> obtenerDolar() async {
    var url = 'https://www.datos.gov.co/resource/mcec-87by.json';
    var response = await http.get(url as Uri);
    if (response.statusCode == 200) {
      var jsonResponse = response.body;

      var dolar = jsonResponse.split(',')[0];
      //Eliminamos el formato Json del dolar
      dolar = jsonEncode(jsonResponse);

      return jsonEncode(
          jsonResponse); // Se retorna el valor del dolar como String
    } else {
      throw Exception('Failed to load dolar');
    }
  }

  Future<http.Response> obtenerRespuestaAPI() async {
    var url = Uri.parse('https://www.datos.gov.co/resource/mcec-87by.json');
    return await http.get(url);
  }

  Future<String> obtenerUltimoValor() async {
    var response = await obtenerRespuestaAPI();
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // Extract the value of the "valor" field from the last element
      var ultimoValor = jsonResponse.last['valor'];
      return ultimoValor; // Return only the value as a String
    } else {
      throw Exception('Error al obtener el valor: ${response.statusCode}');
    }
  }

  String obtenerClaveValor(String json) {
    // No es necesario decodificar el json ya que se recibe como String
    return json;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Exportacion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Formulario de registro de exportacion',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: productoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre del producto',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: kilosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Peso del producto en kg',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: precioKiloController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Precio del kilo del producto en dolar',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: obtenerUltimoValor(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var precio =
                      snapshot.data; // Ya no se llama a obtenerClaveValor
                  return TextFormField(
                    readOnly: true,
                    initialValue: precio.toString(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Precio actual del dolar',
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                var exportacion = {
                  'producto': productoController.text,
                  'kilos': kilosController.text,
                  'precioKilo': precioKiloController.text,
                };
                registrarExportacion(exportacion);
                // Redirigimos a la pantalla de listar exportaciones para que se muestre la exportacion registrada
                final route = MaterialPageRoute(
                    builder: (context) => const ListarExportacionesScreen());
                // Creamos un set state para que se muestre la exportacion registrada
                Navigator.push(context, route);
                setState(() {});
              },
              child: const Text('Registrar exportacion'),
            ),
          ],
        ),
      ),
    );
  }
}
