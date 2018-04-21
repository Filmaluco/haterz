import 'package:flutter/material.dart';
import 'dart:async';
class QuestionArea extends StatefulWidget{
  final String _question;

  QuestionArea(this._question);

  @override
  State createState() => new QuestionTextState();
}


class QuestionTextState extends State<QuestionArea> with SingleTickerProviderStateMixin {






  @override
  Widget build(BuildContext context){
    return new Container(
        decoration: new BoxDecoration(
          border: new Border(
            top: new BorderSide(width: 3.0,color: Colors.deepOrangeAccent),
            bottom: new BorderSide(width: 3.0,color: Colors.deepOrangeAccent)
          )
        ),
        child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              new Container(
                child:new IconButton(
                    icon: new Icon(Icons.star,size: 30.0, color: Colors.amber,),
                    onPressed: null
                ),
                  
              ),
              
             new Flexible(
              child: new Center(

                  child:  new Text(
                    widget._question,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,

                    ),
                  )
              ),

              ),
              new Container(
                child:new IconButton(
                    icon: new Icon(Icons.star,size: 30.0, color: Colors.amber,),
                    onPressed: _neverSatisfied
                ),

              ),
            ]

          ),
        ),
    );
  }


  Future<Null> _neverSatisfied() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Atenção',
            style: new TextStyle(
              color: Colors.red,
            ),
          ),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Queres revelar o teu nome?'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('yeup'),
              onPressed: () {
                //montrarr o teu nome yoooo missing
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('Nah'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
  }

}



