import 'package:flutter/material.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: (Colors.blueAccent),
      ),
      body: const Center(
        child: Text('Bienvenido a la aplicación'),
      ),
    );
  }
}
