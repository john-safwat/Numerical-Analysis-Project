import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Enter Your Equation",),
        centerTitle: true,
      ),
    );
  }
}
