import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrarScreen extends StatefulWidget {
  const RegistrarScreen({super.key});

  @override
  State<RegistrarScreen> createState() => _RegistrarScreenState();
}

//Realizamos la peticion a la API para registrar un usuario
//APi https://apiusuarios-s9ff.onrender.com/api/user/register
void registrarUsuario(usuario) async {
  var url =
      Uri.parse('https://apiusuarios-s9ff.onrender.com/api/user/register');
  var response = await http.post(url, body: usuario);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if (response.statusCode == 200) {
    print('Usuario registrado');
  } else {
    print('Error al registrar el usuario');
  }
}

//Definimos los controladores
TextEditingController nameUsuarioController = TextEditingController();
TextEditingController correoController = TextEditingController();
TextEditingController contrasenaController = TextEditingController();
TextEditingController confirmarContrasenaController = TextEditingController();
TextEditingController rolController = TextEditingController();

class _RegistrarScreenState extends State<RegistrarScreen> {
  var verContrasena = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar un usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameUsuarioController,
              decoration: const InputDecoration(
                labelText: 'name',
                hintText: 'Ingrese su name completo',
                prefix: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: correoController,
              decoration: const InputDecoration(
                prefix: Icon(Icons.email),
                labelText: 'Correo',
                hintText: 'Ingrese su correo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: verContrasena,
              controller: contrasenaController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingrese su contraseña',
                prefix: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                //Creamos una funcion para ver la contrasña si le damos click al icono
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: confirmarContrasenaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirmar contraseña',
                hintText: 'Confirme su contraseña',
                prefix: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: rolController,
              decoration: const InputDecoration(
                labelText: 'Rol',
                hintText: 'Ingrese su rol',
                prefix: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  //Aqui va el codigo para registrar el usuario
                  var usuario = {
                    "name": nameUsuarioController.text,
                    "email": correoController.text,
                    "password": contrasenaController.text,
                    "rol": rolController.text
                  };
                  registrarUsuario(usuario);
                },
                icon: const Icon(Icons.person_add_alt_1_rounded),
                label: const Text('Registrar'))
          ],
        ),
      ),
    );
  }
}
