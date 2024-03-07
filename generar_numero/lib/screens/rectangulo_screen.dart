import 'package:flutter/material.dart';

class RectanguloScreen extends StatefulWidget {
  const RectanguloScreen({super.key});

  @override
  State<RectanguloScreen> createState() => _RectanguloScreenState();
}

class _RectanguloScreenState extends State<RectanguloScreen> {
  //Definir controladores y variables para capturar valores de las cajas de texto
  TextEditingController largoController = TextEditingController();
  TextEditingController anchoController = TextEditingController();
  String resultadoArea = "";
  String resultadoPerimetro = "";

  //Creamos las funciones para definir area y perimetro
  void calcularArea() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double area = largo * ancho;
      setState(() {
        resultadoArea = "El area es : $area";
      });
    } catch (e) {
      setState(() {
        resultadoArea = "No se puedo calcular el área verifique";
      });
    }
  }

  void calcularPerimetro() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double perimetro = 2 * largo + 2 * ancho;
      setState(() {
        resultadoPerimetro = "El perimetro es : $perimetro";
      });
    } catch (e) {
      setState(() {
        resultadoPerimetro = "No se puede calcular el perimetro verifique ";
      });
    }
  }

  void calcularAreaYPerimetro() {
    calcularArea();
    calcularPerimetro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rectangulo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
            width: 400,
            height: 350,
            color: Colors.blue[400],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextField(
                    controller: largoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Largo',
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    maxLength: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextField(
                    controller: anchoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Ancho',
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    maxLength: 3,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: calcularArea,
                    child: const Text('Calcular área')),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: calcularPerimetro,
                    child: const Text('Calcular perimetro')),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: calcularAreaYPerimetro,
                    child: const Text('Calcular área y perimetro ')),
                const SizedBox(
                  height: 10,
                ),
                Text('$resultadoArea  $resultadoPerimetro')
              ],
            )),
      ),
    );
  }
}
