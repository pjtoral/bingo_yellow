import 'package:flutter/material.dart';
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
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 25,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              padding: const EdgeInsets.all(9),
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
        ));
  }

  @override
  TableViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TableViewModel();
}