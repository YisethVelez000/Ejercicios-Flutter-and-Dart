import 'package:flutter/material.dart';

class OlvideContrasenaScreen extends StatefulWidget {
  const OlvideContrasenaScreen({super.key});

  @override
  State<OlvideContrasenaScreen> createState() => _OlvideContrasenaScreenState();
}

class _OlvideContrasenaScreenState extends State<OlvideContrasenaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creamos una barra de navegación
      appBar: AppBar(
        title: const Text('Olvidé mi contraseña'),
        backgroundColor: (Colors.blueAccent),
      ),
      //Creamos un cuerpo con un texto
      body: Center(
        //Creamos el formulario para cambiar contraseña
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Ingresa tu correo electrónico para recuperar tu contraseña',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            //Creamos un campo de texto para ingresar el correo
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Creamos un botón para enviar el correo
            ElevatedButton(
              onPressed: () {},
              child: const Text('Enviar correo'),
            ),
          ],
        ),
      ),
    );
  }
}
