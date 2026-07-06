import 'package:flutter/material.dart';

import 'core/screens/home_screen.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus Estudos',
      home: const HomeScreen(),
    );
  }
}
