import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 15) {
      return "Nice!";
    } else if (pontuacao < 20) {
      return "Tu é bom bixo!!";
    } else if (pontuacao < 25) {
      return "Carai muleke é brabo!!!";
    } else {
      return "Another Level!!!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 32),
          ),
        ),
        TextButton(
            onPressed: quandoReiniciarQuestionario,
            child: const Text("Reiniciar 🔁")),
      ],
    );
  }
}
