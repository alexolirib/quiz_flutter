import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './questao.dart';
import './resposta.dart';

//ṕorta de entrada é o main
main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaIndex=0;
  final _perguntas = const [
      {
        'Texto':"Qual é a sua cor favorita?",
        'Resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'Texto':"Qual é o seu animal favorito?",
        'Resposta': ['Maria', 'João', 'Elefante', 'Leão']
      },
      {
        'Texto':"Qual é o seu instrutor favorito?",
        'Resposta': ['Alexandre', 'Leo', 'Jonas', 'Matheus']
      },

    ];

  void _responder(){
    if (temPerguntaSelecionada){
      setState(() {
        _perguntaIndex++;
      });
    }
    print('Pergunta respondida');
  }

  //fazer getter
  bool get temPerguntaSelecionada {
    return _perguntaIndex < _perguntas.length;
  }

  //preciso implementar um metodo para build
  @override
  Widget build(BuildContext context){
    

    // var listResp = [];

    // for (var resp in perguntas[_perguntaIndex]['Resposta'] ){
    //   listResp.add(Resposta(resp, _responder));
    // }


    List<String> resp = temPerguntaSelecionada 
      ? _perguntas[_perguntaIndex]['Resposta'] : null;
    // List<Widget> mapResp = resp
    //   .map((t)   => Resposta(t, _responder))
    //   .toList();


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
        body: temPerguntaSelecionada ? Column(
          children:[
            // Text(perguntas[_perguntaIndex]),
            Questao(_perguntas[_perguntaIndex]['Texto']),
            // RaisedButton(
            //   child: Text('Resposta1'),
            //   //aqui ta passando o metodo e não chamando
            //   onPressed: _responder
            // ),

            // primeira forma de mandar varios valores
            // Resposta('Resposta1', _responder),
            // Resposta('Resposta2', _responder),
            // Resposta('Resposta3', _responder),
            // segunda forma 
            // ...listResp,
            //terceira forma. Utilizando Map
            ...resp.map((t)=>Resposta(t, _responder)).toList()
          ],
        ) : null,
        
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