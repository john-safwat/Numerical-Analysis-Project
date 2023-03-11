import 'package:calculess/calculess.dart';
import 'package:math_expressions/math_expressions.dart';

class Newton{
  double xI ;
  double errorStopPoint ;
  String equation = '';
  int? iterationLimit ;

  List<double> x = [];
  List<double> fx = [];
  List<double> fxd = [];
  List<double> error = [];
  List<int> iterations = [];

  Newton({required this.xI ,required this.errorStopPoint , this.iterationLimit = 0});

  double calcFunction(double xValue){
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    cm.bindVariable(x,Number(xValue));
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  double calcFunctionWithDerivative(double xValue){
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(equation);
    Expression expDerived = exp.derive('x');
    ContextModel cm = ContextModel();
    cm.bindVariable(x,Number(xValue));
    return expDerived.evaluate(EvaluationType.REAL, cm);
  }

  void calcNewton(){
    if (iterationLimit != 0){
      for(int i = 0 ; i< iterationLimit! ; i++ ){
        iterations.add(i);
        x.add(xI);
        fx.add(calcFunction(x[i]));
        fxd.add(calcFunctionWithDerivative(x[i]));

        if(i == 0 ){
          error.add(100);
        }else {
          error.add(((x[i] - x[i-1]) / x[i]).abs() * 100);
        }

        xI = x[i] - (fx[i]/fxd[i]);
      }
    }else {
      int i = -1;
      do {
        i++;
        iterations.add(i);
        x.add(xI);
        fx.add(calcFunction(x[i]));
        fxd.add(calcFunctionWithDerivative(x[i]));

        if(i == 0 ){
          error.add(100);
        }else {
          error.add(((x[i] - x[i-1]) / x[i]).abs() * 100);
        }

        xI = x[i] - (fx[i]/fxd[i]);
      }while(error[i] >= errorStopPoint);
    }
  }


}