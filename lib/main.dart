import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:haterz/Util/LobbyModel.dart';
import 'package:haterz/Util/UserModel.dart';
import "./Pages/landing_page.dart";
import 'Util/Globals.dart';

void main() => runApp(new Haterzz());


class Haterzz extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var data = FirebaseDatabase.instance.reference().child('Users');
    data.onChildAdded.listen( (Event event) =>
        users.add(HaterzUser.fromSnapshot(event.snapshot))
    );

    LobbyDatabase.onChildAdded.listen( (Event event) =>
        lobbies.add(Lobby.fromSnapshot(event.snapshot))
    );

    updateList(Event event){
      Lobby target = Lobby.fromSnapshot(event.snapshot);

      for(int i = 0; i < lobbies.length; i++){
        if(target.id == lobbies[i]){
          lobbies[i]=target;
        }
      }
    }

    LobbyDatabase.onChildChanged.listen(updateList);

    LobbyDatabase.onChildRemoved.listen( (Event event) =>
        lobbies.remove(event.snapshot));


    return new MaterialApp(
      theme: new ThemeData.light(),
      title: 'Haterzz',
      home: new LandingPage()
      //home: (googleSignIn.currentUser==null ? new LandingPage() : new HomePage()),
    );
  }
}