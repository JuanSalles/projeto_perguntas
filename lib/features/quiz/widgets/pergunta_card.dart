import 'package:flutter/material.dart';

class PerguntaCard extends StatelessWidget {
  const PerguntaCard({super.key, required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(texto, style: const TextStyle(fontSize: 20)),
    );
  }
}
