import '../models/pergunta.dart';

class PerguntasRepository {
  List<Pergunta> buscarTodas() => [
    Pergunta('Qual é a sua cor favorita?', ['Azul', 'Verde', 'Vermelho']),
    Pergunta('Qual é o seu animal favorito?', ['Cachorro', 'Gato', 'Pássaro']),
    Pergunta('Qual é o seu esporte favorito?', [
      'Futebol',
      'Natação',
      'Corrida',
    ]),
  ];
}
