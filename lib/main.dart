import 'package:flutter/material.dart';
import 'package:numericalanalysis/Calculator/CalculatorScreenView.dart';
import 'package:numericalanalysis/Form/FormScreen.dart';
import 'package:numericalanalysis/Home/HomeScreen.dart';
import 'package:numericalanalysis/Main/MainScreen.dart';
import 'package:numericalanalysis/Matrix/MatrixView.dart';
import 'package:numericalanalysis/Provider/MatricesProvider.dart';
import 'package:numericalanalysis/Result/MatricesResultScreen.dart';
import 'package:numericalanalysis/Result/ResultScreen.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';
import 'package:provider/provider.dart';

import 'Provider/NonlinearEquationsProvider.dart';

void main (){
  runApp(MultiProvider(
      providers :[
        ChangeNotifierProvider<NonlinearEquationsProvider>(create: (context) => NonlinearEquationsProvider(), ),
        ChangeNotifierProvider<MatricesProvider>(create: (context) => MatricesProvider(),),
      ] ,
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName :(_) => HomeScreen(),
          MainScreen.routeName :(_) => MainScreen(),
          FormScreen.routeName :(_) => FormScreen(),
          CalculatorScreen.routeName :(_) => CalculatorScreen(),
          ResultScreen.routeName : (_) => ResultScreen(),
          MatrixScreen.routeName :(_) => MatrixScreen(),
          MatricesResultScreen.routeName :(_) => MatricesResultScreen(),
        },
        theme: MyTheme.themeData,
        initialRoute: HomeScreen.routeName,

    );

  }
}
