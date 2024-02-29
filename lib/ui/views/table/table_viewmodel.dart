import 'dart:math';

import 'package:stacked/stacked.dart';

class TableViewModel extends BaseViewModel {
  late List<List<int>> numbers;
  late List<List<bool>> selectedCells;
  late List<List<bool>> singleCellSelected; 

  TableViewModel() {
    numbers = generateTableData();
    selectedCells = List.generate(5, (_) => List.filled(5, false));
    singleCellSelected = List.generate(5, (_) => List.filled(5, false));
  }

  List<int> generateRandomNumbers(int min, int max, int count) {
    final random = Random();
    final Set<int> randomNumbers = {};

    while (randomNumbers.length != count) {
      randomNumbers.add(min + random.nextInt(max - min + 1));
    }

    return randomNumbers.toList();
  }

  List<List<int>> generateTableData() {
    final List<int> firstColumnNumbers = generateRandomNumbers(1, 15, 5);
    final List<int> secondColumnNumbers = generateRandomNumbers(16, 30, 5);
    final List<int> thirdColumnNumbers = generateRandomNumbers(31, 45, 5);
    final List<int> fourthColumnNumbers = generateRandomNumbers(46, 60, 5);
    final List<int> fifthColumnNumbers = generateRandomNumbers(61, 75, 5);

    return [
      firstColumnNumbers,
      secondColumnNumbers,
      thirdColumnNumbers,
      fourthColumnNumbers,
      fifthColumnNumbers,
    ];
  }

  // Method to update the selected state for a single cell
  void toggleSingleCellSelection(int row, int col) {
    if (row == 2 && col == 2) return; // Ignore center cell "Free Space"
    selectedCells[row][col] = !selectedCells[row][col];

    // Check if a single cell is selected
    singleCellSelected[row][col] = selectedCells[row][col] &&
        selectedCells[row].where((isSelected) => isSelected).length == 1 &&
        List.generate(5, (index) => selectedCells[index][col]).where((isSelected) => isSelected).length == 1;
  }

  
}
