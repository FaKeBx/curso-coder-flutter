import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

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
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()["respostas"]
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Questao(
                    _perguntas[_perguntaSelecionada]["texto"].toString(),
                  ),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Questao("QUESTIONÁRIO RESPONDIDO!!!")]),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
