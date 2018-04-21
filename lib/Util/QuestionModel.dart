import 'package:firebase_database/firebase_database.dart';

class Question{

  String id;
  String question;
  String hate1, hate2; // this is where the options are store
  String Answer_User1_Photo, Answer_User2_Photo;

  Question(this.question, this.hate1,
      this.hate2); //we store the image of the user here


  Question.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.value["id"],
        question = snapshot.value["question"],
        hate1 = snapshot.value["hate1"],
        hate2 = snapshot.value["hate2"],
        Answer_User1_Photo = snapshot.value["Answer_User1_Photo"],
        Answer_User2_Photo = snapshot.value["Answer_User2_Photo"];

  toJson() {
    return {
      "id": id,
      "question": question,
      "hate1": hate1,
      "hate2": hate2,
      "Answer_User1_Photo": Answer_User1_Photo,
      "Answer_User2_Photo": Answer_User2_Photo
    };
  }




}