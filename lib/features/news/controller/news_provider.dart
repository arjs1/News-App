import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  String buttonText = 'Text';

  void buttonPress() {
    buttonText = "I am pressing button";
    notifyListeners();
  }
}
