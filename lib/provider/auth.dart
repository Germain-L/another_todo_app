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
    } catch (err) {
      throw (err);
    } catch (err) {
      throw (err);
    }

    return false;
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      _isLoggedIn = false;
      user = null;

      // TODO: this
      // auth.currentUser.unlink();
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
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
