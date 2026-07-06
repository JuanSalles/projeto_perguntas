import 'package:flutter/material.dart';

import '../controllers/quiz_controller.dart';
import '../data/perguntas_repository.dart';
import '../widgets/contagem_regressiva_view.dart';
import '../widgets/pergunta_card.dart';
import '../widgets/respostas_list.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final QuizController _controller;

  @override
  void initState() {
    super.initState();
    _controller = QuizController(PerguntasRepository().buscarTodas());
    _controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() => setState(() {});

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perguntas')),
      body: Center(
        child: _controller.quizFinalizado
            ? ContagemRegressivaView(segundos: _controller.contagemRegressiva)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PerguntaCard(texto: _controller.perguntaAtual.texto),
                  const SizedBox(height: 24),
                  RespostasList(
                    respostas: _controller.perguntaAtual.respostas,
                    corDoBotao: _controller.corDoBotao,
                    onResponder: _controller.responder,
                  ),
                ],
              ),
      ),
    );
  }
}
