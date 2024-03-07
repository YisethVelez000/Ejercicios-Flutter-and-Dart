import 'package:flutter/material.dart';
import 'package:generar_numero/screens/array_screen.dart';
import 'package:generar_numero/screens/login_screen.dart';
import 'package:generar_numero/screens/mision_screen.dart';
import 'package:generar_numero/screens/productos_screen.dart';
import 'package:generar_numero/screens/rectangulo_screen.dart';

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
        title: const Text('FEARLESS'),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Home'),
            subtitle: Text(
              'Inicio de la aplicacion',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            title: const Text('Mision'),
            leading: const Icon(
              Icons.accessibility_new_rounded,
              color: Colors.blueAccent,
            ),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const MisionScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Productos'),
            leading: const Icon(
              Icons.shopping_cart,
              color: Colors.blueAccent,
            ),
            onTap: () {
              final route = MaterialPageRoute(
                  builder: (context) => const ProductosScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Array Screen'),
            leading: const Icon(
              Icons.list_alt_rounded,
              color: Colors.blueAccent,
            ),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const ArrayScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Area y perimetro del cuadrado'),
            leading: const Icon(
              Icons.crop_square,
              color: Colors.blueAccent,
            ),
            onTap: () {
              final route = MaterialPageRoute(
                  builder: (context) => const RectanguloScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Login'),
            subtitle: const Text('Acceso a la aplicacion'),
            leading: const Icon(
              Icons.login_outlined,
              color: Colors.blueAccent,
            ),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const LoginScreen());
              Navigator.push(context, route);
            },
          )
        ],
      ),
    );
  }
}
