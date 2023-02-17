import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
    {
      "texto": "Você está aprendendo flutter?",
      "respostas": [
        {"texto": "SIM", "pontuacao": 10},
        {"texto": "+ OU  -", "pontuacao": 7},
        {"texto": "NÃO", "pontuacao": 5},
        {"texto": "🤮", "pontuacao": 0},
      ],
    },
    {
      "texto": "Qual o nível que você está?",
      "respostas": [
        {"texto": "BÁSICO", "pontuacao": 4},
        {"texto": "INTERMEDIÁRIO", "pontuacao": 7},
        {"texto": "AVANÇADO", "pontuacao": 10},
      ],
    },
    {
      "texto": "Você prefere JavaScript?",
      "respostas": [
        {"texto": "SIM", "pontuacao": 10},
        {"texto": "SIM", "pontuacao": 10},
        {"texto": "SIM", "pontuacao": 10},
        {"texto": "!NÃO", "pontuacao": 10},
      ],
    },
  ];

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
