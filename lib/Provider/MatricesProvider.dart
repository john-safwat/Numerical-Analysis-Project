import 'package:flutter/material.dart';
import 'package:numericalanalysis/Models/Matrix.dart';

class MatricesProvider extends ChangeNotifier {
  double x1 = 0  , x2  = 0, x3 = 0 , m21 = 0 , m31 = 0 , m32 = 0 , A= 0 , A1 = 0  , A2 = 0 , A3 = 0;
  List<Matrix> matrices = [];
  String type = 'none';

  void updateDataForGauss(double x1 , double x2  , double x3 , double m21 , double m31 , double m32 , List<Matrix> matrices , String type){
    this.matrices = matrices ;
    this.x1 = x1;
    this.x2 = x2;
    this.x3 = x3;
    this.m21 = m21;
    this.m31 = m31;
    this.m32 = m32;
    this.type = type;
  }

  void updateDataForLU(double x1 , double x2  , double x3 , List<Matrix> matrices , String type){
    this.matrices = matrices ;
    this.x1 = x1;
    this.x2 = x2;
    this.x3 = x3;
    this.type = type;
  }

  void updateDataForCramer(double x1 , double x2  , double x3 ,double A , double A1 , double A2 , double A3 , List<Matrix> matrices , String type){
    this.matrices = matrices ;
    this.x1 = x1;
    this.x2 = x2;
    this.x3 = x3;
    this.type = type;
    this.A = A;
    this.A1= A1;
    this.A2 = A2;
    this.A3= A3;
  }
}