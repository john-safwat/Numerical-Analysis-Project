import 'package:flutter/material.dart';
import 'package:numericalanalysis/Provider/objectProvider.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = 'resultScreen';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ObjectProvider>(context , listen: false);
    if (provider.bisection != null){
      provider.bisection!.calcBisection();
      debugPrint(provider.bisection!.iterations.length.toString());
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: const [
                Text("i"),
                Text("xl"),
                Text("fxl"),
                Text("xu"),
                Text("fxu"),
                Text("xr"),
                Text("fxr"),
                Text("error"),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Row(
                  children: [
                    Text(provider.bisection!.iterations[index].toString()),
                    const SizedBox(width: 5,),
                    Text(provider.bisection!.xl[index].toString()),
                    const SizedBox(width: 5,),
                    Text(provider.bisection!.fxl[index].toString()),
                    const SizedBox(width: 5,),
                    Text(provider.bisection!.xu[index].toString()),
                    const SizedBox(width: 5,),
                    Text(provider.bisection!.fxu[index].toString()),
                    const SizedBox(width: 5,),
                    Text(provider.bisection!.xr[index].toString()),
                    const SizedBox(width: 5,),
                    Text(provider.bisection!.fxr[index].toString()),
                    const SizedBox(width: 5,),
                    Text(provider.bisection!.error[index].toString()),
                  ],
                ),
                itemCount: provider.bisection!.iterations.length,
                separatorBuilder: (context, index) => Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.red,
                ),
              )
            ),
          ],
        ),
      );
    }else if (provider.falsePosition != null){
      provider.falsePosition!.calcFalsePosition();
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: const [
                Text("i"),
                Text("xl"),
                Text("fxl"),
                Text("xu"),
                Text("fxu"),
                Text("xr"),
                Text("fxr"),
                Text("error"),
              ],
            ),
            Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Row(
                    children: [
                      Text(provider.bisection!.iterations[index].toString()),
                      const SizedBox(width: 5,),
                      Text(provider.bisection!.xl[index].toString()),
                      const SizedBox(width: 5,),
                      Text(provider.bisection!.fxl[index].toString()),
                      const SizedBox(width: 5,),
                      Text(provider.bisection!.xu[index].toString()),
                      const SizedBox(width: 5,),
                      Text(provider.bisection!.fxu[index].toString()),
                      const SizedBox(width: 5,),
                      Text(provider.bisection!.xr[index].toString()),
                      const SizedBox(width: 5,),
                      Text(provider.bisection!.fxr[index].toString()),
                      const SizedBox(width: 5,),
                      Text(provider.bisection!.error[index].toString()),
                    ],
                  ),
                  itemCount: provider.bisection!.iterations.length,
                  separatorBuilder: (context, index) => Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                )
            ),
          ],
        ),
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
