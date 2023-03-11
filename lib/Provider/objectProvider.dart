import 'package:flutter/material.dart';
import 'package:numericalanalysis/Models/Bisection.dart';
import 'package:numericalanalysis/Models/FalsePosition.dart';
import 'package:numericalanalysis/Models/Newton.dart';
import 'package:numericalanalysis/Models/SampleFixedPoint.dart';

class ObjectProvider extends ChangeNotifier {
  Bisection? bisection;
  FalsePosition? falsePosition ;
  SampleFixedPoint? sampleFixedPoint;
  Newton? newton ;

  void setEquation(String equation){
    if(bisection!= null){
      bisection!.equation = equation;
    }else if (falsePosition != null){
      falsePosition!.equation = equation;
    }else if (sampleFixedPoint != null){

    }else if (newton != null){

    }
  }


}