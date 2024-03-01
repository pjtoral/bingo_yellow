import 'package:flutter/material.dart';
import 'package:bingo_yellow/themes/theme.dart';
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
        title: const Text('Bingo Card'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/7.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               const  SizedBox(
                                  height: 150,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors
                                                .amber, // Amber glow color// Spread of the glow
                                            spreadRadius:
                                                7.0, // How much the glow extends
                                          ),
                                          BoxShadow(
                                            color: Colors
                                                .white, // Black border color
                                            blurRadius:
                                                2.0, // Spread of the border
                                            spreadRadius:
                                                0.0, // Border has no spread
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              70, 10, 70, 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                for (int i = 0;
                                                    i < 'BINGO'.length;
                                                    i++)
                                                  TextSpan(
                                                    text: 'BINGO'[i],
                                                    style: TextStyle(
                                                      fontSize: 55,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          getColorForLetter(i),
                                                      shadows: [
                                                        Shadow(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  1), // Shadow color
                                                          offset: const Offset(
                                                              3,
                                                              3), // Shadow offset
                                                          blurRadius:
                                                              0, // Shadow blur radius
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
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
            ],
          )),
    );
  }
  @override
  BingoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BingoViewModel();
}