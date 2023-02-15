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
        {"texto": "SIM", "nota": 10},
        {"texto": "+ OU  -", "nota": 7},
        {"texto": "NÃO", "nota": 5},
        {"texto": "🤮", "nota": 0},
      ],
    },
    {
      "texto": "Qual o nível que você está?",
      "respostas": [
        {"texto": "BÁSICO", "nota": 10},
        {"texto": "INTERMEDIÁRIO", "nota": 5},
        {"texto": "AVANÇADO", "nota": 0},
      ],
    },
    {
      "texto": "Você prefere javaScript?",
      "respostas": [
        {"texto": "SIM", "nota": 10},
        {"texto": "SIM", "nota": 7},
        {"texto": "SIM", "nota": 5},
        {"texto": "!NÃO", "nota": 0},
      ],
    },
  ];

  var _perguntaSelecionada = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
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
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
