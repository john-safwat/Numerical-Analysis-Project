import 'package:flutter/material.dart';

import '../Theme/MyTheme.dart';

class MatrixContainer extends StatelessWidget {

  String title ;
  MatrixContainer(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: MyTheme.green,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(
          title,
          style:const TextStyle(
              color: MyTheme.black,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        )
    );
  }
}
