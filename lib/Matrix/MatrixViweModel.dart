import 'package:flutter/material.dart';
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
    matrix = Matrix();
    for (int i = 0; i < rowOneControllers.length; i++) {
      matrix.rowOne.add(double.parse(rowOneControllers[i].text));
      matrix.rowTwo.add(double.parse(rowTwoControllers[i].text));
      matrix.rowThree.add(double.parse(rowThreeControllers[i].text));
    }
  }

  void valid() {
    if (formKey.currentState!.validate()) {
      readInputs();
      gaussEliminationWithoutPartialPivot();
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

  // function to calculate the matrix using gauss elimination with out partial pivoting
  void gaussEliminationWithoutPartialPivot() {
    List<Matrix> matrices = [];

    // add the matrix to matrices list
    matrices.add(matrix.copyMatrix());

    // then calc the m21 and m31 to make the the lower triangle is zero
    m21 = matrix.rowTwo[0] / matrix.rowOne[0];
    m31 = matrix.rowThree[0] / matrix.rowOne[0];

    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowTwo[i] = matrix.rowTwo[i] - (m21 * matrix.rowOne[i]);
      matrix.rowThree[i] = matrix.rowThree[i] - (m31 * matrix.rowOne[i]);
    }

    // add the matrix to matrices list
    matrices.add(matrix.copyMatrix());

    m32 = matrix.rowThree[1] / matrix.rowTwo[1];

    for (int i = 0; i < matrix.rowThree.length; i++) {
      matrix.rowThree[i] = matrix.rowThree[i] - (m32 * matrix.rowTwo[i]);
    }

    matrices.add(matrix.copyMatrix());

    x3 = matrix.rowThree[3] / matrix.rowThree[2];
    x2 = (matrix.rowTwo[3] - (x3 * matrix.rowTwo[2])) / (matrix.rowTwo[1]);
    x1 = (matrix.rowOne[3] - ((x2 * matrix.rowOne[1]) + (x3 * matrix.rowOne[2]))) / (matrix.rowOne[0]);

  }

  // function to calculate the matrix using gauss elimination with partial pivoting
  void gaussEliminationWithPartialPivoting() {

    List<Matrix> matrices = [];

    matrices.add(matrix.copyMatrix());
    matrix.sortMatrixFirstTime();
    matrices.add(matrix.copyMatrix());
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
    matrices.add(matrix.copyMatrix());

    matrix.sortMatrixSecondTime();

    matrices.add(matrix.copyMatrix());

    m32 = matrix.rowThree[1] / matrix.rowTwo[1];
    m32.floorToDouble();

    for (int i = 0; i < matrix.rowThree.length; i++) {
      matrix.rowThree[i] = (matrix.rowThree[i] - (m32 * matrix.rowTwo[i]));
      matrix.rowThree[i].floorToDouble();
    }

    matrices.add(matrix.copyMatrix());

    x3 = matrix.rowThree[3] / matrix.rowThree[2];
    x2 = (matrix.rowTwo[3] - (x3 * matrix.rowTwo[2])) / (matrix.rowTwo[1]);
    x1 = (matrix.rowOne[3] - ((x2 * matrix.rowOne[1]) + (x3 * matrix.rowOne[2]))) / (matrix.rowOne[0]);
  }

  void printMatrices(Matrix matrix){
      print("${matrix.rowOne[0]} ${matrix.rowOne[1]} ${matrix.rowOne[2]} ${matrix.rowOne[3]}");
      print("${matrix.rowTwo[0]} ${matrix.rowTwo[1]} ${matrix.rowTwo[2]} ${matrix.rowTwo[3]}");
      print("${matrix.rowThree[0]} ${matrix.rowThree[1]} ${matrix.rowThree[2]} ${matrix.rowThree[3]}");
  }

  void calcMatrixWithLU(){

  }

}
