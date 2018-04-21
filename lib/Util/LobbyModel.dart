import 'package:firebase_database/firebase_database.dart';

class Lobby{
  String id;
  String user1_nick, user1_id;
  String user2_nick, user2_id;
  String status;

  Lobby(this.id, this.status, this.user1_nick, this.user1_id, this.user2_nick, this.user2_id);

  Lobby.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.value["id"],
        status = snapshot.value["status"],
        user1_nick = snapshot.value["user1_nick"],
        user1_id = snapshot.value["user1_id"],
        user2_nick = snapshot.value["user2_nick"],
        user2_id = snapshot.value["user2_id"];

  toJson() {
    return {
      "id": id,
      "status": status,
      "user1_id": user1_id,
      "user1_nick": user1_nick,
      "user2_nick": user2_nick,
      "user2_id": user2_id
    };
  }

}