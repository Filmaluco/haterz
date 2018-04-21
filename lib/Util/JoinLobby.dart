import 'package:haterz/Util/LobbyModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Globals.dart';
import 'dart:math';

joinLobby() {

  bool fl_noGameFound = true;

  if (lobbies.length >= 1) {
    for (int i = 0; i < lobbies.length; i++) {
      if (lobbies[i].status == "0" && fl_noGameFound) {
        fl_noGameFound = false;
        var lobby = new Lobby(lobbies[i].id, "0", lobbies[i].user1_nick, lobbies[i].user1_id,
            "user2", "0");

        LobbyDatabase.child(lobbies[i].id).set(lobby.toJson());

        _handle_user1connected(Event event){
          Lobby target = Lobby.fromSnapshot(event.snapshot);
          if(target.status == "1"){
            print("Iniciar Jogo");
            return;
          } else{
            target.user2_id = haterzUser.id;
            LobbyDatabase.child(target.id).set(target.toJson());
          }
        }

        LobbyDatabase.onChildChanged.listen(_handle_user1connected);
      }
      if(fl_noGameFound){ createNewLobby(); }
    }

  }else { createNewLobby();}

}

createNewLobby(){
  var rng = new Random();
  String lobbyId = "user1" + rng.nextInt(500).toString();
  var lobby = new Lobby(lobbyId,"0", "user1", null, "0", null);
  LobbyDatabase.child(lobbyId).set(lobby.toJson());


  _handle_user2connected(Event event){
  Lobby target = Lobby.fromSnapshot(event.snapshot);

  if(target.user2_id == "0") { // its the first connection
  target.user1_id = haterzUser.id;
  LobbyDatabase.child(lobbyId).set(target.toJson());
  }else{
  target.status = "1";
  LobbyDatabase.child(lobbyId).set(target.toJson());
  print("Creating lobby and sending lobby info");
  return;
  }
  }

  LobbyDatabase.onChildChanged.listen(_handle_user2connected);

}