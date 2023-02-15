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
      "respostas": ["SIM", "+ OU -", "NÃO", "🤮"],
    },
    {
      "texto": "Qual o nível que você está?",
      "respostas": ["BÁSICO", "INTERMEDIÁRIO", "AVANÇADO"],
    },
    {
      "texto": "Você prefere javaScript?",
      "respostas": ["SIM", "SIM", "SIM", "!NÃO"],
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
