import 'package:flutter/material.dart';
import 'package:numericalanalysis/Matrix/MatrixNavigator.dart';
import 'package:numericalanalysis/Models/Matrix.dart';
import 'package:numericalanalysis/Provider/MatricesProvider.dart';

class MatriXViewModel extends ChangeNotifier {
  Matrix matrix = Matrix();

  double x1 = 0;
  double x2 = 0;
  double x3 = 0;

  double m21 = 0;
  double m31 = 0;
  double m32 = 0;

  MatrixNavigator? navigator;

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

  MatricesProvider? provider ;

  void readInputs() {
    matrix = Matrix();
    for (int i = 0; i < rowOneControllers.length; i++) {
      matrix.rowOne.add(double.parse(rowOneControllers[i].text.isEmpty ? "0" :rowOneControllers[i].text));
      matrix.rowTwo.add(double.parse(rowTwoControllers[i].text.isEmpty ? "0" :rowTwoControllers[i].text));
      matrix.rowThree.add(double.parse(rowThreeControllers[i].text.isEmpty ? "0" :rowThreeControllers[i].text));
    }
  }

  void valid() {
    if(formKey.currentState != null){
      if (formKey.currentState!.validate()) {
        readInputs();
      }
    }else{
      readInputs();
    }
  }

  String? validationFunction(String? input) {
    if (input!.isEmpty) {
      return "enter Input";
    }
    return null;
  }


  // function to calculate the matrix using gauss elimination with out partial pivoting
  List<Matrix> calcGaussElimination() {
    valid();
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

    return matrices;
  }


  void gaussElimination(){
    List<Matrix> matrices = calcGaussElimination();
    provider!.updateDataForGauss(x1, x2, x3, m21, m31, m32, matrices, "Gauss Elimination");
    navigator!.goToResultScreen();
  }

  void calcMatrixWithLU() {
    List<Matrix> matrices = calcGaussElimination();

    // impl the L matrix
    Matrix L = Matrix();
    L.rowOne = [1, 0, 0];
    L.rowTwo = [m21, 1, 0];
    L.rowThree = [m31, m32, 1];


    // impl the B matrix
    Matrix B = Matrix();
    B.rowOne.add(matrices[0].rowOne[3]);
    B.rowTwo.add(matrices[0].rowTwo[3]);
    B.rowThree.add(matrices[0].rowThree[3]);


    // calc the value of the matrix c
    double c1 = B.rowOne[0];
    double c2 = B.rowTwo[0] - (c1 * m21);
    double c3 = B.rowThree[0] - ((c1 * m31) + (m32 * c2));

    Matrix C = Matrix();
    C.rowOne.add(c1);
    C.rowTwo.add(c2);
    C.rowThree.add(c3);

    // imp the U matrix
    Matrix U = Matrix();
    U.rowOne = [
      matrices[matrices.length - 1].rowOne[0],
      matrices[matrices.length - 1].rowOne[1],
      matrices[matrices.length - 1].rowOne[2]
    ];
    U.rowTwo = [
      matrices[matrices.length - 1].rowTwo[0],
      matrices[matrices.length - 1].rowTwo[1],
      matrices[matrices.length - 1].rowTwo[2]
    ];
    U.rowThree = [
      matrices[matrices.length - 1].rowThree[0],
      matrices[matrices.length - 1].rowThree[1],
      matrices[matrices.length - 1].rowThree[2]
    ];

    matrices = [];

    matrices.add(L);
    matrices.add(B);
    matrices.add(U);
    matrices.add(C);

    x3 = c3 / U.rowThree[2];
    x2 = (c2 - (U.rowTwo[2] * x3)) / U.rowTwo[1];
    x1 = (c1 - ((U.rowOne[1] * x2) + (U.rowOne[2] * x3))) / U.rowOne[0];

    provider!.updateDataForLU(x1, x2, x3, matrices , "LU");
    navigator!.goToResultScreen();
  }

  void calcGaussJordan() {
    valid();
    List<Matrix> matrices = [];
    matrices.add(matrix.copyMatrix());

    double temp = matrix.rowOne[0];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowOne[i] /= temp;
    }
    matrices.add(matrix.copyMatrix());

