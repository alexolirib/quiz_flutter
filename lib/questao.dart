
import 'package:flutter/material.dart';

class  Questao extends StatelessWidget {

  final String texto;

  //construtor 
  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      //tamanho maximo 
      width: double.infinity,
      //colocar margem em todas as bordas
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }
}