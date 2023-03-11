import 'package:flutter/material.dart';
import 'package:numericalanalysis/Provider/objectProvider.dart';
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
    var provider = Provider.of<ObjectProvider>(context, listen: false);
    if (provider.bisection != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Bisection"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
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
        body: Column(
          children: [
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
        body:  Column(
          children: [
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