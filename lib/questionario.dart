import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';


class Questionario extends StatelessWidget {

  final List perguntas;
  final int perguntaIndex; 
  final Function responder;
  final bool temPerguntaSelecionada;

  Questionario({
    this.perguntas,
    this.perguntaIndex,
    this.responder,
    this.temPerguntaSelecionada
  });

  @override
  Widget build(BuildContext context) {

    List resp = temPerguntaSelecionada
      ? perguntas[perguntaIndex]['Resposta'] : null;

    return Container(
      
      child: Column(
        children: [
          Questao(perguntas[perguntaIndex]['Texto']),
          ...resp.map((t)=>Resposta(t, responder)).toList()
        ],
      )
      
    );
  }
}