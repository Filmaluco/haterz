import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haterz/Util/UserModel.dart';
import 'dart:async';
import './Globals.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


Future<FirebaseUser> handleGoogleSignIn() async {
  GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  HaterzUser newUser = new HaterzUser(googleSignIn.currentUser.email, googleSignIn.currentUser.displayName,
      googleSignIn.currentUser.photoUrl, "https://picsum.photos/458/354?image=497", "Bio Here");

  if (!userExist(newUser)){
    UsersDatabase.push().set(newUser.toJson());
  };

  print(googleSignIn.currentUser.displayName);
  return user;
}