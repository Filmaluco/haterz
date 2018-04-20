import 'package:flutter/material.dart';
import "./HomePage.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

final FirebaseAuth _auth = FirebaseAuth.instance;
final _googleSignIn = GoogleSignIn();

Future<FirebaseUser> _handleSignIn() async {
  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  print("signed in " + user.displayName);
  return user;
}

class LandingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
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
              new RaisedButton(
                  onPressed:  _handleSignIn,
                  color: Colors.black12,
                  child: new Text(
                    "Google",
                    textDirection: TextDirection.ltr,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  )
              ),
              new RaisedButton(
                  onPressed:  () => Navigator.of(context).push(new MaterialPageRoute(builder:
                      (BuildContext context) => new HomePage())),

                  color: Colors.black12,
                  child: new Text(
                    "Next",
                    textDirection: TextDirection.ltr,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}



