import 'package:flutter/material.dart';
import "../Util/GoogleSignIn.dart";


class AnswerButton extends StatelessWidget{

  final String _answer;
  final Color _color;
  final VoidCallback _onTap;
  final bool _otherPlayerAnswer;


  AnswerButton(this._answer,this._onTap,this._color, this._otherPlayerAnswer);

  @override
  Widget build(BuildContext context) {
    return new Expanded(//true button
      child: new Material(
        color: this._color,
        child: new InkWell(
          onTap: ()=> _onTap(),
          child: new Column(
            children: <Widget>[

              (this._otherPlayerAnswer==false) ?
                  new Container( width: 80.0,height: 80.0,) :
                  new Container(
                      margin: new EdgeInsets.all(25.0),
                      child:  new ClipOval(
                        child: new Image.network(googleSignIn.currentUser.photoUrl,
                          fit: BoxFit.cover,
                          width: 30.0,
                          height: 30.0,),
                      ),
                    width: 30.0,
                    height: 30.0,
              ),


              new Center(
                    child: new Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(
                        color: Colors.deepOrangeAccent,
                           width: 3.0
            )
          ),
        padding: new EdgeInsets.all(20.0),
        child: new Text(
          _answer,
          style:new TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      )
    ),
            ],
          ),
        ),
      ),
    );
  }
}