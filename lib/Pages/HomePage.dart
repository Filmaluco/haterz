import 'package:flutter/material.dart';
import "../UI/PersonContainer.dart";
import "../Util/Globals.dart";
import "./Config_Page.dart";
import '../Util/JoinLobby.dart';
class HomePage extends StatefulWidget{

  @override
  State createState() => new HomePageState();

}

class HomePageState extends State<HomePage> {
  final List<PersonConteiner> _persons = <PersonConteiner>[ 
    new PersonConteiner("Filipe"), 
    new PersonConteiner("Stark"),
    new PersonConteiner("Garrucho"),
    new PersonConteiner("o tal gajo autista")
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        bottom: new PreferredSize(
            child: new Material(
              color: Colors.deepOrangeAccent,
               child: new Column(

                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[

                   new Container(
                     margin: EdgeInsets.only(top: 0.0),
                     child:   new Row(
                       children: <Widget>[
                         new IconButton(
                             icon: new Icon(
                               Icons.settings,
                               color: Colors.white,
                             ),
                             onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder:
                                 (BuildContext context) => new Config_Page())),
                         )
                       ],
                       mainAxisAlignment: MainAxisAlignment.end,
                     ),
                   ),
                    new Container(
                      child:  new ClipOval(
                        child: new Image.network(googleSignIn.currentUser.photoUrl,
                          fit: BoxFit.cover,
                          width: 100.0,
                          height: 100.0,),
                      ),
                      width: 130.0,
                      height: 130.0,
                      color: Colors.deepOrangeAccent,
                    ),

                   new Container(
                     margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                     child: new Text(
                         googleSignIn.currentUser.displayName,
                         textDirection: TextDirection.ltr,
                         style:  new TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 25.0,
                           color: Colors.white,

                            ),
                          ),
                   ),
                 ],
          ),
        ), preferredSize: new Size.fromHeight(180.0)),
      ),

      body:  new Container(
        color: Colors.black12,
        child: new Column(

          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: false,
                itemBuilder: (_, int index) => _persons[index],
                itemCount: _persons.length,
              ),
            ),
            new Divider(height: 1.0,),

          ],
        ),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new FloatingActionButton(
          onPressed: joinLobby,
          child: new Icon(Icons.all_inclusive,size: 55.0,),
          backgroundColor: Colors.deepOrangeAccent),
    );
  }




}


