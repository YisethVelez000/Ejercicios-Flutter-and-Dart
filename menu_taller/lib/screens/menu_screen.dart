import 'package:flutter/material.dart';
import 'package:menu_taller/screens/datos_personales_screen.dart';
import 'package:menu_taller/screens/estudios_screen.dart';
import 'package:menu_taller/screens/habilidades_screen.dart';

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
          title: const Text('Hoja de vida'),
          backgroundColor: (Colors.blueAccent),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Datos personales'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const DatosPersonalesScreen());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Formación académica'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const EstudiosScreen());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_outline_outlined),
              title: const Text('Habilidades'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: (context) => const HabilidadesScreen());
                Navigator.push(context, route);
              },
            )
          ],
        ));
  }
}
