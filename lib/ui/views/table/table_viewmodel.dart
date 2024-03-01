import 'dart:math';
import 'package:stacked/stacked.dart';

class TableViewModel extends BaseViewModel {
  late List<List<int>> tableNumbers;
  late List<List<bool>> selectedCells;
  bool winDialogShown = false;

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
    if (row == 2 && col == 2) return; 
    selectedCells[row][col] = !selectedCells[row][col];
    notifyListeners();
  }

bool checkWinCondition() {
  // Check if all cells in any column are selected, automatically counting the center as selected
  for (int col = 0; col < 5; col++) {
    bool columnWin = true;
    for (int row = 0; row < 5; row++) {
      if (!(row == 2 && col == 2) && !selectedCells[row][col]) { 
        columnWin = false;
        break;
      }
    }
    if (columnWin) return true;
  }

  for (int row = 0; row < 5; row++) {
    bool rowWin = true;
    for (int col = 0; col < 5; col++) {
      if (!(row == 2 && col == 2) && !selectedCells[row][col]) { 
        rowWin = false;
        break;
      }
    }
    if (rowWin) return true;
  }


  bool diagonalWin1 = true, diagonalWin2 = true;
  for (int i = 0; i < 5; i++) {
    // Skip the center cell check for diagonalWin1, it's implicitly considered selected
    if (i != 2 && !selectedCells[i][i]) diagonalWin1 = false;
    if (i != 2 && !selectedCells[i][4 - i]) diagonalWin2 = false; 
  }

  return diagonalWin1 && diagonalWin2;
}


  void resetWinDialogShown(){
    winDialogShown = false;
    notifyListeners();
  }
}