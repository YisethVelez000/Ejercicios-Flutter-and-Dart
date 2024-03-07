import 'package:flutter/material.dart';

class MisionScreen extends StatefulWidget {
  const MisionScreen({super.key});

  @override
  State<MisionScreen> createState() => _MisionScreenState();
}

class _MisionScreenState extends State<MisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mision'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          color: Colors.amberAccent,
          height: 300.0,
          width: 400.0,
          child: const Center(
            child: Text(
              'Mision de la empresa',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
