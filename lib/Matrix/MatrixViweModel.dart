import 'package:flutter/material.dart';
import 'package:numericalanalysis/Models/Materix.dart';

class MatriXViewModel extends ChangeNotifier {
  List<Matrix> matrices = [];
  final formKey = GlobalKey<FormState>();
  List<TextEditingController> rowOneControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> rowTwoControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> rowThreeControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void readInputs() {
    matrices = [];
    Matrix matrix = Matrix();
    for(int i = 0 ; i < rowOneControllers.length ; i++){
      matrix.rowOne.add( double.parse(rowOneControllers[i].text));
      print("${matrix.rowOne[i]} \n");
      matrix.rowTwo.add(double.parse(rowTwoControllers[i].text));
      print("${matrix.rowTwo[i]} \n");
      matrix.rowThree.add(double.parse(rowThreeControllers[i].text));
      print("${matrix.rowThree[i]} \n");

    }
    matrices.add(matrix);
  }

  void valid(){
    if(formKey.currentState!.validate()){
        readInputs();
    }
  }

  String? validationFunction(String? input){
    if(input!.isEmpty || input == null    ){
      return "enter Input";
    }
    return null;
  }
}
