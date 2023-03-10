import 'package:flutter/cupertino.dart';
import 'package:numericalanalysis/Form/FormNavigator.dart';

class FormScreenViewModel extends ChangeNotifier {
  FormNavigator? navigator;

  void goToHomeScreen(bool formValidation){
    if (formValidation){
      navigator?.goToHomeScreen();
    }
  }

  void goToMainScreen(){
    navigator?.goToMainScreen();
  }

  String? isValid(String? value){
    if(value!.isEmpty){
      return "Please Enter Number";
    }
    int dotCount = 0 ;
    for (int i = 0 ; i< value.length ; i++ ){
      if(value[i] == '.'){
        dotCount++;
      }
    }
    if (dotCount > 1){
      return "There Are $dotCount Decimal Points in This Number (it's Invalid)";
    }
    return null;
  }

  String? isValidIteration(String? value){
    if(value!.isNotEmpty){
      for (int i = 0 ; i< value.length ; i++ ){
        if(value[i] == '.'){
          return "The Number of Iterations Must Be Integer";
        }
      }
    }
    return null;
  }

}