import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';


class Questionario extends StatelessWidget {

  final List perguntas;
  final int perguntaIndex; 
  final Function(int) responder;
  final bool temPerguntaSelecionada;

  Questionario({
    @required this.perguntas,
    @required this.perguntaIndex,
    @required this.responder,
    @required this.temPerguntaSelecionada
  });

  @override
  Widget build(BuildContext context) {

    List resp = temPerguntaSelecionada
      ? perguntas[perguntaIndex]['Resposta'] : null;

    return Container(
      
      child: Column(
        children: [
          Questao(perguntas[perguntaIndex]['Texto']),
          ...resp.map((res){
            return Resposta(
              res['texto'], () {
                 responder(res['pontuacao']);
              }
            );
            
            }).toList()
        ],
      )
      
    );
  }
}