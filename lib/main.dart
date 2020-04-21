import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './resultado.dart';
import './questionario.dart';

//ṕorta de entrada é o main
main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaIndex=0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
      {
        'Texto':"Qual é a sua cor favorita?",
        'Resposta': [
            {'texto':'Preto', 'pontuacao': 10},
            {'texto':'Vermelho', 'pontuacao': 7},
            {'texto':'Verde', 'pontuacao': 5},
            {'texto':'Branco', 'pontuacao': 3},
          ]
      },
      {
        'Texto':"Qual é o seu animal favorito?",
        'Resposta': [
          {'texto':'Maria', 'pontuacao': 10},
          {'texto':'João', 'pontuacao': 7},
          {'texto':'Elefante', 'pontuacao': 5},
          {'texto':'Leão', 'pontuacao': 3},
        ]
      },
      {
        'Texto':"Qual é o seu instrutor favorito?",
        'Resposta': [
          {'texto':'Alexandre', 'pontuacao': 10},
          {'texto':'Leo', 'pontuacao': 7},
          {'texto':'Jonas', 'pontuacao': 5},
          {'texto':'Matheus', 'pontuacao': 3},
        ]
      },

    ];

  void _responder(int pontuacao){
    if (temPerguntaSelecionada){
      setState(() {
        _perguntaIndex++;
        _pontuacaoTotal += pontuacao;
      });

    }
  }

  //fazer getter
  bool get temPerguntaSelecionada {
    return _perguntaIndex < _perguntas.length;
  }

  void _resetGame(){
    setState(() {
      _perguntaIndex = 0;
      _pontuacaoTotal = 0;
    });
  }

  //preciso implementar um metodo para build
  @override
  Widget build(BuildContext context){
    

    // var listResp = [];

    // for (var resp in perguntas[_perguntaIndex]['Resposta'] ){
    //   listResp.add(Resposta(resp, _responder));
    // }


    List resp = temPerguntaSelecionada 
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
        body: temPerguntaSelecionada ?
        //  Column(
        //   children:[
        //     // Text(perguntas[_perguntaIndex]),
        //     Questao(_perguntas[_perguntaIndex]['Texto']),
        //     // RaisedButton(
        //     //   child: Text('Resposta1'),
        //     //   //aqui ta passando o metodo e não chamando
        //     //   onPressed: _responder
        //     // ),

        //     // primeira forma de mandar varios valores
        //     // Resposta('Resposta1', _responder),
        //     // Resposta('Resposta2', _responder),
        //     // Resposta('Resposta3', _responder),
        //     // segunda forma 
        //     // ...listResp,
        //     //terceira forma. Utilizando Map
        //     ...resp.map((t)=>Resposta(t, _responder)).toList()
        //   ],
        // ) 
        Questionario(
          perguntas: _perguntas,
          perguntaIndex: _perguntaIndex,
          responder: _responder,
          temPerguntaSelecionada: temPerguntaSelecionada,
        )
        : 

        // Container(
        //   width: double.infinity,
        //   child: Center(
        //     child: Text(
        //       'Parabéns',
        //       //css
        //       style: TextStyle(
        //         fontSize: 28,
        //       ),
        //     ),
            
            
            
        //   )
        // ),
        Resultado(_pontuacaoTotal, _resetGame)
        
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