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

  void calcSampleFixedPoint(){
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