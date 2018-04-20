import "package:flutter/material.dart";

class ChatMessage extends StatelessWidget{
  final String _text;
  final String _name;
  final AnimationController animationController;

  ChatMessage(this._name,this._text, this.animationController);

  @override
  Widget build(BuildContext context){
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child:new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                child: new Icon(Icons.account_circle),
              ),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(this._name,
                    textDirection: TextDirection.ltr,
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 0.5),
                    child:
                    new Text(_text,
                      textDirection: TextDirection.ltr,
                    ),
                  )
                ],
              ),
            ) ,
          ],
        ),
      ),
    );
  }

}