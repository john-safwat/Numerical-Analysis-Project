import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';

class MatrixTextField extends StatelessWidget {
  TextEditingController controller ;
  Function validationFunction;
  String title ;

  MatrixTextField({
    required this.controller,
    required this.title,
    required this.validationFunction
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
      child: TextFormField(
          validator: (value) => validationFunction(value),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9,.,-]+')),],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          cursorColor: MyTheme.black,
          style:const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: MyTheme.black
          ),
          decoration: InputDecoration(
            contentPadding:const EdgeInsets.all(30),
            filled: true,
            fillColor: MyTheme.purple,
            hintText: title,
            hintStyle: const TextStyle(
              color: MyTheme.gray,
              fontSize: 24,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:const BorderSide(
                width: 2,
                color: MyTheme.white
              )
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:const BorderSide(
                    width: 2,
                    color: MyTheme.red
                )
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:const BorderSide(
                    width: 2,
                    color: MyTheme.white
                )
            ),
            errorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:const BorderSide(
                    width: 2,
                    color:MyTheme.red
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:const BorderSide(
                    width: 2,
                    color: MyTheme.white
                )
            ),

          ),

      ),
    );
  }
}
