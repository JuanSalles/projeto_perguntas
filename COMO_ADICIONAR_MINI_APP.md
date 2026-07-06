# Como adicionar um novo mini-app

Este projeto é organizado como um "super app": uma tela de menu (`HomeScreen`) que
lista mini-apps independentes, cada um vivendo na sua própria pasta dentro de
`lib/features/`. Este guia mostra o passo a passo para adicionar um novo.

Vamos usar como exemplo um mini-app hipotético chamado **flashcards**.

## Passo 1 — Criar a pasta da feature

Dentro de `lib/features/`, crie uma pasta com o nome do novo mini-app. Use só as
subpastas que o mini-app realmente precisar (não crie pastas vazias "por
padrão"):

```
lib/features/flashcards/
  models/       <- classes de dados (ex: Flashcard)
  data/         <- repositório/fonte dos dados
  controllers/  <- estado e lógica (ChangeNotifier)
  screens/      <- telas
  widgets/      <- componentes de UI reutilizáveis dentro do mini-app
```

Essa é a mesma organização usada em `lib/features/quiz/` — mantenha o padrão
para todo mini-app novo, assim quem olhar o projeto reconhece a estrutura de
cara.

**Por quê pasta própria?** Cada mini-app é dono do seu próprio estado e dos
seus próprios widgets. Nada dentro de `features/flashcards/` deveria precisar
saber que `features/quiz/` existe — isso é o que permite adicionar e remover
mini-apps sem efeito colateral nos outros.

## Passo 2 — Criar a tela de entrada do mini-app

Crie o widget que vai ser a **primeira tela** do mini-app (a que abre quando o
usuário toca no card do menu). Ela deve funcionar de forma autocontida — só
importando coisas de dentro da própria pasta `features/flashcards/`.

```dart
// lib/features/flashcards/screens/flashcards_screen.dart
import 'package:flutter/material.dart';

class FlashcardsScreen extends StatelessWidget {
  const FlashcardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcards')),
      body: const Center(child: Text('Em construção')),
    );
  }
}
```

## Passo 3 — Registrar o mini-app no menu

Abra `lib/core/data/mini_apps.dart` e:

1. Importe a tela de entrada criada no passo 2.
2. Adicione uma nova entrada na lista `miniApps`, com título, ícone (qualquer
   um de `Icons.*`) e uma função que constrói a tela.

```dart
import 'package:flutter/material.dart';

import '../../features/quiz/screens/quiz_screen.dart';
import '../../features/flashcards/screens/flashcards_screen.dart'; // novo import
import '../models/mini_app.dart';

final List<MiniApp> miniApps = [
  MiniApp(
    titulo: 'Quiz de Perguntas',
    icone: Icons.quiz,
    construirTela: (context) => const QuizScreen(),
  ),
  MiniApp( // nova entrada
    titulo: 'Flashcards',
    icone: Icons.style,
    construirTela: (context) => const FlashcardsScreen(),
  ),
];
```

Não é preciso mexer em `HomeScreen` nem em `main.dart` — a tela de menu lê essa
lista automaticamente e o novo card aparece sozinho.

## Passo 4 — Conferir

```bash
fvm flutter analyze   # garante que não há erros de import/tipo
fvm flutter run        # abre o app e confirma visualmente o novo card no menu
```

Navegue até o novo mini-app pelo menu e volte com o botão de voltar — a
navegação de volta já funciona automaticamente, pois usamos `Navigator.push`
na `HomeScreen`.

## Checklist rápido

- [ ] Pasta criada em `lib/features/<nome_do_mini_app>/`
- [ ] Tela de entrada criada e funcionando de forma isolada
- [ ] Import + entrada adicionados em `lib/core/data/mini_apps.dart`
- [ ] `fvm flutter analyze` sem erros novos
- [ ] Testado manualmente no app (abrir pelo menu e voltar)
