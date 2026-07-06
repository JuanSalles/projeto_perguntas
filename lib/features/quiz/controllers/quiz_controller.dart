import 'dart:async';

import 'package:flutter/material.dart';

import '../models/pergunta.dart';

class QuizController extends ChangeNotifier {
  static const _duracaoTransicao = Duration(seconds: 1);
  static const _intervaloContagem = Duration(seconds: 1);
  static const _duracaoContagemRegressiva = 3;

  QuizController(this.perguntas);

  final List<Pergunta> perguntas;

  int indiceAtual = 0;
  int? indiceRespostaSelecionada;
  int contagemRegressiva = 0;
  Timer? _timer;

  bool get quizFinalizado => indiceAtual >= perguntas.length;

  Pergunta get perguntaAtual => perguntas[indiceAtual];

  Color corDoBotao(int index) {
    if (indiceRespostaSelecionada == null) {
      return Colors.blue;
    } else if (indiceRespostaSelecionada == index) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  void responder(int indiceResposta) {
    indiceRespostaSelecionada = indiceResposta;
    notifyListeners();

    Future.delayed(_duracaoTransicao, () {
      indiceAtual++;
      indiceRespostaSelecionada = null;
      if (quizFinalizado) {
        _iniciarContagemRegressiva();
      }
      notifyListeners();
    });
  }

  void _iniciarContagemRegressiva() {
    if (_timer != null) return;
    contagemRegressiva = _duracaoContagemRegressiva;
    _timer = Timer.periodic(_intervaloContagem, (timer) {
      contagemRegressiva--;
      if (contagemRegressiva <= 0) {
        timer.cancel();
        _timer = null;
        indiceAtual = 0;
        indiceRespostaSelecionada = null;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
