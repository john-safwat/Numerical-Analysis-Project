import 'package:flutter/cupertino.dart';

class Bisection {

  double xlI ;
  double xuI ;
  double errorStopPoint ;
  String equation = '';
  int? iterationLimit ;

  List<double> xl = [];
  List<double> fxl = [];
  List<double> xu = [];
  List<double> fxu = [];
  List<double> xr = [];
  List<double> fxr = [];
  List<double> error = [] ;
  List<int> iterations = [];

  Bisection({required this.xlI , required this.xuI , required this.errorStopPoint , this.iterationLimit});


  @override
  void PrintData() {
    debugPrint(xlI.toString());
    debugPrint(xuI.toString());
    debugPrint(errorStopPoint.toString());
    if(iterationLimit != null){
      debugPrint(iterationLimit!.toString());
    }
  }

}