import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'bingo_viewmodel.dart';
import 'package:bingo_yellow/ui/views/table/table_view.dart';

class BingoView extends StackedView<BingoViewModel> {
  const BingoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BingoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: viewModel.navigateToHome,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color:
                          Colors.amber, // Amber glow color// Spread of the glow
                      spreadRadius: 7.0, // How much the glow extends
                    ),
                    BoxShadow(
                      color: Colors.white, // Black border color
                      blurRadius: 2.0, // Spread of the border
                      spreadRadius: 0.0, // Border has no spread
                    ),
                  ],
                ),
                child: const Padding(
                    padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                    child: Text(
                      'BINGO',
                      style: TextStyle(fontSize: 50),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              const TableView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  BingoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BingoViewModel();
}
