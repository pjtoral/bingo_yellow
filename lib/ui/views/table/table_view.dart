import 'package:flutter/material.dart';
import 'table_viewmodel.dart';

class TableExample extends StatefulWidget {
  const TableExample({Key? key}) : super(key: key);

  @override
  State<TableExample> createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  final viewModel = TableViewModel();

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: List.generate(
        5, // 5 rows
        (rowIndex) => TableRow(
          children: List.generate(
            5, // 5 columns
            (colIndex) {
              final value = viewModel.tableNumbers[rowIndex][colIndex];
              final isSelected = viewModel.selectedCells[rowIndex][colIndex];
              final isCenterCell = rowIndex == 2 && colIndex == 2;

              return InkWell(
                onTap: () {
                  setState(() {
                    viewModel.toggleCellSelection(rowIndex, colIndex);
                  });
                },
                child: Container(
                  height: 64,
                  width: 64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: isSelected || isCenterCell ? Colors.lightBlue.shade100 : Colors.white,
                  ),
                  child: Text(
                    isCenterCell ? "FREE" : value.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
