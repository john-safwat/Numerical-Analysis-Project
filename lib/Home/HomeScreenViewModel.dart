import 'package:flutter/material.dart';
import 'package:numericalanalysis/Home/HomeScreenNavigator.dart';

class HomeScreenViewModel extends ChangeNotifier{
  HomeScreenNavigator? navigator;
  String titleOnScreen = 'Enter Equation';
  String validationMessage = "Valid Equation";
  int openingBracketCount = 0 ;
  int closingBracketCount = 0 ;


  void changeTitleOnScreen(String title){
    if (title == 'x'){
      onPressX();
      return ;
    }
    if (title == 'e'){
      onPressE();
      return ;
    }
    if (title == "sin(" || title == "cos(" || title == "tan("){
      onPressEquation(title);
      return;
    }
    if (title == "("){
      onPressOpenBracket();
      return;
    }
    if (title == ")"){
      onPressCloseBracket();
      return;
    }
    if (title == '.'){
      dotValidation();
      return;
    }
    if (title == "Clear"){
      clearText();
      return;
    }
    if (title == "Back"){
      onPressBack();
      return;
    }
    if (title == "Next"){
      if (titleOnScreen == "Enter Equation"){
        validationMessage = "You Can't Show Results Without Adding Equation";
        notifyListeners();
      }else{
        navigator?.goToResultScreen();
      }
      return;
    }
    if (title == "Home"){
      navigator?.goToFormScreen();
      return;
    }
    _changeTextOnScreen(title);
  }

  void onPressX (){
    if (titleOnScreen[titleOnScreen.length-1] == '.'){
      validationMessage = "You Can't Add X After (.)";
    }else {
      _changeTextOnScreen("x");
    }
    notifyListeners();
  }
  void onPressE (){
    if (titleOnScreen[titleOnScreen.length-1] == '.'){
      validationMessage = "You Can't Add e After (.)";
    }else {
      _changeTextOnScreen("e");
    }
    notifyListeners();
  }
  void onPressEquation(String title){
    if (titleOnScreen[titleOnScreen.length-1] == '.'){
      validationMessage = "You Can't Add $title After (.)";
    }else {
      openingBracketCount++;
      _changeTextOnScreen(title);
    }
    notifyListeners();
  }
  void onPressOpenBracket(){
    if (titleOnScreen[titleOnScreen.length-1] == '.'){
      validationMessage = "You Can't Add ( After (.)";
    }else{
      openingBracketCount++;
      _changeTextOnScreen("(");
    }
    notifyListeners();
  }
  void onPressCloseBracket(){
    if (titleOnScreen[titleOnScreen.length-1] == '.'){
      validationMessage = "You Can't Add ) After (.)";
    }else if (closingBracketCount == openingBracketCount){
      validationMessage = 'There is No Opening Bracket for this Closing Bracket';
      notifyListeners();
      return;
    }else {
      closingBracketCount++;
      _changeTextOnScreen(")");
    }
    notifyListeners();
  }
  void dotValidation() {
    for(int i = titleOnScreen.length-1 ; i>=0 ; i--){
      if(titleOnScreen[i] == '.'){
        validationMessage = "invalid dot";
        notifyListeners();
        return;
      }
      if (titleOnScreen[i] == '+'||titleOnScreen[i] == '-'||titleOnScreen[i] == '/'||titleOnScreen[i] == '*'){
        break;
      }
    }
    _changeTextOnScreen(".");
  }
  void clearText() {
    openingBracketCount = 0 ;
    closingBracketCount = 0 ;
    validationMessage = 'Valid Equation';
    titleOnScreen = "Enter Equation";
    notifyListeners();
  }
  void onPressBack(){
    // check if the string is not empty
    if (titleOnScreen != 'Enter Equation'){
      // check if the last char is )
      if (titleOnScreen[titleOnScreen.length-1] == ")"){
        closingBracketCount--;
        titleOnScreen = titleOnScreen.substring(0,titleOnScreen.length-1);
      }else if(titleOnScreen[titleOnScreen.length-1] == "("){ // check if the last char is (
        openingBracketCount--;
        titleOnScreen = titleOnScreen.substring(0,titleOnScreen.length-1);
        // if it is empty then there is no more charters else it could be sin or cos or tan
        if (titleOnScreen.isNotEmpty){
          // validate it is not a sin or cos or tan
          if(titleOnScreen[titleOnScreen.length-1] == 'n'||titleOnScreen[titleOnScreen.length-1] == 's'){
            titleOnScreen = titleOnScreen.substring(0,titleOnScreen.length-3);
          }
        }
      }else {
        titleOnScreen = titleOnScreen.substring(0,titleOnScreen.length-1);
      }

      if (titleOnScreen.isEmpty){
        titleOnScreen = "Enter Equation";
      }

      notifyListeners() ;
    }

  }
  void _changeTextOnScreen (String title){
    if (titleOnScreen == 'Enter Equation'){
      titleOnScreen = '';
    }
    titleOnScreen += title;
    validationMessage = 'Valid Equation';
    notifyListeners();
  }
}