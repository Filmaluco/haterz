import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:haterz/Util/UserModel.dart';         //new

//Logins:
final googleSignIn = GoogleSignIn();

//Database
final UsersDatabase = FirebaseDatabase.instance.reference().child('Users');
final List<HaterzUser> users = List();


//functions
bool userExist(HaterzUser newUser){



  for(int i = 0; i < users.length; i++){
    if (users[i].email == newUser.email) {
      print(googleSignIn.currentUser.displayName + "Ja existe na base de dados");
      return true;
    }
  }

  print(googleSignIn.currentUser.displayName + "Ainda nao existe na base de dados");
  return false;


}