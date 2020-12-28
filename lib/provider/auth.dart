import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  User _user;

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  User get user {
    return _user;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      _isLoggedIn = true;
      notifyListeners();
    }  catch (err) {
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

      _user = register.user;

      if (_user != null) {
        _isLoggedIn = true;
        notifyListeners();
        return true;
      }
    }  catch (err) {
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
      _user = null;
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }
}
