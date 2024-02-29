import 'dart:math';
import 'package:stacked/stacked.dart';

class TableViewModel extends BaseViewModel {
  late List<List<int>> tableNumbers;
  late List<List<bool>> selectedCells;

  TableViewModel() {
    _initializeTable();
  }

  void _initializeTable() {
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
    notifyListeners();
  }

  List<int> _generateRandomNumbers(int min, int max, int count) {
    final random = Random();
    final Set<int> randomNumbers = {};
    while (randomNumbers.length < count) {
      randomNumbers.add(min + random.nextInt(max - min + 1));
    }
    return randomNumbers.toList();
  }

  void toggleCellSelection(int row, int col) {
    if (row == 2 && col == 2) return; // Ignore center cell
    selectedCells[row][col] = !selectedCells[row][col];
    notifyListeners();
  }

  bool checkWinCondition() {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (i != 2 || j != 2) { // Exclude the free space
          if (!selectedCells[i][j]) return false;
        }
      }
    }
    return true;
  }
}
