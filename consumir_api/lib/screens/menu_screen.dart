import 'package:consumir_api/screens/listar_departamentos_screen.dart';
import 'package:consumir_api/screens/listar_hurtos_screen.dart';
import 'package:consumir_api/screens/registrar_screen.dart';
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
          title: const Text('Consumir Apis'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Departamentos'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const ListarDepartamentosScreen());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              title: const Text('Hurtos'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const ListarHurtosScreen());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              title: const Text('Registrar'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const RegistrarScreen());
                Navigator.push(context, route);
              },
            )
          ],
        ));
  }
}
