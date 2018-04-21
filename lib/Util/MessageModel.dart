import 'package:firebase_database/firebase_database.dart';

class Message{

  String text;
  String name;
  String avatar;

  Message.fromSnapshot(DataSnapshot snapshot)
      : text = snapshot.value["text"],
        name = snapshot.value["name"],
        avatar = snapshot.value["avatar"];

  toJson() {
    return {
      "text": text,
      "name": name,
      "avatar": avatar
    };
  }


}