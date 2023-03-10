import 'package:flutter/material.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

class FormScreen extends StatelessWidget {
  static const String routeName = 'Form Screen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            MyTextFormField("Test"),
          ],
        ),
      ),
    );
  }

  Widget MyTextFormField(String hintText){
    return Container(
      margin: const EdgeInsets.all(20) ,
      child: TextFormField(

        decoration: InputDecoration(
          filled: true,
          fillColor: MyTheme.gray,
          hintText: hintText,
          contentPadding:const EdgeInsets.all(20),
          enabledBorder:const OutlineInputBorder(
            borderSide: BorderSide(width: 3 , color: MyTheme.gray)
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3 , color: MyTheme.red)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3 , color: MyTheme.gray)
          ),
          disabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(width: 3 , color: MyTheme.gray)
          ),
        ),

      ),
    );
  }
}
