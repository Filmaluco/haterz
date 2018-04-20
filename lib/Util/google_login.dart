import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';


GoogleSignIn googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

// ignore: camel_case_types
class Google_login{

  final GoogleSignInAccount currentUser;
  final String contactText;

  Google_login(this.currentUser, this.contactText);
}

Future<Null> handleGoogleSignIn() async {
  try {
    await googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}
