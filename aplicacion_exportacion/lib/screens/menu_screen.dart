import 'package:aplicacion_exportacion/screens/listar_exportaciones_screen.dart';
import 'package:aplicacion_exportacion/screens/registrar_exportacion_screen.dart';
import 'package:flutter/material.dart';

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
          title: const Text('Menu Exportaciones'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Registrar Exportacion'),
              leading: const Icon(Icons.add_circle),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const RegistrarExportacionScreen());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              title: const Text('Listar Exportacion'),
              leading: const Icon(Icons.list),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const ListarExportacionesScreen());
                Navigator.push(context, route);
              },
            )
          ],
        ));
  }
}
