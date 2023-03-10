import 'package:flutter/material.dart';
import 'package:numericalanalysis/Provider/objectProvider.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = 'resultScreen';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ObjectProvider>(context , listen: false);
    if (provider.bisection != null){
      return Scaffold(
        body: Center(
          child: Text(provider.bisection!.equation),
        ),
      );
    }else if (provider.falsePosition != null){
      return Scaffold(

      );
    }else if (provider.sampleFixedPoint != null){
      return Scaffold(

      );
    }else if (provider.newton != null){
      return Scaffold(

      );
    }else {
      return Scaffold(

      );
    }
  }
}
