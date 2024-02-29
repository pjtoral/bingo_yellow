import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'table_viewmodel.dart';

class TableView extends StackedView<TableViewModel> {
  const TableView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TableViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 25,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (context, index) {
                      int j = index ~/ 5; // Row index
                      int i = index % 5;
                      if (index == 12) {
                        return SizedBox(
                          child: Center(
                            child: Image.asset(
                              'assets/4.png',
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                          child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text('${viewModel.numbers[i][j]}'),
                          ),
                        ),
                      ));
                    },
                  )),
            ])),
        Positioned(
          bottom: -5, // Positioned on the left
          right: -10, // Positioned on the top
          child: Image.asset(
            'assets/6.png', // Path to your image in the assets folder
            width: 60, // Set width of the image
            height: 60, // Set height of the image
          ),
        ),
        Positioned(
          top: -5, // Positioned on the left
          left: 1, // Positioned on the top
          child: Image.asset(
            'assets/3.png', // Path to your image in the assets folder
            width: 60, // Set width of the image
            height: 60, // Set height of the image
          ),
        ),
        Positioned(
          bottom: -5, // Positioned on the left
          left: -10, // Positioned on the top
          child: Image.asset(
            'assets/5.png', // Path to your image in the assets folder
            width: 60, // Set width of the image
            height: 60, // Set height of the image
          ),
        ),
      ],
    );
  }

  @override
  TableViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TableViewModel();
}
