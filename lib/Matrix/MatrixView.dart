import 'package:flutter/material.dart';
import 'package:numericalanalysis/Matrix/MatrixButton.dart';
import 'package:numericalanalysis/Matrix/MatrixTextField.dart';
import 'package:numericalanalysis/Matrix/MatrixViweModel.dart';
import 'package:provider/provider.dart';

class MatrixScreen extends StatefulWidget {
  static const String routeName = 'matrix screen ';

  @override
  State<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  MatriXViewModel viewModel = MatriXViewModel();



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Consumer<MatriXViewModel>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(50.0),
            child: Form(
              key: value.formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      MatrixButton("Gauss" , value.valid),
                      MatrixButton("Gauss" , value.valid),
                      MatrixButton("Gauss" , value.valid),
                      MatrixButton("Gauss" , value.valid),
                      MatrixButton("Gauss" , value.valid),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: MatrixTextField(controller: value.rowOneControllers[0], title: "X11" , validationFunction:value.validationFunction,)),
                              Expanded(child: MatrixTextField(controller: value.rowOneControllers[1], title: "X12" , validationFunction:value.validationFunction)),
                              Expanded(child: MatrixTextField(controller: value.rowOneControllers[2], title: "X13" , validationFunction:value.validationFunction)),
                              Expanded(child: MatrixTextField(controller: value.rowOneControllers[3], title: "X14" , validationFunction:value.validationFunction)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: MatrixTextField(controller: value.rowTwoControllers[0], title: "X21" , validationFunction:value.validationFunction)),
                              Expanded(child: MatrixTextField(controller: value.rowTwoControllers[1], title: "X22" , validationFunction:value.validationFunction)),
                              Expanded(child: MatrixTextField(controller: value.rowTwoControllers[2], title: "X23" , validationFunction:value.validationFunction)),
                              Expanded(child: MatrixTextField(controller: value.rowTwoControllers[3], title: "X24" , validationFunction:value.validationFunction)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: MatrixTextField(controller: value.rowThreeControllers[0], title: "X31" , validationFunction:value.validationFunction)),
                              Expanded(child: MatrixTextField(controller: value.rowThreeControllers[1], title: "X32" , validationFunction:value.validationFunction)),
                              Expanded(child: MatrixTextField(controller: value.rowThreeControllers[2], title: "X33" , validationFunction:value.validationFunction)),
                              Expanded(child: MatrixTextField(controller: value.rowThreeControllers[3], title: "X34" , validationFunction:value.validationFunction)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}



