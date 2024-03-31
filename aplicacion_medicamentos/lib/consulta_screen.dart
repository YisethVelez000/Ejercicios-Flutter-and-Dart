import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultarScreen extends StatefulWidget {
  const ConsultarScreen({super.key});

  @override
  State<ConsultarScreen> createState() => _ConsultarScreenState();
}

class Medicamento {
  final String fechaAutorizacion;
  final String tipoSolicitud;
  final String solicitanteImportador;
  final String ium;
  final String principioActivo1;
  final String concentracionMedicamento1;
  final String principioActivo2;
  final String concentracionMedicamento2;
  final String unidadMedida2;
  final String formaFarmaceutica;
  final String nombreComercial;
  final String cantidadSolicitada;
  final String presentacionComercial;
  final String diagnosticoCie1NoReporta;
  final String codigoDiagnosticoCie10;

  Medicamento({
    required this.fechaAutorizacion,
    required this.tipoSolicitud,
    required this.solicitanteImportador,
    required this.ium,
    required this.principioActivo1,
    required this.concentracionMedicamento1,
    required this.principioActivo2,
    required this.concentracionMedicamento2,
    required this.unidadMedida2,
    required this.formaFarmaceutica,
    required this.nombreComercial,
    required this.cantidadSolicitada,
    required this.presentacionComercial,
    required this.diagnosticoCie1NoReporta,
    required this.codigoDiagnosticoCie10,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      fechaAutorizacion: json['fecha_de_autorizaci_n'],
      tipoSolicitud: json['tipo_de_solicitud'],
      solicitanteImportador: json['solicitante_importador'],
      ium: json['ium'],
      principioActivo1: json['principio_activo1'],
      concentracionMedicamento1: json['concentraci_n_delmedicamento1'],
      principioActivo2: json['principio_activo2'],
      concentracionMedicamento2: json['concentraci_n_del_medicamento2'],
      unidadMedida2: json['unidad_medida2'],
      formaFarmaceutica: json['forma_farmac_utica'],
      nombreComercial: json['nombre_comercial_'],
      cantidadSolicitada: json['cantidad_solicitada'],
      presentacionComercial: json['presentaci_n_comercial'],
      diagnosticoCie1NoReporta: json['diagnostico_cie_1no_reporta'],
      codigoDiagnosticoCie10: json['c_digo_diagnostico_cie_10'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fecha_de_autorizaci_n': fechaAutorizacion,
      'tipo_de_solicitud': tipoSolicitud,
      'solicitante_importador': solicitanteImportador,
      'ium': ium,
      'principio_activo1': principioActivo1,
      'concentraci_n_delmedicamento1': concentracionMedicamento1,
      'principio_activo2': principioActivo2,
      'concentraci_n_del_medicamento2': concentracionMedicamento2,
      'unidad_medida2': unidadMedida2,
      'forma_farmac_utica': formaFarmaceutica,
      'nombre_comercial_': nombreComercial,
      'cantidad_solicitada': cantidadSolicitada,
      'presentaci_n_comercial': presentacionComercial,
      'diagnostico_cie_1no_reporta': diagnosticoCie1NoReporta,
      'c_digo_diagnostico_cie_10': codigoDiagnosticoCie10,
    };
  }
}

class _ConsultarScreenState extends State<ConsultarScreen> {
  final TextEditingController _nombreComercialController =
      TextEditingController();
  bool cargando = false;
  String resultado = '';
Future<void> fetchMedicamentos(String nombreComercial) async {
  final response = await http.get(
    Uri.parse(
        'https://datos.gov.co/resource/sdmr-tfmf.json?nombre_comercial_=$nombreComercial'),
  );

  if (response.statusCode == 200) {
    cargando = false;

    final listaMedicamentos = jsonDecode(response.body) as List<dynamic>;

    if (listaMedicamentos.isEmpty) {
      resultado = 'No se encontraron medicamentos con ese nombre comercial.';
    } else {
      final medicamento = Medicamento.fromJson(listaMedicamentos[0]);
      var  cantidad = int.tryParse(medicamento.cantidadSolicitada);
      // Validar si el medicamento cuenta con escases
      if (cantidad! < 1000) {
        resultado = 'El medicamento $nombreComercial se encuentra escaso.';
      } else {
        resultado = 'El medicamento $nombreComercial no se encuentra escaso.';  
    }
  }
  } else {
    cargando = false;
    resultado = 'Error al consultar el medicamento.';
  }

  setState(() {});
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar medicamento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _nombreComercialController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Nombre comercial del medicamento',
                ),
              ),
            ),
           MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  cargando = true;
                });
                if (_nombreComercialController.text.isNotEmpty) {
                  fetchMedicamentos(_nombreComercialController.text);
                }
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.search),
                  Text('Consultar'),
                ],
              
              ),
            ),
            if (cargando)
              const CircularProgressIndicator()
            else
              Text(resultado),
          ],
        ),
      ),
    );
  }
}
