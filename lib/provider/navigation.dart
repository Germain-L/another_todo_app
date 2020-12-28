import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Navigation with ChangeNotifier {
  String currentPageTitle = "Home";

  List<String> pageHistory = [];

  void flush() {
    pageHistory.clear();
  }

  void newPage(String name) {
    currentPageTitle = name;
    pageHistory.add(name);
    notifyListeners();
  }

  void pop() {
    switch (pageHistory.isEmpty) {
      case true:
        Fluttertoast.showToast(msg: "No more pages in history");
        break;
      case false:
        currentPageTitle = pageHistory.last;
        pageHistory.removeLast();
        notifyListeners();
    }
  }
}
