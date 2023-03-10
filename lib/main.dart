import 'package:flutter/material.dart';
import 'package:numericalanalysis/Form/FormScreen.dart';
import 'package:numericalanalysis/Home/HomeScreenView.dart';
import 'package:numericalanalysis/Main/MainScreen.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MainScreen.routeName :(_) => MainScreen(),
        FormScreen.routeName :(_) => FormScreen(),
        HomeScreen.routeName :(_) => HomeScreen(),
      },
      theme: MyTheme.themeData,
      initialRoute: MainScreen.routeName,
    );

  }
}
