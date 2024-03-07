import 'package:flutter/material.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  TextEditingController clienteController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController documentoController = TextEditingController();
  Map<String, dynamic> cliente = {};
  void crearCliente() {
    //Creamos un mapa donde la clave sea el nombre  el documento y los valores sean el nombre del cliente, la direccion y el telefono
    Map<String, dynamic> cliente = {
      'nombre': clienteController.text,
      'direccion': direccionController.text,
      'telefono': telefonoController.text,
      'documento': documentoController.text
    };

    //Mostramos un dialogo de cliente creado con exito
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cliente creado con exito'),
          content: Text(
              'Nombre: ${cliente['nombre']}\nDireccion: ${cliente['direccion']}\nTelefono: ${cliente['telefono']}\nDocumento: ${cliente['documento']}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clientes'),
          titleTextStyle: const TextStyle(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
          child: Column(
            children: [
              TextFormField(
                controller: clienteController,
                decoration: const InputDecoration(
                    labelText: 'Digitar nombre Cliente',
                    hintText: 'Nombre de cliente',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: direccionController,
                decoration: const InputDecoration(
                    labelText: 'Digite la direccion',
                    hintText: 'Direccion',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    prefixIcon: Icon(
                      Icons.home,
                      color: Colors.blue,
                    ),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: telefonoController,
                decoration: const InputDecoration(
                    labelText: 'Digite el telefono',
                    hintText: 'Telefono',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: documentoController,
                decoration: const InputDecoration(
                    labelText: 'Digite el documento',
                    hintText: 'Número documento',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    prefixIcon: Icon(
                      Icons.card_membership,
                      color: Colors.blue,
                    ),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),

              //Creamos los botones de iniciar sesion y registrarse
              ElevatedButton(
                onPressed: () {
                  crearCliente();
                },
                child: const Text('Crear Cliente'),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
