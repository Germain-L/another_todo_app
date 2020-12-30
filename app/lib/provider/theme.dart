import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isLightTheme = false;

  bool get isLightTheme {
    return _isLightTheme;
  }

  Future<void> checkSavedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("isLightTheme")) {
      _isLightTheme = prefs.getBool("isLightTheme");
      notifyListeners();
    } else {
      prefs.setBool("isLightTheme", false);
      notifyListeners();
    }
  }

  Future<void> setTheme(bool newTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLightTheme", newTheme);
    _isLightTheme = newTheme;
    notifyListeners();
  }
}
