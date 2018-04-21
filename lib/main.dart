import 'package:flutter/material.dart';
import "./Pages/landing_page.dart";
import 'Pages/HomePage.dart';
import 'Util/Globals.dart';

void main() => runApp(new Haterzz());


class Haterzz extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData.light(),
      title: 'Haterzz',
      home: new LandingPage()
      //home: (googleSignIn.currentUser==null ? new LandingPage() : new HomePage()),
    );
  }
}