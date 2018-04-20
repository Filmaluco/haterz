import 'package:flutter/material.dart';

import "./Pages/landing_page.dart";
void main() => runApp(new Haterzz());


class Haterzz extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Haterzz',

      home: new LandingPage(),
    );
  }
}