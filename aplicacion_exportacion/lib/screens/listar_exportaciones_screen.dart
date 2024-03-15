import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListarExportacionesScreen extends StatefulWidget {
  const ListarExportacionesScreen({super.key});

  @override
  State<ListarExportacionesScreen> createState() =>
      _ListarExportacionesScreenState();
}

//Link del api que vamos a consumir
//https://apiexportaciones.onrender.com/api/exportaciones
//API LIZ https://apidolarflutter.onrender.com/exportacion
TextEditingController productoController = TextEditingController();
TextEditingController kilosController = TextEditingController();
TextEditingController precioKiloController = TextEditingController();

class ExportacionesEditar {
  final String producto;
  final double kilos;
  final double precioKilo;
  ExportacionesEditar({
    required this.producto,
    required this.kilos,
    required this.precioKilo,
  });

  factory ExportacionesEditar.fromJson(Map<String, dynamic> json) {
    return ExportacionesEditar(
      producto: json['producto'],
      kilos: json['kilos'],
      precioKilo: json['precioKilo'],
    );
  }
  Future<List<Exportaciones>> fetchExportaciones() async {
    final response = await http.get(
        Uri.parse('https://apiexportaciones.onrender.com/api/exportacion'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((exportacion) => Exportaciones.fromJson(exportacion))
          .toList();
    } else {
      throw Exception('Failed to load exportaciones from API');
    }
  }
}

class Exportaciones {
  final String id;
  final String producto;
  final double kilos;
  final double precioKilo;
  final double precioActualDolar;

  //Constructor
  Exportaciones(
    this.id, {
    required this.producto,
    required this.kilos,
    required this.precioKilo,
    required this.precioActualDolar,
  });
  factory Exportaciones.fromJson(Map<String, dynamic> json) {
    return Exportaciones(
      json['_id'],
      producto: json['producto'],
      kilos: json['kilos'],
      precioKilo: json['precioKilo'],
      precioActualDolar: json['precioActualDolar'],
    );
  }

  //Realizamos el future a la API para listar las exportaciones
  Future<List<Exportaciones>> fetchExportaciones() async {
    final response = await http.get(
        Uri.parse('https://apiexportaciones.onrender.com/api/exportacion'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((exportacion) => Exportaciones.fromJson(exportacion))
          .toList();
    } else {
      throw Exception('Failed to load exportaciones from API');
    }
  }

  Future<void> eliminarExportacion(String id) async {
    final response = await http.delete(
        Uri.parse('https://apiexportaciones.onrender.com/api/exportacion/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete exportacion');
    }
  }
}

class _ListarExportacionesScreenState extends State<ListarExportacionesScreen> {
  //Creamos el método para editar la exportación
  Future<Exportaciones> fetchExportacionById(String id) async {
    final response = await http.get(
      Uri.parse('https://apiexportaciones.onrender.com/api/exportacion/$id'),
    );
    if (response.statusCode == 200) {
      return Exportaciones.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch exportacion');
    }
  }

  Future<void> editarExportacion(String id, exportacionEditada) async {
    var url =
        Uri.parse('https://apiexportaciones.onrender.com/api/exportacion/$id');

    var response = await http.put(url, body: exportacionEditada);
    if (response.statusCode != 200) {
      print(id);
      print(exportacionEditada);
      print('error nya ${response.statusCode}');
      throw Exception('Failde to put exportacion');
    } else {
      print('exitos mi tilin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listar Exportaciones'),
        ),
        body: FutureBuilder<List<Exportaciones>>(
          future: Exportaciones('',
                  producto: '', kilos: 0, precioKilo: 0, precioActualDolar: 0)
              .fetchExportaciones(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error} nya');
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final exportaciones = snapshot.data!;

            return ListView.builder(
              itemCount: exportaciones.length,
              itemBuilder: (context, index) {
                final exportacion = exportaciones[index];
                return Card(
                  child: ListTile(
                      title: Text('Producto: ${exportacion.producto}'),
                      subtitle: Text('Kilos: ${exportacion.kilos}\n'
                          'Precio por Kilo: ${exportacion.precioKilo}\n'
                          'Precio Total: ${(exportacion.kilos * exportacion.precioKilo)}\n'
                          'Precio Actual del Dolar: ${exportacion.precioActualDolar}\n'),
                      //Agregar el boton de eliminar y editar
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              final id = exportacion.id;
                              final producto = exportacion.producto;
                              final kilos = exportacion.kilos;
                              final precioKilo = exportacion.precioKilo;
                              //Mostrar dialogo
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Editar exportación'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: productoController,
                                              decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText: producto),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            TextField(
                                              controller: kilosController,
                                              decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText: '$kilos'),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            TextField(
                                              controller: precioKiloController,
                                              decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText:
                                                      'Precio por kilo $precioKilo'),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            )
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Cancelar')),
                                          TextButton(
                                              onPressed: () async {
                                                var exportacionEditada = {
                                                  'producto':
                                                      productoController.text,
                                                  'kilos': kilosController.text,
                                                  'precioKilo':
                                                      precioKiloController.text,
                                                };
                                                editarExportacion(
                                                    id, exportacionEditada);
                                                setState(() {});
                                                // ignore: use_build_context_synchronously
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Exportación editada correctamente')));
                                                //Recargar la vista de listado
                                                setState(() {});
                                                // ignore: use_build_context_synchronously
                                                Navigator.pop(context);
                                              },
                                              child:
                                                  const Text('Guardar Cambios'))
                                        ],
                                      ));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              final id = exportacion.id;
                              final producto = exportacion.producto;
                              //Mostrar un diálogo de confirmación
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Eliminar Exportación'),
                                  content: Text(
                                      '¿Está seguro de eliminar la exportación con el Produco $producto?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        //Eliminar la exportación
                                        await Exportaciones('',
                                                producto: '',
                                                kilos: 0,
                                                precioKilo: 0,
                                                precioActualDolar: 1)
                                            .eliminarExportacion(id);
                                        //Mostrar mensaje de éxito
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Exportación eliminada correctamente')));
                                        //Recargar la vista de listado
                                        setState(() {});
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Eliminar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                );
              },
            );
          },
        ));
  }
}
