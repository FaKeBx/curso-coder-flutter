import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  final perguntas = [
    {
      "texto": "Você está aprendendo flutter?",
      "respostas": ["SIM", "+ OU -", "NÃO", "🤮"],
    },
    {
      "texto": "Você está aprendendo java?",
      "respostas": ["SIM", "+ OU -", "NÃO", "🤮"],
    },
    {
      "texto": "Você está aprendendo javaScript?",
      "respostas": ["SIM", "+ OU -", "NÃO", "🤮"],
    },
  ];
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      if (_perguntaSelecionada < perguntas.length - 1) {
        _perguntaSelecionada++;
      } else {
        _perguntaSelecionada = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()["respostas"];
    List<Widget> widgets = [];

    for (var textoResposta in respostas) {
      widgets.add(Resposta(textoResposta, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Questao(
              perguntas[_perguntaSelecionada]["texto"].toString(),
            ),
            ...widgets,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
