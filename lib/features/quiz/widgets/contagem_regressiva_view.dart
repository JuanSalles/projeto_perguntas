import 'package:flutter/material.dart';

class ContagemRegressivaView extends StatelessWidget {
  const ContagemRegressivaView({super.key, required this.segundos});

  final int segundos;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Reiniciando em $segundos...',
      style: const TextStyle(fontSize: 24),
    );
  }
}
