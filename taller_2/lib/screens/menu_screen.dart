import 'package:flutter/material.dart';
import 'package:taller_2/screens/infracciones_screen.dart';
import 'package:taller_2/screens/pico_placa_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Pico y placa'),
              textColor: Colors.blue,
              leading: const Icon(Icons.car_rental),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const PicoYPlacaScreen());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              title: const Text('Infraciones de tránsito'),
              leading: const Icon(Icons.car_rental),
              textColor: Colors.blue,
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const InfraccionesScreen());
                Navigator.push(context, route);
              },
            ),
          ],
        ));
  }
}
