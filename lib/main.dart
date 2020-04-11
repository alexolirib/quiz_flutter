import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './questao.dart';

//ṕorta de entrada é o main
main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaIndex=0;

  void _responder(){
    setState(() {
      _perguntaIndex++;
    });
    print(_perguntaIndex);
    print('Pergunta respondida');
  }
  //preciso implementar um metodo para build
  @override
  Widget build(BuildContext context){
    final perguntas = [
      "Qual é a sua cor favorita?",
      "Qual é o seu animal favorito?",
    ];
    return MaterialApp(
      // home: Text('Olá meu amor!!'),
      //Scaffold vai dar estrutura da aplicação
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        
        // body: Text('meu amor'),
        // body: Column(
        //   // children: <Widget>[],
        //   children: [
        //     Text('linha1'),
        //     Text('linha2'),
        //     Text('linha3'),
        //   ],
       //com ctrl + "." 
        body: Column(
          children:[
            // Text(perguntas[_perguntaIndex]),
            Questao(perguntas[_perguntaIndex]),
            RaisedButton(
              child: Text('Resposta1'),
              //aqui ta passando o metodo e não chamando
              onPressed: _responder
            ),
            RaisedButton(
              child: Text('Resposta2'),
              onPressed: _responder
              // onPressed: (){
              //   print('resposta2');
              // }
            ),
            RaisedButton(
              child: Text('Resposta3'),
              // onPressed: () =>print('resposta3')
              onPressed: _responder
            )
          ],
        ),
        
      ),
    );
  }
}

//nao altera o estado
class PerguntaApp extends StatefulWidget{

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
  

}