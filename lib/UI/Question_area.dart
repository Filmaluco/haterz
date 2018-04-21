import 'package:flutter/material.dart';

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

        color: Colors.white,
        child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 20.0),
          child: new Center(
            child: new Text(
              widget._question,
              style: new TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
    );
  }




  @override
  void dispose() {
    super.dispose();
  }

}



