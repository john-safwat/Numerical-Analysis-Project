import 'package:flutter/material.dart';
import 'package:numericalanalysis/Form/FormNavigator.dart';
import 'package:numericalanalysis/Models/Bisection.dart';
import 'package:numericalanalysis/Models/FalsePosition.dart';
import 'package:numericalanalysis/Models/Newton.dart';
import 'package:numericalanalysis/Models/SampleFixedPoint.dart';
import 'package:numericalanalysis/Models/Secant.dart';
import 'package:numericalanalysis/Provider/NonlinearEquationsProvider.dart';

class FormScreenViewModel extends ChangeNotifier {
  FormNavigator? navigator;

  // function to validate the data and then sent it to home screen this function request the data from the form controllers
  void goToHomeScreen(bool formValidation,NonlinearEquationsProvider provider,
      {required String type,
      required String xl,
      required String xu,
      required String x,
      required String xOfIMin1,
      required String xOfI,
      required String error,
      required String numberOfIterations}) {
    if (formValidation) {
      if (type == 'Bisection' ){ // validate if the type is bisection then it will pass only the bisection parameters
        var xlI = double.parse(xl);
        var xuI = double.parse(xu);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){ // check if the number of iterations is null
          provider.bisection = Bisection(xlI: xlI, xuI: xuI, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        } else { // if the number of iteration is not null it will pass it
          var iterations = int.parse(numberOfIterations);
          provider.bisection = Bisection(xlI: xlI, xuI: xuI, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      } else if (type == 'FalsePosition'){ // validate if the type is false position then it will pass only the false position parameters
        var xlI = double.parse(xl);
        var xuI = double.parse(xu);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){ // check if the number of iterations is null
          provider.falsePosition = FalsePosition(xlI: xlI, xuI: xuI, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        } else { // if the number of iteration is not null it will pass it
          var iterations = int.parse(numberOfIterations);
          provider.falsePosition = FalsePosition(xlI: xlI, xuI: xuI, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      }else if (type == 'SampleFixedPoint'){ // validate if the type is sample fixed point then it will pass only the sample fixed point parameters
        var xI = double.parse(x);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){ // check if the number of iterations is null
          provider.sampleFixedPoint = SampleFixedPoint(xI: xI, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        } else { // if the number of iteration is not null it will pass it
          var iterations = int.parse(numberOfIterations);
          provider.sampleFixedPoint = SampleFixedPoint(xI: xI, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      }else if (type == 'Newton'){ // validate if the type is newton then it will pass only the newton parameters
        var xI = double.parse(x);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){ // check if the number of iterations is null
          provider.newton =  Newton(xI: xI, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        } else { // if the number of iteration is not null it will pass it
          var iterations = int.parse(numberOfIterations);
          provider.newton =  Newton(xI: xI, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      }else{ // validate if the type is secant then it will pass only the secant parameters
        var xI = double.parse(xOfI);
        var xIMin1 = double.parse(xOfIMin1);
        var errorStopPoint = double.parse(error);
        if(numberOfIterations.isEmpty){ // check if the number of iterations is null
          provider.secant = Secant(xOfI: xI, xOfIMin1: xIMin1, errorStopPoint: errorStopPoint);
          navigator?.goToHomeScreen();
        }else{ // if the number of iteration is not null it will pass it
          var iterations = int.parse(numberOfIterations);
          provider.secant = Secant(xOfI: xI, xOfIMin1: xIMin1, errorStopPoint: errorStopPoint , iterationLimit: iterations);
          navigator?.goToHomeScreen();
        }
      }
    }
  }

  // function to pop the currant screen from the widget tree
  // this function is making every object in the provider null to avoid the conflict if the user use the same method again
  // it will delete all the previous problem calculations to make it clear for the next use of the program
  void goToMainScreen(NonlinearEquationsProvider provider) {
    provider.bisection = null ;
    provider.falsePosition = null ;
    provider.sampleFixedPoint = null ;
    provider.newton = null ;
    navigator?.goToMainScreen();
  }

  // validation functions to validate on the input in the form text fields
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

  // validation functions to validate on the input in the form text fields to check if the number of iteration is integer
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
