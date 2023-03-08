import 'package:flutter/material.dart';
import 'package:numericalanalysis/Home/HomeScreen.dart';
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
        HomeScreen.routeName :(_) => HomeScreen(),
      },
      theme: MyTheme.themeData,
      initialRoute: HomeScreen.routeName,
    );

  }
}
