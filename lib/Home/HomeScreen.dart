import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow:const [
                  BoxShadow(
                    color: MyTheme.black,
                    blurRadius: 10,
                    offset: Offset(-5,5)
                  )
                ],
                color: MyTheme.green
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child:Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow:const [
                    BoxShadow(
                        color: MyTheme.black,
                        blurRadius: 10,
                        offset: Offset(-5,5)
                    )
                  ],
                  color: MyTheme.red,
                )
            )
          ),

        ],
      ),
    );
  }
}
