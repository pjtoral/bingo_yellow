import 'dart:math';
import 'package:stacked/stacked.dart';

class TableViewModel extends BaseViewModel {
  late List<List<int>> tableNumbers;
  late List<List<bool>> selectedCells;
  static String? selectedCategory;
  bool winDialogShown = false;

  TableViewModel() {
    _initializeTable();
  }
  void _initializeTable() {
    tableNumbers = List.generate(5, (_) => List.filled(5, 0));
    selectedCells = List.generate(5, (_) => List.filled(5, false));
    final List<int> firstColumnNumbers = _generateRandomNumbers(1, 15, 5);
    final List<int> secondColumnNumbers = _generateRandomNumbers(16, 30, 5);
    final List<int> thirdColumnNumbers =
        _generateRandomNumbers(31, 45, 4); // Adjusted for the free space
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

  bool handleCategorySelection() {
    switch (selectedCategory) {
      case 'Black out':
        return blackoutWinCondition();
      case 'X':
        return xWinCondition();
      case 'Cross':
        return crossWinCondition();
      case 'L':
        return lWinCondition();
      case 'Corners':
        return cornerWinCondition();
      case 'Line Horizontal':
        return lineHorizontal();
      case 'Line Vertical':
        // Handle Line Horizontal category logic
        return lineVertical();
      default:
        // Handle default case (if needed)
        break;
    }

    return false; // Default return value
  }

  bool checkWinCondition() {
    return handleCategorySelection();
  }

  bool blackoutWinCondition() {
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

  bool crossWinCondition() {
    if (selectedCells[0][2] &&
        selectedCells[1][2] &&
        selectedCells[2][0] &&
        selectedCells[2][1] &&
        selectedCells[2][3] &&
        selectedCells[2][4] &&
        selectedCells[3][2] &&
        selectedCells[4][2]) {
      return true;
    }

    return false;
  }

  bool lWinCondition() {
    if (selectedCells[0][0] &&
        selectedCells[1][0] &&
        selectedCells[2][0] &&
        selectedCells[3][0] &&
        selectedCells[4][0] &&
        selectedCells[4][1] &&
        selectedCells[4][2] &&
        selectedCells[4][3] &&
        selectedCells[4][4]) {
      return true;
    }
    if (selectedCells[0][0] &&
        selectedCells[0][1] &&
        selectedCells[0][2] &&
        selectedCells[0][3] &&
        selectedCells[0][4] &&
        selectedCells[1][4] &&
        selectedCells[2][4] &&
        selectedCells[3][4] &&
        selectedCells[4][4]) {
      return true;
    }
    if (selectedCells[4][0] &&
        selectedCells[4][1] &&
        selectedCells[4][2] &&
        selectedCells[4][3] &&
        selectedCells[4][4] &&
        selectedCells[3][4] &&
        selectedCells[2][4] &&
        selectedCells[1][4] &&
        selectedCells[0][4]) {
      return true;
    }
    if (selectedCells[4][0] &&
        selectedCells[3][0] &&
        selectedCells[2][0] &&
        selectedCells[1][0] &&
        selectedCells[0][0] &&
        selectedCells[0][1] &&
        selectedCells[0][2] &&
        selectedCells[0][3] &&
        selectedCells[0][4]) {
      return true;
    }
    return false;
  }

  bool lineHorizontal() {
    if ((selectedCells[0][0] &&
            selectedCells[1][0] &&
            selectedCells[2][0] &&
            selectedCells[3][0] &&
            selectedCells[4][0]) ||
        (selectedCells[0][1] &&
            selectedCells[1][1] &&
            selectedCells[2][1] &&
            selectedCells[3][1] &&
            selectedCells[4][1]) ||
        (selectedCells[0][2] &&
            selectedCells[1][2] &&
            selectedCells[3][2] &&
            selectedCells[4][2]) ||
        (selectedCells[0][3] &&
            selectedCells[1][3] &&
            selectedCells[2][3] &&
            selectedCells[3][3] &&
            selectedCells[4][3]) ||
        (selectedCells[0][4] &&
            selectedCells[1][4] &&
            selectedCells[2][4] &&
            selectedCells[3][4] &&
            selectedCells[4][4])) {
      return true;
    } else {
      return false;
    }
  }

  bool lineVertical() {
    if ((selectedCells[0][0] &&
            selectedCells[0][1] &&
            selectedCells[0][2] &&
            selectedCells[0][3] &&
            selectedCells[0][4]) ||
        (selectedCells[1][0] &&
            selectedCells[1][1] &&
            selectedCells[1][2] &&
            selectedCells[1][3] &&
            selectedCells[1][4]) ||
        (selectedCells[2][0] &&
            selectedCells[2][1] &&
            selectedCells[2][3] &&
            selectedCells[2][4]) ||
        (selectedCells[3][0] &&
            selectedCells[3][1] &&
            selectedCells[3][2] &&
            selectedCells[3][3] &&
            selectedCells[3][4]) ||
        (selectedCells[4][0] &&
            selectedCells[4][1] &&
            selectedCells[4][2] &&
            selectedCells[4][3] &&
            selectedCells[4][4])) {
      return true;
    } else {
      return false;
    }
  }

  bool cornerWinCondition() {
    if (selectedCells[0][0] &&
        selectedCells[1][0] &&
        selectedCells[0][1] &&
        selectedCells[0][3] &&
        selectedCells[0][4] &&
        selectedCells[1][4] &&
        selectedCells[0][3] &&
        selectedCells[0][4] &&
        selectedCells[4][1] &&
        selectedCells[3][4] &&
        selectedCells[4][3] &&
        selectedCells[4][4]) {
      return true;
    }
    if (selectedCells[1][1] &&
        selectedCells[1][2] &&
        selectedCells[1][3] &&
        selectedCells[2][1] &&
        selectedCells[2][3] &&
        selectedCells[3][1] &&
        selectedCells[3][2] &&
        selectedCells[3][3]) {
      return true;
    }
    return false;
  }

  bool xWinCondition() {
    // Check if the selected cells form an 'X' pattern including the center cell
    if (selectedCells[0][0] &&
        selectedCells[1][1] &&
        selectedCells[3][3] &&
        selectedCells[4][4] &&
        selectedCells[0][4] &&
        selectedCells[1][3] &&
        selectedCells[3][1] &&
        selectedCells[4][0]) {
      return true;
    }
    return false;
  }

  void resetWinDialogShown() {
    winDialogShown = false;
    notifyListeners();
  }
}