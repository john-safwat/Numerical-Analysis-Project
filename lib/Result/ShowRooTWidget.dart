import 'package:flutter/material.dart';

class ShowRootWidget extends StatelessWidget {
  double title ;
  ShowRootWidget({required this.title});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text( "Root : ${title.toStringAsFixed(3)}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}
