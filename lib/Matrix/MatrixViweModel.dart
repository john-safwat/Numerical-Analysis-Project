import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:numericalanalysis/Models/Matrix.dart';

class MatriXViewModel extends ChangeNotifier {
  Matrix matrix  = Matrix();

  double x1 = 0;
  double x2 = 0;
  double x3 = 0;
  double m21 = 0;
  double m31 = 0;
  double m32 = 0;

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
    for (int i = 0; i < rowOneControllers.length; i++) {
      matrix.rowOne.add(double.parse(rowOneControllers[i].text));
      matrix.rowTwo.add(double.parse(rowTwoControllers[i].text));
      matrix.rowThree.add(double.parse(rowThreeControllers[i].text));
    }
  }

  void valid() {
    if (formKey.currentState!.validate()) {
      // readInputs();
      // gaussEliminationWithoutPartialPivot();
      readInputs();
      gaussEliminationWithPartialPivoting();
    }
  }

  String? validationFunction(String? input) {
    if (input!.isEmpty) {
      return "enter Input";
    }
    return null;
  }

  void gaussEliminationWithoutPartialPivot() {

    m21 = matrix.rowTwo[0] / matrix.rowOne[0];
    m31 = matrix.rowThree[0] / matrix.rowOne[0];

    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowTwo[i] = matrix.rowTwo[i] - (m21 * matrix.rowOne[i]);
      matrix.rowThree[i] = matrix.rowThree[i] - (m31 * matrix.rowOne[i]);
    }


    m32 = matrix.rowThree[1] / matrix.rowTwo[1];

    for (int i = 0; i < matrix.rowThree.length; i++) {
      matrix.rowThree[i] = matrix.rowThree[i] - (m32 * matrix.rowTwo[i]);
    }


    x3 = matrix.rowThree[3] / matrix.rowThree[2];
    print("x3 : $x3");
    x2 = (matrix.rowTwo[3] - (x3 * matrix.rowTwo[2])) / (matrix.rowTwo[1]);
    print("x2 : $x2");
    x1 = (matrix.rowOne[3] - ((x2 * matrix.rowOne[1]) + (x3 * matrix.rowOne[2]))) / (matrix.rowOne[0]);
    print('x1 : $x1');
  }

  void gaussEliminationWithPartialPivoting() {

    matrix.sortMatrixFirstTime();

    m21 = matrix.rowTwo[0] / matrix.rowOne[0];
    m31 = matrix.rowThree[0] / matrix.rowOne[0];
    m21.floorToDouble();
    m31.floorToDouble();

    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowTwo[i] = matrix.rowTwo[i] - (m21 * matrix.rowOne[i]);
      matrix.rowTwo[i].floorToDouble();
      matrix.rowThree[i] = matrix.rowThree[i] - (m31 * matrix.rowOne[i]);
      matrix.rowThree[i].floorToDouble();
    }

    matrix.sortMatrixSecondTime();

    m32 = matrix.rowThree[1] / matrix.rowTwo[1];
    m32.floorToDouble();

    for (int i = 0; i < matrix.rowThree.length; i++) {
      matrix.rowThree[i] = (matrix.rowThree[i] - (m32 * matrix.rowTwo[i]));
      matrix.rowThree[i].floorToDouble();
    }

    x3 = matrix.rowThree[3] / matrix.rowThree[2];
    print("x3 : ${x3.toStringAsFixed(3)}");
    x2 = (matrix.rowTwo[3] - (x3 * matrix.rowTwo[2])) / (matrix.rowTwo[1]);
    print("x2 : ${x2.toStringAsFixed(3)}");
    x1 = (matrix.rowOne[3] - ((x2 * matrix.rowOne[1]) + (x3 * matrix.rowOne[2]))) / (matrix.rowOne[0]);
    print('x1 : ${x1.toStringAsFixed(3)}');
    printMatrices();
  }


  void printMatrices(){
      print("${matrix.rowOne[0]} ${matrix.rowOne[1]} ${matrix.rowOne[2]} ${matrix.rowOne[3]}");
      print("${matrix.rowTwo[0]} ${matrix.rowTwo[1]} ${matrix.rowTwo[2]} ${matrix.rowTwo[3]}");
      print("${matrix.rowThree[0]} ${matrix.rowThree[1]} ${matrix.rowThree[2]} ${matrix.rowThree[3]}");
  }

  void calcMatrixWithLU(){

  }
}
