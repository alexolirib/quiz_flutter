
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String text;

  Resposta(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(text),
        onPressed: null,
      ),
    );
  }
}