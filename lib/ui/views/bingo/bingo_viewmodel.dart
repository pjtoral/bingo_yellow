import 'dart:math';

import 'package:bingo_yellow/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BingoViewModel extends BaseViewModel {
final _navigationService = locator<NavigationService>();

  
  late List<List<int>> tableNumbers;
  late List<List<bool>> selectedCells;

  void initState() {
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
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  void navigateToHome() {
    _navigationService.back();
  }
}