    temp = matrix.rowTwo[0];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowTwo[i] = temp * matrix.rowOne[i] - matrix.rowTwo[i];
    }
    matrices.add(matrix.copyMatrix());

    temp = matrix.rowThree[0];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowThree[i] = temp * matrix.rowOne[i] - matrix.rowThree[i];
    }
    matrices.add(matrix.copyMatrix());

    temp = matrix.rowTwo[1];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowTwo[i] /= temp;
    }
    matrices.add(matrix.copyMatrix());

    temp = matrix.rowOne[1];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowOne[i] = temp * matrix.rowTwo[i] - matrix.rowOne[i];
    }
    matrices.add(matrix.copyMatrix());

    temp = matrix.rowThree[1];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowThree[i] = temp * matrix.rowTwo[i] - matrix.rowThree[i];
    }
    matrices.add(matrix.copyMatrix());

    temp = matrix.rowThree[2];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowThree[i] /= temp;
    }
    matrices.add(matrix.copyMatrix());

    temp = matrix.rowTwo[2];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowTwo[i] = temp * matrix.rowThree[i] - matrix.rowTwo[i];
    }
    matrices.add(matrix.copyMatrix());

    temp = matrix.rowOne[2];
    for (int i = 0; i < matrix.rowOne.length; i++) {
      matrix.rowOne[i] = temp * matrix.rowThree[i] - matrix.rowOne[i];
    }
    matrices.add(matrix.copyMatrix());

    x1 = matrix.rowOne[3] / matrix.rowOne[0];
    x2 = matrix.rowTwo[3] / matrix.rowTwo[1];
    x3 = matrix.rowThree[3] / matrix.rowThree[2];

    provider!.updateDataForGauss(x1, x2, x3, m21, m31, m32, matrices, "Gauss Jordan");
    navigator!.goToResultScreen();
  }

  void calcCramer() {
    List<Matrix> matrices = [];
    matrices.add(matrix.copyMatrix());

    Matrix A =  Matrix();
    for(int i = 0 ; i<3 ;i++){
      A.rowOne.add(matrix.rowOne[i]);
      A.rowTwo.add(matrix.rowTwo[i]);
      A.rowThree.add(matrix.rowThree[i]);
    }
    double aEquivalent = calcAEquivalent(A);
    matrices.add(A.copyMatrix());

    Matrix A1 = Matrix();
    A1.rowOne = [matrix.rowOne[3] , A.rowOne[1] , A.rowOne[2]];
    A1.rowTwo = [matrix.rowTwo[3] , A.rowTwo[1] , A.rowTwo[2]];
    A1.rowThree = [matrix.rowThree[3] , A.rowThree[1] , A.rowThree[2]];

    double a1Equivalent = calcAEquivalent(A1);
    matrices.add(A1.copyMatrix());


    Matrix A2 = Matrix();
    A2.rowOne = [ A.rowOne[0] , matrix.rowOne[3] , A.rowOne[2]];
    A2.rowTwo = [ A.rowTwo[0] , matrix.rowTwo[3] , A.rowTwo[2]];
    A2.rowThree = [ A.rowThree[0] , matrix.rowThree[3] , A.rowThree[2]];

    double a2Equivalent = calcAEquivalent(A2);
    matrices.add(A2.copyMatrix());


    Matrix A3 = Matrix();
    A3.rowOne = [ A.rowOne[0]  , A.rowOne[1] , matrix.rowOne[3]];
    A3.rowTwo = [ A.rowTwo[0]  , A.rowTwo[1] , matrix.rowTwo[3]];
    A3.rowThree = [ A.rowThree[0]  , A.rowThree[1], matrix.rowThree[3]];

    double a3Equivalent = calcAEquivalent(A3);
    matrices.add(A3.copyMatrix());

    x1 = a1Equivalent / aEquivalent;
    x2 = a2Equivalent / aEquivalent;
    x3 = a3Equivalent / aEquivalent;

    provider!.updateDataForCramer(x1, x2, x3, aEquivalent, a1Equivalent, a2Equivalent, a3Equivalent, matrices, "Cramer");
    navigator!.goToResultScreen();
  }

  double calcAEquivalent (Matrix matrix){
    double x = (matrix.rowOne[0] * ((matrix.rowTwo[1] * matrix.rowThree[2]) - (matrix.rowTwo[2] * matrix.rowThree[1])))
        - (matrix.rowOne[1] * ((matrix.rowTwo[0] * matrix.rowThree[2]) - (matrix.rowTwo[2] * matrix.rowThree[0])))
        + (matrix.rowOne[2] * ((matrix.rowTwo[0] * matrix.rowThree[1]) - (matrix.rowTwo[1] * matrix.rowThree[0])));
    return x;
  }

}
