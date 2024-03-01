import 'package:bingo_yellow/app/app.router.dart';
import 'package:bingo_yellow/themes/theme.dart';
import 'package:bingo_yellow/ui/views/home/home_view.dart';
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
    if (viewModel.checkWinCondition() && !viewModel.winDialogShown) {
      Future.delayed(Duration.zero, () {
        if (!viewModel.winDialogShown) {
          showWinDialog(context);
          viewModel.winDialogShown = true;
        }
      });
    }

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
                      int col = index ~/ 5;
                      int row = index % 5;
                      final isCenterCell = row == 2 && col == 2;
                      final isSelected = viewModel.selectedCells[row][col];
                      if (index == 12) {
                        return SizedBox(
                          child: Center(
                            child: Image.asset(
                              'assets/4.png',
                            ),
                          ),
                        );
                      }
                      return InkWell(
                          onTap: isCenterCell
                              ? null
                              : () => viewModel.toggleCellSelection(row, col),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                                color: isCenterCell
                                    ? Colors.grey[300]
                                    : isSelected
                                        ? Color(0xFFFFE000)
                                        : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  '${viewModel.tableNumbers[col][row]}',
                                  style: bingoTheme.textTheme.displayMedium,
                                ),
                              ),
                            ),
                          ));
                    },
                  )),
            ])),
        Positioned(
          bottom: -5,
          right: -10,
          child: Image.asset(
            'assets/6.png',
            width: 60,
            height: 60,
          ),
        ),
        Positioned(
          top: -5,
          left: 1,
          child: Image.asset(
            'assets/3.png',
            width: 60,
            height: 60,
          ),
        ),
        Positioned(
          bottom: -5,
          left: -10,
          child: Image.asset(
            'assets/5.png',
            width: 60,
            height: 60,
          ),
        ),
      ],
    );
  }

  void showWinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: const Text('You win a million dollars!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context)
                  .popUntil((route) => route.settings.name == Routes.homeView),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  TableViewModel viewModelBuilder(BuildContext context) => TableViewModel();
}
