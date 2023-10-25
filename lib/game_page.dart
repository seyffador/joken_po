import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var _imageApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";


  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes= [ "pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp= opcoes[numero];
    print("opção app: " + escolhaApp);
    print("opção usuario: " + escolhaUsuario);
    switch(escolhaApp){
      case"pedra":
        setState(() {
          this._imageApp=AssetImage("images/pedra.png");
        });
        break;
      case"papel":
        setState(() {
          this._imageApp=AssetImage("images/papel.png");
        });
        break;
      case"tesoura":
        setState(() {
          this._imageApp=AssetImage("images/tesoura.png");
        });
        break;
    }
    if(
    (escolhaUsuario=="pedra"&& escolhaApp =="tesoura")||
        (escolhaUsuario=="papel"&& escolhaApp =="pedra")||
        (escolhaUsuario=="tesoura"&& escolhaApp =="papel")
    )
    {
      setState(() {
        this._mensagem = "vc ganhou";
      });
    }    else if(
    (escolhaApp=="pedra"&&escolhaUsuario =="tesoura")||
        (escolhaApp=="papel"&& escolhaUsuario =="pedra")||
        (escolhaApp=="tesoura"&& escolhaUsuario =="papel")
    ){
      setState(() {
        this._mensagem = "vc perdeu";
      });
    }else{
      setState(() {
        this._mensagem = "empatamos";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo(tesoura, papel e pedra)"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Escolha do app",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(image: this._imageApp),
          Text(
            this._mensagem,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel") ,
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap:()=> _opcaoSelecionada("pedra") ,
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap:()=> _opcaoSelecionada("tesoura") ,
                child:Image.asset("images/tesoura.png", height: 100,) ,
              )
            ],
          ),
        ],
      ),
    );
  }
}
