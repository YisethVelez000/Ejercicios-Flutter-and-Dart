import 'package:flutter/material.dart';

class PicoYPlacaScreen extends StatefulWidget {
  const PicoYPlacaScreen({super.key});

  @override
  State<PicoYPlacaScreen> createState() => _PicoYPlacaScreenState();
}

/* En el pico y placa deberá contar con un screen que permita consultar el día de pico y placa sabiendo que:

Si la placa termina en 0, 1 el día de pico y placa es lunes.

Si la placa termina en 2 ó 3 el día de pico y placa es martes.

Si la placa termina en 4 ó 5el día de pico y placa es miércoles.

Si la placa termina en 6 ó 7 el día de pico y placa es jueves.

Si la placa termina en 8 ó 9 el día de pico y placa es viernes. */
class _PicoYPlacaScreenState extends State<PicoYPlacaScreen> {
  TextEditingController picoYPlacaController = TextEditingController();
  void consultarPicoYPlaca() {
    int? ultimoDigitoPlaca;
    for (int i = 0; i < picoYPlacaController.text.length; i++) {
      ultimoDigitoPlaca = int.parse(picoYPlacaController.text[i]);
    }
    String dia = '';
    if (ultimoDigitoPlaca == 0 || ultimoDigitoPlaca == 1) {
      dia = 'Lunes';
    } else if (ultimoDigitoPlaca == 2 || ultimoDigitoPlaca == 3) {
      dia = 'Martes';
    } else if (ultimoDigitoPlaca == 4 || ultimoDigitoPlaca == 5) {
      dia = 'Miércoles';
    } else if (ultimoDigitoPlaca == 6 || ultimoDigitoPlaca == 7) {
      dia = 'Jueves';
    } else if (ultimoDigitoPlaca == 8 || ultimoDigitoPlaca == 9) {
      dia = 'Viernes';
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Día de pico y placa'),
            content: Text('El día de pico y placa es: $dia'),
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
        title: const Text('Pico y placa'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Text('Ingrese la placa'),
          TextField(
            controller: picoYPlacaController,
            keyboardType: TextInputType.number,
            maxLength: 3,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              consultarPicoYPlaca();
            },
            child: const Text('Consultar'),
          )
        ],
      ),
    );
  }
}
 