import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier{
  String titleOnScreen = 'Enter Equation';

  void changeTitleOnScreen(String title){

    if (title == "Back"){
      if(titleOnScreen != 'Enter Equation'){
        titleOnScreen = titleOnScreen.substring(0,titleOnScreen.length-1);
        if (titleOnScreen.isEmpty){
          titleOnScreen = 'Enter Equation';
        }
      }
      notifyListeners();
      return;
    }
    if (titleOnScreen == 'Enter Equation'){
      titleOnScreen = '';
    }
    titleOnScreen += title;
    notifyListeners();


  }
}