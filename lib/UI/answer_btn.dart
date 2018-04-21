import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget{

  final String _answer;
  final Color _color;
  final VoidCallback _onTap;

  AnswerButton(this._answer,this._onTap,this._color);

  @override
  Widget build(BuildContext context) {
    return new Expanded(//true button
      child: new Material(
        color: this._color,
        child: new InkWell(
          onTap: ()=> _onTap(),
          child: new Center(
              child: new Container(

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
        ),
      ),
    );
  }
}