import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/models/pergunta.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int indiceAtual = 0;
  int? indiceRespostaSelecionada;
  int contagemRegressiva = 0;
  Timer? _timer;

  void iniciarContagemRegressiva() {
    contagemRegressiva = 3;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        contagemRegressiva--;
        if (contagemRegressiva <= 0) {
          timer.cancel();
          _timer = null;
          indiceAtual = 0;
          indiceRespostaSelecionada = null;
        }
      });
    });
  }

  void responder(String resposta) {
    setState(() {
      indiceRespostaSelecionada = perguntas[indiceAtual].respostas.indexOf(
        resposta,
      );

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          indiceAtual++;
          indiceRespostaSelecionada = null;
        });
      });
    });
  }

  Color colorirBotao(int index) {
    if (indiceRespostaSelecionada == null) {
      return Colors.blue;
    } else if (indiceRespostaSelecionada == index) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  final List<Pergunta> perguntas = [
    Pergunta('Qual é a sua cor favorita?', ['Azul', 'Verde', 'Vermelho']),
    Pergunta('Qual é o seu animal favorito?', ['Cachorro', 'Gato', 'Pássaro']),
    Pergunta('Qual é o seu esporte favorito?', [
      'Futebol',
      'Natação',
      'Corrida',
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    if (indiceAtual >= perguntas.length && _timer == null) {
      iniciarContagemRegressiva();
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: Center(
          child: (indiceAtual >= perguntas.length) || contagemRegressiva > 0
              ? Text(
                  'Reiniciando em $contagemRegressiva...',
                  style: const TextStyle(fontSize: 24),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        perguntas[indiceAtual].texto,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: perguntas[indiceAtual].respostas
                            .map(
                              (resposta) => ElevatedButton(
                                onPressed: () => responder(resposta),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorirBotao(
                                    perguntas[indiceAtual].respostas.indexOf(
                                      resposta,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  resposta,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
