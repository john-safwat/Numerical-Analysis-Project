import 'package:flutter/material.dart';
import 'package:numericalanalysis/Home/HomeScreenViewModel.dart';
import 'package:numericalanalysis/Home/MyButton.dart';
import 'package:numericalanalysis/Theme/MyTheme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

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
              Consumer<HomeScreenViewModel>(
                builder: (context, value, child) => Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: MyTheme.black.withOpacity(0.4),
                          blurRadius: 5,
                          offset:const Offset(0,5)
                        )
                      ],
                      color: MyTheme.green
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            value.titleOnScreen,
                            style:const TextStyle(
                              color: MyTheme.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                            ),
                          )
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
                    MyButton(title: "nan", type: "math" ,changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "nan", type: "math" ,changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "√", type: "math",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "^", type: "math" ,changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "%", type: "math" ,changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "/", type: "op",changeTitleOnScreen: ChangeTitleOnScreen),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyButton(title: "nan", type: "math" ,changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "nan", type: "math",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "7", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "8", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "9", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "*", type: "op",changeTitleOnScreen: ChangeTitleOnScreen),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyButton(title: "nan", type: "math",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "nan", type: "math",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "4", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "5", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "6", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "-", type: "op",changeTitleOnScreen: ChangeTitleOnScreen),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyButton(title: "nan", type: "math",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "nan", type: "math",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "1", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "2", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "3", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "+", type: "op",changeTitleOnScreen: ChangeTitleOnScreen),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyButton(title: "nan", type: "math",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "nan", type: "math",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "0", type: "num", flex: 2,changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: ".", type: "num",changeTitleOnScreen: ChangeTitleOnScreen),
                    MyButton(title: "=", type: "op",changeTitleOnScreen: ChangeTitleOnScreen),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ChangeTitleOnScreen (String title){
    viewModel.changeTitleOnScreen(title);
  }
}
