import 'package:flutter/foundation.dart';

class ThemeProvider with ChangeNotifier {
  bool _isLightTheme = false;

  bool get isLightTheme {
    return _isLightTheme;
  }

  void setTheme(bool isLightTheme) {
    _isLightTheme = isLightTheme;
    notifyListeners();
  }
}