import 'package:flutter/material.dart';
import 'package:numericalanalysis/Provider/objectProvider.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = 'resultScreen';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ObjectProvider>(context, listen: false);
    if (provider.bisection != null) {
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
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.bisection!.xl[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.bisection!.fxl[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.bisection!.xu[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.bisection!.fxu[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.bisection!.xr[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.bisection!.fxr[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.bisection!.error[index].toString()),
                ],
              ),
              itemCount: provider.bisection!.iterations.length,
              separatorBuilder: (context, index) => Container(
                height: 2,
                width: double.infinity,
                color: Colors.red,
              ),
            )),
          ],
        ),
      );
    } else if (provider.falsePosition != null) {
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
                  Text(provider.falsePosition!.iterations[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.falsePosition!.xl[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.falsePosition!.fxl[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.falsePosition!.xu[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.falsePosition!.fxu[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.falsePosition!.xr[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.falsePosition!.fxr[index].toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(provider.falsePosition!.error[index].toString()),
                ],
              ),
              itemCount: provider.falsePosition!.iterations.length,
              separatorBuilder: (context, index) => Container(
                height: 2,
                width: double.infinity,
                color: Colors.red,
              ),
            )),
          ],
        ),
      );
    } else if (provider.sampleFixedPoint != null) {
      provider.sampleFixedPoint!.calcSampleFixedPoint();
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: const [
                Text("i"),
                Text("x"),
                Text("fx"),
                Text("error"),
              ],
            ),
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) => Row(
                children: [
                  Text(provider.sampleFixedPoint!.iterations[index].toString()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(provider.sampleFixedPoint!.x[index].toString()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(provider.sampleFixedPoint!.fx[index].toString()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(provider.sampleFixedPoint!.error[index].toString()),
                ],
              ),
              itemCount: provider.sampleFixedPoint!.iterations.length,
              separatorBuilder: (context, index) => Container(
                height: 2,
                width: double.infinity,
                color: Colors.red,
              ),
            )),
          ],
        ),
      );
    } else if (provider.newton != null) {
      provider.newton!.calcNewton();
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: const [
                Text("i"),
                Text("x"),
                Text("fx"),
                Text("fxd"),
                Text("error"),
              ],
            ),
            Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Row(
                    children: [
                      Text(provider.newton!.iterations[index].toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(provider.newton!.x[index].toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(provider.newton!.fx[index].toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(provider.newton!.fxd[index].toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(provider.newton!.error[index].toString()),
                    ],
                  ),
                  itemCount: provider.newton!.iterations.length,
                  separatorBuilder: (context, index) => Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                )),
          ],
        ),
      );
    } else {
      return Scaffold();
    }
  }
}
