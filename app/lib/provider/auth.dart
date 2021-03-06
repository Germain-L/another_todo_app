import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  User user;

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      _isLoggedIn = true;
      notifyListeners();
    } catch (err) {
      if (err.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (err.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

      throw (err);
    }

    return false;
  }

  Future<bool> registerEmailPassword(String email, String password) async {
    try {
      final UserCredential register = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = register.user;

      if (user != null) {
        _isLoggedIn = true;
        notifyListeners();
        return true;
      }
    } catch (err) {}
    return false;
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      _isLoggedIn = false;
      user = null;

      await _googleSignIn.signOut();

      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential creds = await auth.signInWithCredential(credential);
      user = creds.user;
      _isLoggedIn = true;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> trySignInSilent() async {
    user = auth.currentUser;
    if (user != null) {
      _isLoggedIn = true;
      notifyListeners();
    }
  }
}
