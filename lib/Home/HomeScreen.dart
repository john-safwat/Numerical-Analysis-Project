import 'package:flutter/material.dart';
import 'package:numericalanalysis/Main/MainScreen.dart';
import 'package:numericalanalysis/Matrix/MatrixView.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = " home screen ";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg' ,),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, MatrixScreen.routeName);
                      },
                      child: Image.asset("assets/images/Matrices.png")
                    ),
                  ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, MainScreen.routeName);
                    },
                    child: Image.asset("assets/images/NonLinerEquation.png")
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
