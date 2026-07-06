import 'package:flutter/material.dart';

class RespostasList extends StatelessWidget {
  const RespostasList({
    super.key,
    required this.respostas,
    required this.corDoBotao,
    required this.onResponder,
  });

  final List<String> respostas;
  final Color Function(int index) corDoBotao;
  final void Function(int index) onResponder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: respostas.asMap().entries.map((entry) {
          final index = entry.key;
          final resposta = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ElevatedButton(
              onPressed: () => onResponder(index),
              style: ElevatedButton.styleFrom(
                backgroundColor: corDoBotao(index),
              ),
              child: Text(
                resposta,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
