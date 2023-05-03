import 'package:flutter/material.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

class MyButton extends StatelessWidget {
  String title;
  String type;
  int flex;
  Function changeTitleOnScreen;

  MyButton({
    required this.title,
    required this.type,
    required this.changeTitleOnScreen,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: (){
              changeTitleOnScreen(title);
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(5),
              backgroundColor: type == "num" ? MaterialStateProperty.all(MyTheme.gray)
                  : type == "op" ? MaterialStateProperty.all(MyTheme.red) : MaterialStateProperty.all(MyTheme.purple),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              shadowColor: MaterialStateProperty.all( MyTheme.black.withOpacity(0.8)),
            ),
            child: Text(
              title,
              style:const  TextStyle(
                color: MyTheme.white,
                fontSize: 22,
              ),
            )
        ),
      ),
    );
  }
}
