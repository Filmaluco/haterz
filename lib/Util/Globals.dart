import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:haterz/Util/LobbyModel.dart';
import 'package:haterz/Util/UserModel.dart';         //new

//Logins:
final googleSignIn = GoogleSignIn();
HaterzUser haterzUser;

//Database
final UsersDatabase = FirebaseDatabase.instance.reference().child('Users');
final List<HaterzUser> users = List();

final LobbyDatabase = FirebaseDatabase.instance.reference().child('Lobbies');
List<Lobby> lobbies = List();


//functions
bool userExist(HaterzUser newUser){
  for(int i = 0; i < users.length; i++){
    if (users[i].email == newUser.email) {
      haterzUser = users[i];
      return true;
    }
  }
  return false;

}