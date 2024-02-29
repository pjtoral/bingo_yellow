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
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      itemCount: 25,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        // Calculate row and column from index
        final row = index ~/ 5;
        final col = index % 5;
        final isCenterCell = row == 2 && col == 2;
        final isSelected = viewModel.selectedCells[row][col];

        return InkWell(
          onTap: isCenterCell ? null : () => viewModel.toggleCellSelection(row, col),
          child: Container(
            decoration: BoxDecoration(
              color: isCenterCell ? Colors.grey[300] : isSelected ? Colors.blueAccent : Colors.white,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                isCenterCell ? 'FREE' : viewModel.tableNumbers[row][col].toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  TableViewModel viewModelBuilder(BuildContext context) => TableViewModel();
}
