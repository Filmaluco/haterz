import 'package:flutter/material.dart';

import "../UI/Chat_Screen.dart";
import "../UI/Game_Screen.dart";
class  GamingPage extends StatefulWidget{

  final String _name;
  GamingPage(this._name);

  @override
  State createState() => new GamingPageState(this._name);
}

class GamingPageState extends State<GamingPage>{

  final String _name;
  GamingPageState(this._name);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.deepOrangeAccent,

            bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.gamepad)),
                new Tab(icon: new Icon(Icons.chat)),
              ],
            ),
            title: new Text(
                this._name,
                style: new TextStyle(color: Colors.white),
            ),
            centerTitle: true,

          ),
          body: new TabBarView(
            children: [
              new Game_Screen(),
              new ChatScreen(),
            ],
          ),
        ),
      ),
    );
  }
}