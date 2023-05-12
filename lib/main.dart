import 'package:flutter/material.dart';
import 'package:numericalanalysis/Calculator/CalculatorScreenView.dart';
import 'package:numericalanalysis/Form/FormScreen.dart';
import 'package:numericalanalysis/Main/MainScreen.dart';
import 'package:numericalanalysis/Matrix/MatrixView.dart';
import 'package:numericalanalysis/Result/ResultScreen.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';
import 'package:provider/provider.dart';

import 'Provider/NonlinearEquationsProvider.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NonlinearEquationsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          MainScreen.routeName :(_) => MainScreen(),
          FormScreen.routeName :(_) => FormScreen(),
          CalculatorScreen.routeName :(_) => CalculatorScreen(),
          ResultScreen.routeName : (_) => ResultScreen(),
          MatrixScreen.routeName :(_) => MatrixScreen()
        },
        theme: MyTheme.themeData,
        initialRoute: MatrixScreen.routeName,
      ),
    );

  }
}
