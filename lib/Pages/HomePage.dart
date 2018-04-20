import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{

  @override
  State createState() => new HomePageState();

}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        automaticallyImplyLeading: false,
        centerTitle: true,
        bottom: new PreferredSize(
            child: new Material(
              color: Colors.deepOrange,
               child: new Column(

                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[

                   new Container(
                     margin: EdgeInsets.only(top: 0.0),
                     child:   new Row(
                       children: <Widget>[
                         new IconButton(icon: new Icon(Icons.edit,color: Colors.white,), onPressed: null)
                       ],
                       mainAxisAlignment: MainAxisAlignment.end,
                     ),
                   ),
                    new Container(
                      child:  new CircleAvatar(
                        child: new Icon(Icons.account_circle, size: 150.0,),
                        backgroundColor: Colors.white,
                      ),
                      width: 150.0,
                      height: 150.0,
                      color: Colors.deepOrange,
                    ),

                   new Container(
                     margin: EdgeInsets.only(bottom: 20.0, top: 10.0),
                     child: new Text(
                         "Nuno",
                         textDirection: TextDirection.ltr,
                         style:  new TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 35.0,
                           color: Colors.white,

                            ),
                          ),
                   ),
                 ],
          ),
        ), preferredSize: new Size.fromHeight(220.0)),
      ),

      body: new Container(color: Colors.white,),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.help_outline,size: 55.0,),
          backgroundColor: Colors.deepOrangeAccent),
    );
  }

}


