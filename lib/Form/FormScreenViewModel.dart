import 'package:flutter/cupertino.dart';
import 'package:numericalanalysis/Form/FormNavigator.dart';
import 'package:numericalanalysis/Models/Bisection.dart';
import 'package:numericalanalysis/Models/FalsePosition.dart';
import 'package:numericalanalysis/Models/Newton.dart';
import 'package:numericalanalysis/Models/SampleFixedPoint.dart';
import 'package:numericalanalysis/Provider/objectProvider.dart';
import 'package:provider/provider.dart';

class FormScreenViewModel extends ChangeNotifier {
  FormNavigator? navigator;

  void goToHomeScreen(bool formValidation,ObjectProvider provider,
      {required String type,
      required String xl,
      required String xu,
      required String x,
      required String xOfIMin1,
      required String xOfI,
      required String error,
      required String numberOfIterations}) {
    if (formValidation) {
      if (type == 'Bisection' ){
        var xlI = double.parse(xl);
        var xuI = double.parse(xu);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){
          provider.bisection = Bisection(xlI: xlI, xuI: xuI, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        } else {
          var iterations = int.parse(numberOfIterations);
          provider.bisection = Bisection(xlI: xlI, xuI: xuI, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      } else if (type == 'FalsePosition'){
        var xlI = double.parse(xl);
        var xuI = double.parse(xu);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){
          provider.falsePosition = FalsePosition(xlI: xlI, xuI: xuI, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        } else {
          var iterations = int.parse(numberOfIterations);
          provider.falsePosition = FalsePosition(xlI: xlI, xuI: xuI, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      }else if (type == 'SampleFixedPoint'){
        var xI = double.parse(x);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){
          provider.sampleFixedPoint = SampleFixedPoint(xI: xI, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        } else {
          var iterations = int.parse(numberOfIterations);
          provider.sampleFixedPoint = SampleFixedPoint(xI: xI, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      }else if (type == 'Newton'){
        var xI = double.parse(x);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){
          provider.newton =  Newton(xI: xI, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        } else {
          var iterations = int.parse(numberOfIterations);
          provider.newton =  Newton(xI: xI, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      }
    }
  }

  void goToMainScreen() {
    navigator?.goToMainScreen();
  }

  String? isValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Number";
    }
    int dotCount = 0;
    for (int i = 0; i < value.length; i++) {
      if (value[i] == '.') {
        dotCount++;
      }
    }
    if (dotCount > 1) {
      return "There Are $dotCount Decimal Points in This Number (it's Invalid)";
    }
    return null;
  }

  String? isValidIteration(String? value) {
    if (value!.isNotEmpty) {
      for (int i = 0; i < value.length; i++) {
        if (value[i] == '.') {
          return "The Number of Iterations Must Be Integer";
        }
      }
    }
    return null;
  }
}
