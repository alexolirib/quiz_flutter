
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String text;
  final void Function() onSelect;

  Resposta(this.text, this.onSelect);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      //alargar o botao
      width: double.infinity,
      child: RaisedButton(
        textColor : Colors.white,
        color: Colors.blue,
        child: Text(text),
        //para habilitar o botao precis apassar um metodo
        onPressed: onSelect,
      ),
    );
  }
}