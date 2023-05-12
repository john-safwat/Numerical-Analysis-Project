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
      // readInputs();
      // gaussEliminationWithoutPartialPivot();
      readInputs();
      // gaussEliminationWithPartialPivoting();
      calcMatrixWithLU();
    }
  }

  String? validationFunction(String? input) {
    if (input!.isEmpty) {
      return "enter Input";
    }
    return null;
  }

  // function to calculate the matrix using gauss elimination with out partial pivoting
  List<Matrix> gaussEliminationWithoutPartialPivot() {
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

    // for(int i = 0; i<matrices.length ; i++){
    //   printMatrices(matrices[i]);
    // }
    return matrices;
  }

  void printMatrices(Matrix matrix){
    print("${matrix.rowOne[0]} ${matrix.rowOne[1]} ${matrix.rowOne[2]} ${matrix.rowOne[3]}");
    print("${matrix.rowTwo[0]} ${matrix.rowTwo[1]} ${matrix.rowTwo[2]} ${matrix.rowTwo[3]}");
    print("${matrix.rowThree[0]} ${matrix.rowThree[1]} ${matrix.rowThree[2]} ${matrix.rowThree[3]}");
  }

  void calcMatrixWithLU(){
    List<Matrix> matrices = gaussEliminationWithoutPartialPivot();

    // impl the L matrix
    Matrix L = Matrix();
    L.rowOne = [1 ,0 , 0];
    L.rowTwo = [m21 ,1, 0];
    L.rowThree = [m31 ,m32, 1];

    // impl the B matrix
    Matrix B = Matrix();
    B.rowOne.add(matrices[0].rowOne[3]);
    B.rowTwo.add(matrices[0].rowTwo[3]);
    B.rowThree.add(matrices[0].rowThree[3]);

    // print("${L.rowOne[0]} ${L.rowOne[1]} ${L.rowOne[2]}");
    // print("${L.rowTwo[0]} ${L.rowTwo[1]} ${L.rowTwo[2]}");
    // print("${L.rowThree[0]} ${L.rowThree[1]} ${L.rowThree[2]}");
    //
    // print("${B.rowOne[0]}");
    // print("${B.rowTwo[0]}");
    // print("${B.rowThree[0]}");

    // calc the value of the matrix c
    double c1 = B.rowOne[0] / L.rowOne[0];
    double c2 = B.rowTwo[0] / c1 * m21;
    double c3 = B.rowThree[0] / c1 * m31 + m32 * c2;

    Matrix U = Matrix();
    U.rowOne = [matrices[matrices.length-1].rowOne[0] , matrices[matrices.length-1].rowOne[1] , matrices[matrices.length-1].rowOne[2]];
    U.rowTwo = [matrices[matrices.length-1].rowTwo[0] , matrices[matrices.length-1].rowTwo[1] , matrices[matrices.length-1].rowTwo[2]];
    U.rowThree = [matrices[matrices.length-1].rowThree[0] , matrices[matrices.length-1].rowThree[1] , matrices[matrices.length-1].rowThree[2]];


  }

  // // function to calculate the matrix using gauss elimination with partial pivoting
  // List<Matrix> gaussEliminationWithPartialPivoting() {
  //
  //   List<Matrix> matrices = [];
  //
  //   matrices.add(matrix.copyMatrix());
  //   matrix.sortMatrixFirstTime();
  //   matrices.add(matrix.copyMatrix());
  //   m21 = matrix.rowTwo[0] / matrix.rowOne[0];
  //   m31 = matrix.rowThree[0] / matrix.rowOne[0];
  //   m21.floorToDouble();
  //   m31.floorToDouble();
  //
  //   for (int i = 0; i < matrix.rowOne.length; i++) {
  //     matrix.rowTwo[i] = matrix.rowTwo[i] - (m21 * matrix.rowOne[i]);
  //     matrix.rowTwo[i].floorToDouble();
  //     matrix.rowThree[i] = matrix.rowThree[i] - (m31 * matrix.rowOne[i]);
  //     matrix.rowThree[i].floorToDouble();
  //   }
  //   matrices.add(matrix.copyMatrix());
  //
  //   matrix.sortMatrixSecondTime();
  //
  //   matrices.add(matrix.copyMatrix());
  //
  //   m32 = matrix.rowThree[1] / matrix.rowTwo[1];
  //   m32.floorToDouble();
  //
  //   for (int i = 0; i < matrix.rowThree.length; i++) {
  //     matrix.rowThree[i] = (matrix.rowThree[i] - (m32 * matrix.rowTwo[i]));
  //     matrix.rowThree[i].floorToDouble();
  //   }
  //
  //   matrices.add(matrix.copyMatrix());
  //
  //   x3 = matrix.rowThree[3] / matrix.rowThree[2];
  //   x2 = (matrix.rowTwo[3] - (x3 * matrix.rowTwo[2])) / (matrix.rowTwo[1]);
  //   x1 = (matrix.rowOne[3] - ((x2 * matrix.rowOne[1]) + (x3 * matrix.rowOne[2]))) / (matrix.rowOne[0]);
  //
  //   return matrices;
  // }

}
