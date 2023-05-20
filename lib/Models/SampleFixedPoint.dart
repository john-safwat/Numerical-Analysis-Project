import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';

class SampleFixedPoint {
  double xI ;
  double errorStopPoint ;
  String equation = '';
  int? iterationLimit ;

  List<double> x = [];
  List<double> fx = [];
  List<double> error = [];
  List<int> iterations = [];

  SampleFixedPoint({required this.xI , required this.errorStopPoint , this.iterationLimit = 0});

  double calcFunction(double xValue){
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    cm.bindVariable(x,Number(xValue));
    return exp.evaluate(EvaluationType.REAL, cm);
  }
  //
  // void simplifyEquation(){
  //   var maxPow = 1;
  //   // for(int i = 0 ; i<equation.length ;i++){
  //   //   if(equation[i] == '^'){
  //   //     if(double.parse(equation[i+1]) > maxPow){
  //   //
  //   //     }
  //   //   }
  //   // }
  //
  //   List<String> term = equation.split(RegExp(r'[+\-]'));
  //
  //   if (equation[0]=="-"){
  //     term[1] = "-${term[1]}";
  //     term.removeAt(0);
  //   }
  //
  //   List<String> values = [];
  //
  //   for (int i = 0  ; i<term.length ; i++){
  //     if(term[i].contains("x^")){
  //       for(int j = 0 ;j<term[i].length ; j++){
  //         if(term[i][j] == "^"){
  //           var value = '';
  //           for(int k =j+1 ; k<term[i].length ; k++){
  //             value = value + term[i][k] ;
  //           }
  //           values.add(value);
  //           break;
  //         }
  //       }
  //     }
  //   }
  //
  //   for(int i = 0 ; i<values.length;i++ ){
  //     debugPrint(values[i]);
  //   }
  //
  // }

  void calcSampleFixedPoint(){
    // simplifyEquation();
    if (iterationLimit != 0){
      for(int i = 0 ; i< iterationLimit! ; i++ ){ // 0 = x = fx = error
        iterations.add(i);
        x.add(xI);
        fx.add(calcFunction(x[i]));

        if(i == 0 ){
          error.add(100);
        }else {
          error.add(((x[i] - x[i-1]) / x[i]).abs() * 100);
        }
        xI = fx[i];
      }
    }else {
      int i = -1;
      do {
        i++;
        iterations.add(i);
        x.add(xI);
        fx.add(calcFunction(x[i]));

        if(i == 0 ){
          error.add(100);
        }else {
          error.add(((x[i] - x[i-1]) / x[i]).abs() * 100);
        }
        xI = fx[i];
      } while(error[i] >= errorStopPoint);
    }
  }

}