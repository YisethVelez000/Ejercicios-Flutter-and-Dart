import 'package:flutter/material.dart';

class DatosPersonalesScreen extends StatefulWidget {
  const DatosPersonalesScreen({super.key});

  @override
  State<DatosPersonalesScreen> createState() => _DatosPersonalesScreenState();
}

class _DatosPersonalesScreenState extends State<DatosPersonalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Datos personales'),
        ),
        body: const Center(
          child:  Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/R.7431677e0271aec51d0abadfe94596b1?rik=pQvhPcb6tkYMnw&pid=ImgRaw&r=0'),
                radius: 70,
              ),
              ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text('Email : yisethvelez07@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.home_filled),
                title: Text('Dirección : Calle 89 Carrera54B13'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Número de telefono : 3006845249'),
              ),
              ListTile(
                leading: Icon(Icons.cake_outlined),
                title: Text('Fecha Nacimiento : 03/02/2005'),
              )
            ],
          ),
        ));
  }
}
