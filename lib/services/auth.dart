import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:group_chat_app/helper_functions/shared_preference_helper.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get current user
  Future<User> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<User> signInWithGoogle(BuildContext context) async {
    print("Trying to login with Google");

    final GoogleSignIn _googleSignIn = new GoogleSignIn();

    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await _auth.signInWithCredential(credential);

      User userDetails = result.user;

      if (result == null) {
        print("Error: No user found");
      } else {
        // save user info and send to the home screen
        SharedPreferenceHelper.saveUserLoggedIn(true);
        SharedPreferenceHelper.saveUserEmail(userDetails.email);
        SharedPreferenceHelper.saveUserName(userDetails.displayName);
        SharedPreferenceHelper.saveUserProfilePic(userDetails.photoURL);
        SharedPreferenceHelper.saveUserUID(userDetails.uid);
      }

      return userDetails;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
