import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier{
  String titleOnScreen = 'Enter Equation';

  void changeTitleOnScreen(String title){
    if (titleOnScreen == "Enter Equation") {
      titleOnScreen = '';
    }
    titleOnScreen = titleOnScreen + title;
    notifyListeners();
  }
}