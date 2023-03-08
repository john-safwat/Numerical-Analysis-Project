import 'package:flutter/material.dart';
import 'package:numericalanalysis/Home/MyButton.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // top Screen
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: MyTheme.black.withOpacity(0.4),
                      blurRadius: 5,
                      offset:const Offset(0,5)
                    )
                  ],
                  color: MyTheme.green
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "√", type: "math"),
                  MyButton(title: "^", type: "math"),
                  MyButton(title: "%", type: "math"),
                  MyButton(title: "/", type: "op"),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "7", type: "num"),
                  MyButton(title: "8", type: "num"),
                  MyButton(title: "9", type: "num"),
                  MyButton(title: "*", type: "op"),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "4", type: "num"),
                  MyButton(title: "5", type: "num"),
                  MyButton(title: "6", type: "num"),
                  MyButton(title: "-", type: "op"),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "1", type: "num"),
                  MyButton(title: "2", type: "num"),
                  MyButton(title: "3", type: "num"),
                  MyButton(title: "+", type: "op"),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "nan", type: "math"),
                  MyButton(title: "0", type: "num", flex: 2,),
                  MyButton(title: ".", type: "num"),
                  MyButton(title: "=", type: "op"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
