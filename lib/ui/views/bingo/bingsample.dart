import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(const TableExampleApp());
class TableExampleApp extends StatelessWidget {
  const TableExampleApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bingo Table Sample')),
        body: const TableExample(),
      ),
    );
  }
}



class TableExample extends StatefulWidget {
  const TableExample({Key? key}) : super(key: key);
  @override
  State<TableExample> createState() => _TableExampleState();
}
class _TableExampleState extends State<TableExample> {
  late List<List<int>> tableNumbers;
  late List<List<bool>> selectedCells;
  @override
  void initState() {
    super.initState();
    tableNumbers = List.generate(5, (_) => List.filled(5, 0));
    selectedCells = List.generate(5, (_) => List.filled(5, false));
    final List<int> firstColumnNumbers = _generateRandomNumbers(1, 15, 5);
    final List<int> secondColumnNumbers = _generateRandomNumbers(16, 30, 5);
    final List<int> thirdColumnNumbers = _generateRandomNumbers(31, 45, 4); // Adjusted for the free space
    final List<int> fourthColumnNumbers = _generateRandomNumbers(46, 60, 5);
    final List<int> fifthColumnNumbers = _generateRandomNumbers(61, 75, 5);
    for (int i = 0; i < 5; i++) {
      tableNumbers[i][0] = firstColumnNumbers[i];
      tableNumbers[i][1] = secondColumnNumbers[i];
      if (i < 2) {
        tableNumbers[i][2] = thirdColumnNumbers[i];
      } else if (i > 2) {
        tableNumbers[i][2] = thirdColumnNumbers[i - 1];
      }
      tableNumbers[i][3] = fourthColumnNumbers[i];
      tableNumbers[i][4] = fifthColumnNumbers[i];
    }
  }
  List<int> _generateRandomNumbers(int min, int max, int count) {
    final random = Random();
    final Set<int> randomNumbers = {};
    while (randomNumbers.length < count) {
      randomNumbers.add(min + random.nextInt(max - min + 1));
    }
    return randomNumbers.toList();
  }
  bool checkWinCondition() {
    // Check if all non-free cells are selected
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (i != 2 || j != 2) {
          if (!selectedCells[i][j]) {
            return false;
          }
        }
      }
    }
    return true;
  }
  void showWinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: const Text('You win! All non-free cells are selected.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: List.generate(
        5,
        (rowIndex) => TableRow(
          children: List.generate(
            5,
            (colIndex) {
              final value = tableNumbers[rowIndex][colIndex];
              final isSelected = selectedCells[rowIndex][colIndex];
              final isCenterCell = rowIndex == 2 && colIndex == 2;
              return InkWell(
                onTap: isCenterCell
                    ? null
                    : () {
                        setState(() {
                          selectedCells[rowIndex][colIndex] = !selectedCells[rowIndex][colIndex];
                          if (checkWinCondition()) {
                            showWinDialog(context);
                          }
                        });
                      },
                child: Container(
                  height: 64,
                  width: 64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: isSelected || isCenterCell ? Colors.green : Colors.white,
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