import 'package:math_expressions/math_expressions.dart';

class Secant {
  double xOfI ;
  double xOfIMin1 ;
  double errorStopPoint ;
  String equation = '';
  int? iterationLimit ;

  List<double> xI = [];
  List<double> fxI = [];
  List<double> xPrev = [];
  List<double> fXPrev = [];
  List<double> error = [];
  List<int> iterations = [];

  Secant({
    required this.xOfI,
    required this.xOfIMin1,
    required this.errorStopPoint,
    this.iterationLimit
  });

  double calcFunction(double xValue){
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    cm.bindVariable(x,Number(xValue));
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  void calcSecant(){
    if(iterationLimit != null){
      for(int i =0 ; i< iterationLimit! ;i++){
        xPrev.add(xOfIMin1);
        fXPrev.add(calcFunction(xPrev[i]));
        xI.add(xOfI);
        fxI.add(calcFunction(xI[i]));
        error.add((((xI[i] - xPrev[i])/xI[i]).abs() * 100 ));
        xOfI = xOfI - ((calcFunction(xOfI)*(xOfIMin1 - xOfI))/((calcFunction(xOfIMin1))- calcFunction(xOfI)));
        xOfIMin1 = xI[i];
        iterations.add(i);
        if (error[i]<errorStopPoint){
          break;
        }
      }
    }else {
      int i = -1;
      do{
        i++;
        xPrev.add(xOfIMin1);
        fXPrev.add(calcFunction(xPrev[i]));
        xI.add(xOfI);
        fxI.add(calcFunction(xI[i]));
        error.add((((xI[i] - xPrev[i])/xI[i]).abs() * 100 ));
        xOfI = xOfI - ((calcFunction(xOfI)*(xOfIMin1 - xOfI))/((calcFunction(xOfIMin1))- calcFunction(xOfI)));
        xOfIMin1 = xI[i];
        iterations.add(i);
      }while(error[i]>errorStopPoint);
    }
  }

}