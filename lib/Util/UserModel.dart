import 'package:firebase_database/firebase_database.dart';

class HaterzUser{
  String id;
  String email, nome, real_photo, random_photo;
  String bio;
//String hates;

  HaterzUser(this.email, this.nome, this.real_photo, this.random_photo,
      this.bio);

  HaterzUser.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        email = snapshot.value["email"],
        nome = snapshot.value["nome"],
        real_photo = snapshot.value["real_photo"],
        random_photo = snapshot.value["random_photo"],
        bio = snapshot.value["bio"];

  toJson() {
    return {
      "email": email,
      "nome": nome,
      "real_photo": real_photo,
      "random_photo": random_photo,
      "bio": bio
    };
  }

}