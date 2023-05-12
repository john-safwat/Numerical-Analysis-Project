import 'package:flutter/material.dart';
import 'package:numericalanalysis/Provider/NonlinearEquationsProvider.dart';
import 'package:numericalanalysis/Result/ShowRooTWidget.dart';
import 'package:numericalanalysis/Result/ShowTextWidget.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  static const String routeName = 'resultScreen';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NonlinearEquationsProvider>(context, listen: false);
    if (provider.bisection != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Bisection"),
        ),
        body:provider.bisection!.errorMessage != null?Column(
          children: [
            Text(
              provider.bisection!.errorMessage!,
              style:const TextStyle(
                color: MyTheme.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ) : Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ShowRootWidget(title: provider.bisection!.xr[provider.bisection!.xr.length-1]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  showTextWidget(title:"Iteration" , type: "iter"),
                  showTextWidget(title:"XL", type: "op"),
                  showTextWidget(title:"f(XL)", type: "op"),
                  showTextWidget(title:"XU", type: "op"),
                  showTextWidget(title:"f(XU)", type: "op"),
                  showTextWidget(title:"XR", type: "op"),
                  showTextWidget(title:"f(XR)", type: "op"),
                  showTextWidget(title:"Error", type: "op"),
                ],
              ),
              Expanded(child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    showTextWidget(title:provider.bisection!.iterations[index].toString() , type: "iter"),
                    showTextWidget(title:provider.bisection!.xl[index].toStringAsFixed(3), type: "-"),
                    showTextWidget(title:provider.bisection!.fxl[index].toStringAsFixed(3), type: "-"),
                    showTextWidget(title:provider.bisection!.xu[index].toStringAsFixed(3), type: "-"),
                    showTextWidget(title:provider.bisection!.fxu[index].toStringAsFixed(3), type: "-"),
                    showTextWidget(title:provider.bisection!.xr[index].toStringAsFixed(3), type: "-"),
                    showTextWidget(title:provider.bisection!.fxr[index].toStringAsFixed(3) , type: "-"),
                    showTextWidget(title:provider.bisection!.error[index].toStringAsFixed(3), type: "-"),
                  ],
                ),
                itemCount: provider.bisection!.iterations.length,
              )),
            ],
          ),
        ),
      );
    } else if (provider.falsePosition != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("False Position"),
        ),
        body:provider.falsePosition!.errorMessage != null?Column(
          children: [
            Text(
              provider.falsePosition!.errorMessage!,
              style:const TextStyle(
                  color: MyTheme.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ) : Column(
          children: [
            ShowRootWidget(title: provider.falsePosition!.xr[provider.falsePosition!.xr.length-1]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showTextWidget(title:"Iteration" , type: "iter"),
                showTextWidget(title:"XL", type: "op"),
                showTextWidget(title:"f(XL)", type: "op"),
                showTextWidget(title:"XU", type: "op"),
                showTextWidget(title:"f(XU)", type: "op"),
                showTextWidget(title:"XR", type: "op"),
                showTextWidget(title:"f(XR)", type: "op"),
                showTextWidget(title:"Error", type: "op"),
              ],
            ),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  showTextWidget(title:provider.falsePosition!.iterations[index].toString() , type: "iter"),
                  showTextWidget(title:provider.falsePosition!.xl[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.falsePosition!.fxl[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.falsePosition!.xu[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.falsePosition!.fxu[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.falsePosition!.xr[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.falsePosition!.fxr[index].toStringAsFixed(3) , type: "-"),
                  showTextWidget(title:provider.falsePosition!.error[index].toStringAsFixed(3), type: "-"),
                ],
              ),
              itemCount: provider.falsePosition!.iterations.length,
            )),
          ],
        ),
      );
    } else if (provider.sampleFixedPoint != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Sample Fixed Point"),
        ),
        body:  Column(
          children: [

            ShowRootWidget(title: provider.sampleFixedPoint!.x[provider.sampleFixedPoint!.x.length-1]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showTextWidget(title:"Iteration" , type: "iter"),
                showTextWidget(title:"X", type: "op"),
                showTextWidget(title:"f(X)", type: "op"),
                showTextWidget(title:"Error", type: "op"),
              ],
            ),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  showTextWidget(title:provider.sampleFixedPoint!.iterations[index].toString() , type: "iter"),
                  showTextWidget(title:provider.sampleFixedPoint!.x[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.sampleFixedPoint!.fx[index].toStringAsFixed(3) , type: "-"),
                  showTextWidget(title:provider.sampleFixedPoint!.error[index].toStringAsFixed(3), type: "-"),
                ],
              ),
              itemCount: provider.sampleFixedPoint!.iterations.length,
            )),
          ],
        ),
      );
    } else if (provider.newton != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Newton"),
        ),
        body: Column(
          children: [
            ShowRootWidget(title: provider.newton!.x[provider.newton!.x.length-1]),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showTextWidget(title:"Iteration" , type: "iter"),
                showTextWidget(title:"X", type: "op"),
                showTextWidget(title:"f(X)", type: "op"),
                showTextWidget(title:"f(Xd)", type: "op"),
                showTextWidget(title:"Error", type: "op"),
              ],
            ),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  showTextWidget(title:provider.newton!.iterations[index].toString() , type: "iter"),
                  showTextWidget(title:provider.newton!.x[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.newton!.fx[index].toStringAsFixed(3) , type: "-"),
                  showTextWidget(title:provider.newton!.fxd[index].toStringAsFixed(3) , type: "-"),
                  showTextWidget(title:provider.newton!.error[index].toStringAsFixed(3), type: "-"),
                ],
              ),
              itemCount: provider.newton!.iterations.length,
            )),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Secant"),
        ),
        body: Column(
          children: [
            ShowRootWidget(title: provider.secant!.xI[provider.secant!.xI.length-1]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showTextWidget(title:"Iteration" , type: "iter"),
                showTextWidget(title:"X i-1", type: "op"),
                showTextWidget(title:"f(X i-1)", type: "op"),
                showTextWidget(title:"X", type: "op"),
                showTextWidget(title:"f(X)", type: "op"),
                showTextWidget(title:"Error", type: "op"),
              ],
            ),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  showTextWidget(title:provider.secant!.iterations[index].toString() , type: "iter"),
                  showTextWidget(title:provider.secant!.xPrev[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.secant!.fXPrev[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.secant!.xI[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.secant!.fxI[index].toStringAsFixed(3), type: "-"),
                  showTextWidget(title:provider.secant!.error[index].toStringAsFixed(3), type: "-"),
                ],
              ),
              itemCount: provider.secant!.iterations.length,
            )),
          ],
        ),
      );
    }
  }
}

