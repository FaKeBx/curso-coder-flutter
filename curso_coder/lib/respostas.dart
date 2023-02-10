import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String textoResposta;
  final void Function() respostaSelecionada;

  Resposta(this.textoResposta, this.respostaSelecionada);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(80, 5, 80, 5),
      child: ElevatedButton(
        onPressed: respostaSelecionada,
        child: Text(textoResposta),
      ),
    );
  }
}
