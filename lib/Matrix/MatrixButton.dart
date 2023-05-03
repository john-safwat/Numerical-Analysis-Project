import 'package:flutter/material.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

class MatrixButton extends StatelessWidget {
  String title ;
  Function onButtonPress;
  MatrixButton(this.title , this.onButtonPress);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: (){
            onButtonPress();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.red),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              title,
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: MyTheme.black
              ),
            ),
          ),
        ),
      )
    );
  }
}
