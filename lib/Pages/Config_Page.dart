import 'package:flutter/material.dart';
import "../Util/GoogleSignIn.dart";
import "landing_page.dart";
class Config_Page extends StatefulWidget{


  @override
  State createState() => new Config_Page_State();
}

class Config_Page_State extends State<Config_Page>{
  final TextEditingController _textController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(

        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.settings_power,color: Colors.white), onPressed: () => Navigator.of (context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (BuildContext context) =>new LandingPage()),
                  (Route route) => route == null
          ),//push
          )
        ],

        backgroundColor: Colors.deepOrangeAccent,
        title: new Text(
            "Configurações"
        ),
        centerTitle: true,
      ),

      body: new Container(
        child: new Column(
          children: <Widget>[
           new Container(
             child:  new Row(

               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 new Container(

                   decoration:new  ShapeDecoration(shape: new CircleBorder(side:new  BorderSide(color: Colors.deepOrangeAccent,width: 3.0))),
                   margin: new EdgeInsets.all(25.0),
                   child:  new ClipOval(
                     child: new Image.network(googleSignIn.currentUser.photoUrl,
                       fit: BoxFit.cover,
                       width: 100.0,
                       height: 100.0,),
                   ),
                   width: 100.0,
                   height: 100.0,
                 ),

                 new Flexible(

                   child:  new Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                       new Container(
                         //margin: EdgeInsets.only(top: 25.0),
                         child: new Text(
                           googleSignIn.currentUser.displayName,
                           style: new TextStyle(fontSize: 25.0),
                         ),
                       ),


                     ],
                   ),
                 )
               ],
             ),
           ),

          ],

        ),
      ),
    );
  }
}