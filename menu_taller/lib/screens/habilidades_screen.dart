import 'package:flutter/material.dart';

class HabilidadesScreen extends StatefulWidget {
  const HabilidadesScreen({super.key});

  @override
  State<HabilidadesScreen> createState() => _HabilidadesScreenState();
}

class _HabilidadesScreenState extends State<HabilidadesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habilidades'),
      ),
      body: const Center(
        child: Text(
      
          'Java\nPython\nDart\nFlutter\nHTML\nCSS\nJavaScript\nSQL\nGit\nGitHub\nFirebase\nEAFIT NODO',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
