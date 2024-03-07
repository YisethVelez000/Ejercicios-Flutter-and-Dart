import 'package:flutter/material.dart';

class ContadorScreen extends StatefulWidget {
  const ContadorScreen({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

int contadorClicks = 0;

class _ContadorScreenState extends State<ContadorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 164, 236),
        title: Text('Contador de Clicks: $contadorClicks'),
      ),
      body: const Center(
          child: Text('Número de clicks',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 200, 215, 221)))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        //Los botones flotantes se alinean a la derecha

        children: [
          FloatingActionButton(
              child: const Icon(Icons.add_circle_outline),
              onPressed: () {
                contadorClicks++;
                setState(() {
                  contadorClicks;
                });
              }),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: FloatingActionButton(
                child: const Icon(Icons.remove_circle_outline_sharp),
                onPressed: () {
                  contadorClicks--;
                  setState(() {
                    contadorClicks;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: FloatingActionButton(
                child: const Icon(Icons.restore_sharp),
                onPressed: () {
                  contadorClicks = 0;
                  setState(() {
                    contadorClicks;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
