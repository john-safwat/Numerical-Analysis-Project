import 'package:flutter/material.dart';
import 'package:numericalanalysis/Matrix/MatrixViweModel.dart';
import 'package:provider/provider.dart';

import 'MatrixTextField.dart';

class MyForm extends StatefulWidget {
  MatriXViewModel viewModel ;
  MyForm(this.viewModel);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  void dispose() {
    super.dispose();
    widget.viewModel.readInputs();
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: widget.viewModel.formKey,
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowOneControllers[0], title: "X11" , validationFunction:widget.viewModel.validationFunction,)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowOneControllers[1], title: "X12" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowOneControllers[2], title: "X13" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowOneControllers[3], title: "X14" , validationFunction:widget.viewModel.validationFunction)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowTwoControllers[0], title: "X21" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowTwoControllers[1], title: "X22" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowTwoControllers[2], title: "X23" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowTwoControllers[3], title: "X24" , validationFunction:widget.viewModel.validationFunction)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowThreeControllers[0], title: "X31" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowThreeControllers[1], title: "X32" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowThreeControllers[2], title: "X33" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowThreeControllers[3], title: "X34" , validationFunction:widget.viewModel.validationFunction)),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
