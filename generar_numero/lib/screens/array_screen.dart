import 'package:flutter/material.dart';

class ArrayScreen extends StatefulWidget {
  const ArrayScreen({super.key});

  @override
  State<ArrayScreen> createState() => _ArrayScreenState();
}

//Generamos un array
final List<String> aprendices = [
  'Andrea',
  'Winter',
  'Jhon',
  'Karina',
  'Luis',
  'Jorge',
  'Jhonatan'
];
int numeroAprendiz = 0;

class _ArrayScreenState extends State<ArrayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Array Screen'),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: aprendices.length, //La cantidad de elementos
          itemBuilder: (context, index) {
            numeroAprendiz++;
            return ListTile(
              title: Text(aprendices[index]),
              subtitle: Text('Aprendiz $numeroAprendiz'),
              leading: const Icon(
                Icons.person_outline_outlined,
                size: 25,
                color: Colors.blueAccent,
              ),
            );
          }, 
        ));
  }
}
