import 'package:flutter/material.dart';

import '../../features/quiz/screens/quiz_screen.dart';
import '../models/mini_app.dart';

/// Registro central dos mini-apps disponíveis no menu principal.
///
/// Para adicionar um novo mini-app, basta incluir uma nova entrada aqui —
/// a HomeScreen renderiza essa lista automaticamente.
final List<MiniApp> miniApps = [
  MiniApp(
    titulo: 'Quiz de Perguntas',
    icone: Icons.quiz,
    construirTela: (context) => const QuizScreen(),
  ),
];
