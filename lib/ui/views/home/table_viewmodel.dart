import 'dart:math';

class TableViewModel {
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
}