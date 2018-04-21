import 'package:flutter/material.dart';
import "./answer_btn.dart";
import "./Question_area.dart";
class Game_Screen extends StatefulWidget{
  @override
  State createState() => new Game_Screen_State();
}

class Game_Screen_State extends State<Game_Screen>{

  bool teste = false;
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton("autista", null, Colors.white,true),
            new  QuestionArea("What is Lanhoso?"),

            new AnswerButton("autista x2",
                ()=>setState((){
                  if(this.teste)
                    this.teste=false;
                  else
                    this.teste=true;
                })
                , Colors.white,this.teste),

          ],
        )
      ],
    );
  }
}