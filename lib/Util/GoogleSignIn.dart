import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  print(googleSignIn.currentUser.displayName);
  return user;
}