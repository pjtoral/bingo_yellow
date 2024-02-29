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
              Stack(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors
                                    .amber, // Amber glow color// Spread of the glow
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
                              padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                              child: Text(
                                'BINGO',
                                style: TextStyle(fontSize: 50),
                              )),
                        ),
                      ],
                    )
                  ]),
                  Positioned(
                    left: -20, // Positioned on the left
                    top: -15, // Positioned on the top
                    child: Image.asset(
                      'assets/1.png', // Path to your image in the assets folder
                      width: 100, // Set width of the image
                      height: 100, // Set height of the image
                    ),
                  ),
                  Positioned(
                    bottom: -5, // Positioned on the left
                    right: -25, // Positioned on the top
                    child: Image.asset(
                      'assets/2.png', // Path to your image in the assets folder
                      width: 100, // Set width of the image
                      height: 100, // Set height of the image
                    ),
                  ),
                ],
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