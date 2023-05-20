import 'package:flutter/material.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

class MatrixText extends StatelessWidget {
  String title;
  MatrixText(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        title,
        style: const TextStyle(
            color: MyTheme.white,
            fontSize: 26,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
