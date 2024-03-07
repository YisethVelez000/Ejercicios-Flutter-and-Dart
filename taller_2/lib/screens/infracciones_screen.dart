import 'package:flutter/material.dart';

class InfraccionesScreen extends StatefulWidget {
  const InfraccionesScreen({super.key});

  @override
  State<InfraccionesScreen> createState() => _InfraccionesScreenState();
}

/*La screen infracciones deberá contar con un text en el que se permita ingresar y consultar el número de infracciones de un vehículo.
 Las infracciones se almacenan en un mapa que se compone de las claves placa y número de infracciones. */
class _InfraccionesScreenState extends State<InfraccionesScreen> {
  TextEditingController placaController = TextEditingController();
  Map<String, int> infracciones = {
    '123': 3,
    '456': 2,
    '789': 1,
  };
  void crearInfracciones() {
    // Si la placa ya existe, se le suma 1 al número de infracciones en el mapa de infracciones
    if (infracciones.containsKey(placaController.text)) {
      infracciones[placaController.text] =
          infracciones[placaController.text]! + 1;
    } else {
      infracciones[placaController.text] = 1;
    }

    //Mostrar un dialogo con el número de infracciones que tiene el vehículo
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Infracción creada'),
            content: Text(
                'El número de infracciones para la placa ${placaController.text} es: ${infracciones[placaController.text]}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              )
            ],
          );
        });
  }

  void consultarInfracciones() {
    int? numeroInfracciones = 0;
    if (infracciones.containsKey(placaController.text)) {
      numeroInfracciones = infracciones[placaController.text];
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Número de infracciones'),
            content: Text('El número de infracciones es: $numeroInfracciones'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infracciones de tránsito'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Text('Ingrese la placa del vehículo'),
          TextField(
            controller: placaController,
            keyboardType: TextInputType.number,
            maxLength: 3,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              consultarInfracciones();
            },
            child: const Text('Consultar infracciones'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              crearInfracciones();
            },
            child: const Text('Crear infraccion'),
          )
        ],
      ),
    );
  }
}
