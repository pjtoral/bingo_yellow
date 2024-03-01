class BingoModel {
  late List<List<int>> tableNumbers;
  late List<List<bool>> selectedCells;

  BingoModel() {
    tableNumbers = List.generate(5, (_) => List.filled(5, 0));
    selectedCells = List.generate(5, (_) => List.filled(5, false));
  }
}
