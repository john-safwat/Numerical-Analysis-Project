import 'package:flutter/material.dart';
import 'package:numericalanalysis/Models/Materix.dart';

class MatriXViewModel extends ChangeNotifier {
  List<Matrix> matrices = [];
  double x1 = 0;
  double x2 = 0;
  double x3 = 0;

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
    for (int i = 0; i < rowOneControllers.length; i++) {
      matrix.rowOne.add(double.parse(rowOneControllers[i].text));
      matrix.rowTwo.add(double.parse(rowTwoControllers[i].text));
      matrix.rowThree.add(double.parse(rowThreeControllers[i].text));
    }
    matrices.add(matrix);
  }

  void valid() {
    if (formKey.currentState!.validate()) {
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
    Matrix matrix = matrices[0];

    double m21 = matrix.rowTwo[0] / matrix.rowOne[0];
    double m31 = matrix.rowThree[0] / matrix.rowOne[0];

    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowTwo[i] = matrix.rowTwo[i] - (m21 * matrix.rowOne[i]);
      matrix.rowThree[i] = matrix.rowThree[i] - (m31 * matrix.rowOne[i]);
    }

    matrices.add(matrix);

    double m32 = matrix.rowThree[1] / matrix.rowTwo[1];

    for (int i = 0; i < matrix.rowThree.length; i++) {
      matrix.rowThree[i] = matrix.rowThree[i] - (m32 * matrix.rowTwo[i]);
    }

    matrices.add(matrix);

    x3 = matrix.rowThree[3] / matrix.rowThree[2];
    print("x3 : $x3");
    x2 = (matrix.rowTwo[3] - (x3 * matrix.rowTwo[2])) / (matrix.rowTwo[1]);
    print("x2 : $x2");
    x1 = (matrix.rowOne[3] -
            ((x2 * matrix.rowOne[1]) + (x3 * matrix.rowOne[2]))) /
        (matrix.rowOne[0]);
    print('x1 : $x1');
  }

  void gaussEliminationWithPartialPivoting() {
    Matrix matrix = matrices[0];

    if (matrix.rowOne[0].abs() > matrix.rowTwo[0].abs()) {
      if (matrix.rowOne[0].abs() > matrix.rowThree[0].abs()) {
        if (matrix.rowTwo[0].abs() < matrix.rowThree[0].abs()) {
          for (int i = 0; i < matrix.rowTwo.length; i++) {
            double temp = matrix.rowTwo[i];
            matrix.rowTwo[i] = matrix.rowThree[i];
            matrix.rowThree[i] = temp;
          }
        }
      }
    }else{
      for (int i = 0; i < matrix.rowTwo.length; i++) {
        double temp = matrix.rowTwo[i];
        matrix.rowTwo[i] = matrix.rowOne[i];
        matrix.rowOne[i] = temp;
      }
      if (matrix.rowTwo[0].abs() < matrix.rowThree[0].abs()){
        for (int i = 0; i < matrix.rowTwo.length; i++) {
          double temp = matrix.rowTwo[i];
          matrix.rowTwo[i] = matrix.rowThree[i];
          matrix.rowThree[i] = temp;
        }
      }
      if(matrix.rowOne[0].abs() < matrix.rowTwo[0].abs()){
        for (int i = 0; i < matrix.rowTwo.length; i++) {
          double temp = matrix.rowTwo[i];
          matrix.rowTwo[i] = matrix.rowOne[i];
          matrix.rowOne[i] = temp;
        }
      }
    }

    double m21 = matrix.rowTwo[0] / matrix.rowOne[0];
    double m31 = matrix.rowThree[0] / matrix.rowOne[0];

    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowTwo[i] = matrix.rowTwo[i] - (m21 * matrix.rowOne[i]);
      matrix.rowThree[i] = matrix.rowThree[i] - (m31 * matrix.rowOne[i]);
    }

    matrices.add(matrix);

    if(matrix.rowTwo[1].abs()<matrix.rowThree[1].abs()){
      for (int i = 0; i < matrix.rowTwo.length; i++) {
        double temp = matrix.rowTwo[i];
        matrix.rowTwo[i] = matrix.rowThree[i];
        matrix.rowThree[i] = temp;
      }
    }

    double m32 = matrix.rowThree[1] / matrix.rowTwo[1];

    for (int i = 0; i < matrix.rowThree.length; i++) {
      matrix.rowThree[i] = matrix.rowThree[i] - (m32 * matrix.rowTwo[i]);
    }

    matrices.add(matrix);

    x3 = matrix.rowThree[3] / matrix.rowThree[2];
    print("x3 : $x3");
    x2 = (matrix.rowTwo[3] - (x3 * matrix.rowTwo[2])) / (matrix.rowTwo[1]);
    print("x2 : $x2");
    x1 = (matrix.rowOne[3] - ((x2 * matrix.rowOne[1]) + (x3 * matrix.rowOne[2]))) / (matrix.rowOne[0]);
    print('x1 : $x1');
  }
}
