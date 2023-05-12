import 'package:flutter/material.dart';
import 'package:numericalanalysis/Calculator/CalculatorScreenNavigator.dart';
import 'package:numericalanalysis/Calculator/CalculatorScreenViewModel.dart';
import 'package:numericalanalysis/Provider/NonlinearEquationsProvider.dart';
import 'package:numericalanalysis/Result/ResultScreen.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';
import 'package:provider/provider.dart';

import 'MyButton.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> implements CalculatorScreenNavigator{
  CalculatorScreenViewModel viewModel = CalculatorScreenViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }
  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // top Screen
              Consumer<CalculatorScreenViewModel>(
                builder: (context, value, child) => Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: MyTheme.black.withOpacity(0.4),
                              blurRadius: 5,
                              offset: const Offset(0, 5))
                        ],
                        color: MyTheme.green),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              value.titleOnScreen,
                              style: const TextStyle(
                                  color: MyTheme.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )),
                            Text(
                              value.validationMessage,
                              style: const TextStyle(
                                  color: MyTheme.gray,
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyButton(
                        title: "(",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: ")",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "log10(",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "^",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "e",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "/",
                        type: "op",
                        changeTitleOnScreen: changeTitleOnScreen),
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyButton(
                        title: "sin(",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "cos(",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "7",
                        type: "num",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "8",
                        type: "num",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "9",
                        type: "num",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "*",
                        type: "op",
                        changeTitleOnScreen: changeTitleOnScreen),
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyButton(
                        title: "tan(",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "x",
                        type: "math",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "4",
                        type: "num",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "5",
                        type: "num",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "6",
                        type: "num",
                        changeTitleOnScreen: changeTitleOnScreen),
                    MyButton(
                        title: "-",
                        type: "op",
                        changeTitleOnScreen: changeTitleOnScreen),
                  ],
                ),
              ),

              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyButton(
                              title: "Home",
                              type: "op",
                              changeTitleOnScreen: changeTitleOnScreen
                            ),
                          ],
                        )
                      ),
                      Expanded(
                        flex: 5,
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyButton(
                                    title: "Back",
                                    type: "math",
                                    changeTitleOnScreen: changeTitleOnScreen),
                                MyButton(
                                    title: "1",
                                    type: "num",
                                    changeTitleOnScreen: changeTitleOnScreen),
                                MyButton(
                                    title: "2",
                                    type: "num",
                                    changeTitleOnScreen: changeTitleOnScreen),
                                MyButton(
                                    title: "3",
                                    type: "num",
                                    changeTitleOnScreen: changeTitleOnScreen),
                                MyButton(
                                    title: "+",
                                    type: "op",
                                    changeTitleOnScreen: changeTitleOnScreen),
                              ],
                            )),
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                MyButton(
                                    title: "Clear",
                                    type: "math",
                                    changeTitleOnScreen: changeTitleOnScreen),
                                MyButton(
                                    title: "0",
                                    type: "num",
                                    flex: 2,
                                    changeTitleOnScreen: changeTitleOnScreen),
                                MyButton(
                                    title: ".",
                                    type: "num",
                                    changeTitleOnScreen: changeTitleOnScreen),
                                MyButton(
                                    title: "Next",
                                    type: "op",
                                    changeTitleOnScreen: changeTitleOnScreen),

                              ],
                            ))
                          ],
                        )
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void changeTitleOnScreen(String title) {
    viewModel.changeTitleOnScreen(title);
  }

  @override
  void goToFormScreen() {
    Navigator.pop(context);
  }

  @override
  void goToResultScreen() {
    var provider = Provider.of<NonlinearEquationsProvider>(context , listen: false);
    provider.setEquation(viewModel.titleOnScreen);
    Navigator.pushReplacementNamed(context, ResultScreen.routeName);
  }
}
