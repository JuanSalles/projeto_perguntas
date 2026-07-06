import 'package:flutter/material.dart';

/// Representa uma entrada no menu principal: um mini-app que pode ser
/// aberto a partir da tela inicial.
class MiniApp {
  const MiniApp({
    required this.titulo,
    required this.icone,
    required this.construirTela,
  });

  final String titulo;
  final IconData icone;
  final WidgetBuilder construirTela;
}
