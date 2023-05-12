import 'package:flutter/material.dart';
import 'package:numericalanalysis/Models/Bisection.dart';
import 'package:numericalanalysis/Models/FalsePosition.dart';
import 'package:numericalanalysis/Models/Newton.dart';
import 'package:numericalanalysis/Models/SampleFixedPoint.dart';
import 'package:numericalanalysis/Models/Secant.dart';

class NonlinearEquationsProvider extends ChangeNotifier {
  Bisection? bisection;
  FalsePosition? falsePosition ;
  SampleFixedPoint? sampleFixedPoint;
  Newton? newton ;
  Secant? secant;

  void setEquation(String equation){
    if(bisection!= null){
      bisection!.equation = equation;
      bisection!.calcBisection();
    }else if (falsePosition != null){
      falsePosition!.equation = equation;
      falsePosition!.calcFalsePosition();
    }else if (sampleFixedPoint != null){
      sampleFixedPoint!.equation = equation;
      sampleFixedPoint!.calcSampleFixedPoint();
    }else if (newton != null){
      newton!.equation = equation;
      newton!.calcNewton();
    }else if (secant != null){
      secant!.equation = equation;
      secant!.calcSecant();
    }
  }


}