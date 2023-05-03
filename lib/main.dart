import 'package:flutter/material.dart';
import 'package:numericalanalysis/Calculator/HomeScreenView.dart';
import 'package:numericalanalysis/Form/FormScreen.dart';
import 'package:numericalanalysis/Main/MainScreen.dart';
import 'package:numericalanalysis/Matrix/MatrixView.dart';
import 'package:numericalanalysis/Result/ResultScreen.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';
import 'package:provider/provider.dart';

import 'Provider/objectProvider.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ObjectProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          MainScreen.routeName :(_) => MainScreen(),
          FormScreen.routeName :(_) => FormScreen(),
          HomeScreen.routeName :(_) => HomeScreen(),
          ResultScreen.routeName : (_) => ResultScreen(),
          MatrixScreen.routeName :(_) => MatrixScreen()
        },
        theme: MyTheme.themeData,
        initialRoute: MatrixScreen.routeName,
      ),
    );

  }
}
