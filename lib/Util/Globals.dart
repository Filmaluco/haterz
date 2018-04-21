import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:haterz/Util/UserModel.dart';         //new

//Logins:
final googleSignIn = GoogleSignIn();

//Database
final UsersDatabase = FirebaseDatabase.instance.reference().child('Users');


//functions
bool userExist(HaterzUser newUser){

  List<HaterzUser> users = List();
  var data = FirebaseDatabase.instance.reference().child('Users');
  data.onChildAdded.listen( (Event event) =>
      users.add(HaterzUser.fromSnapshot(event.snapshot))
  );


  for(int i = 0; i < users.length; i++){
    if (users[i].email == newUser.email) {
      print(googleSignIn.currentUser.displayName + "Ja existe na base de dados");
      return true;
    }
  }

  print(googleSignIn.currentUser.displayName + "Ainda nao existe na base de dados");
  return false;


}