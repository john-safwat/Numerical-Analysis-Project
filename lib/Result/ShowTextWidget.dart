
import 'package:flutter/material.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

class showTextWidget extends StatelessWidget {
  String title ;
  String type ;
  showTextWidget({required this.title , required this.type});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height:55,
        margin:const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: type == "iter" ? MyTheme.purple : type == "op"? MyTheme.red :MyTheme.gray,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}