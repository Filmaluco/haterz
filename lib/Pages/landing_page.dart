import 'package:flutter/material.dart';
import "./HomePage.dart";
import '../Util/GoogleSignIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class LandingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

     login_google() {
       handleGoogleSignIn().whenComplete(() =>
           Navigator.of(context).push(new MaterialPageRoute(builder:
               (BuildContext context) => new HomePage())));
     }

    return new Material(
        color: Colors.deepOrangeAccent,
        child: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(

                padding: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
                child: new Text(
                  "Haterz",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Logins: "),
                  new IconButton(
                    onPressed: login_google,
                    iconSize: 35.0,
                    color: Colors.amberAccent,
                    icon: new Icon(FontAwesomeIcons.google)
                  ),
                  new IconButton(
                      onPressed: null,
                      iconSize: 35.0,
                      disabledColor: Colors.black54,
                      icon: new Icon(FontAwesomeIcons.facebook)
                  ),
                ],)
            ],
          ),
        )
    );
  }
}



