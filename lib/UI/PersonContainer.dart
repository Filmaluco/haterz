import 'package:flutter/material.dart';
import "../Pages/Gaming_Page.dart";


class PersonConteiner extends StatelessWidget{

  final String name;


  PersonConteiner(this.name);

  @override
  Widget build(BuildContext context){
    return new Container(

      padding: new EdgeInsets.all(2.0),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 3.0),
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder:
            (BuildContext context) => new GamingPage(this.name))),
        child:  new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 10.0,left: 5.0),
              child: new CircleAvatar(

                child: new Icon(Icons.account_circle,
                ),
                radius: 15.0,
              ),
            ),

            new Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: new Text(this.name,
                textDirection: TextDirection.ltr,
                style: new TextStyle(fontSize: 15.0),
              ) ,
            ),




          ],
        ),
      )
    );
  }

}