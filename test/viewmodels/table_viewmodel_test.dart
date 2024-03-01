import 'package:bingo_yellow/ui/views/table/table_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('viewModel Tests', () {
    late TableViewModel viewModel;
    setUp(() {
      viewModel = TableViewModel();
    });
    test(
        'Given TableViewModel, When table is initialized correctly, Then generate random numbers',
        () {
      expect(viewModel.tableNumbers, isNotNull);
      expect(viewModel.tableNumbers.length, 5);
      expect(viewModel.tableNumbers.every((row) => row.length == 5), isTrue);
      expect(
          viewModel.selectedCells
              .every((row) => row.every((cell) => cell == false)),
          isTrue);
    });
    test(
        'Given TableViewModel, When rable is initialized correctly, Then toggle cell selection changes state correctly',
        () {
      viewModel.toggleCellSelection(0, 0);
      expect(viewModel.selectedCells[0][0], isTrue);
      viewModel.toggleCellSelection(0, 0);
      expect(viewModel.selectedCells[0][0], isFalse);
    });
    test(
        'Given bool blackoutWinCondition function, When correctly initialized and clicked all cells, Then identifies a win',
        () {
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          if (!(i == 2 && j == 2)) {
            viewModel.toggleCellSelection(i, j);
          }
        }
      }
      expect(viewModel.blackoutWinCondition(), isTrue);
    });
    test(
        'Given bool blackoutWinCondition function, When initialized correctly and clicked some, Then identifies a non-win scenario',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(1, 1);
      viewModel.toggleCellSelection(3, 3);
      expect(viewModel.blackoutWinCondition(), isFalse);
    });
    test(
        'Given boolean L win condition function, when correct initialization and satisfies the condition, Then correctly identifies a win',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(0, 1);
      viewModel.toggleCellSelection(0, 2);
      viewModel.toggleCellSelection(0, 3);
      viewModel.toggleCellSelection(0, 4);
      viewModel.toggleCellSelection(1, 4);
      viewModel.toggleCellSelection(2, 4);
      viewModel.toggleCellSelection(3, 4);
      viewModel.toggleCellSelection(4, 4);
      expect(viewModel.lWinCondition(), isTrue);
    });
    test(
        'Given boolean cross win condition function , When initialized correctly and satisfy cross condition, Then identifies a win',
        () {
      viewModel.toggleCellSelection(0, 2);
      viewModel.toggleCellSelection(1, 2);
      viewModel.toggleCellSelection(2, 0);
      viewModel.toggleCellSelection(2, 1);
      viewModel.toggleCellSelection(2, 3);
      viewModel.toggleCellSelection(2, 4);
      viewModel.toggleCellSelection(3, 2);
      viewModel.toggleCellSelection(4, 2);
      expect(viewModel.crossWinCondition(), isTrue);
    });
    test(
        'Given boolean cross win condition function, When initialized correctly and does not satisfy cross condition, Then identifies a non-win scenario',
        () {
      viewModel.toggleCellSelection(0, 2);
      viewModel.toggleCellSelection(1, 2);
      viewModel.toggleCellSelection(2, 0);
      viewModel.toggleCellSelection(2, 1);
      viewModel.toggleCellSelection(2, 3);
      viewModel.toggleCellSelection(2, 4);
      expect(viewModel.crossWinCondition(), isFalse);
    });
    test(
        'Given boolean L win condition function, when correct initialization and satisfies the condition, Then correctly identifies a win',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(1, 0);
      viewModel.toggleCellSelection(2, 0);
      viewModel.toggleCellSelection(3, 0);
      viewModel.toggleCellSelection(4, 0);
      viewModel.toggleCellSelection(4, 1);
      viewModel.toggleCellSelection(4, 2);
      viewModel.toggleCellSelection(4, 3);
      viewModel.toggleCellSelection(4, 4);
      expect(viewModel.lWinCondition(), isTrue);
    });
    test(
        'Given boolean L win condition function, When correctly initializes but does not satisfy condition, Then identifies a non-win scenario',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(1, 0);
      viewModel.toggleCellSelection(2, 0);
      viewModel.toggleCellSelection(3, 0);
      viewModel.toggleCellSelection(4, 0);
      expect(viewModel.lWinCondition(), isFalse);
    });
    test(
        'Given corner win condition function, When correctly initialized and outer corners are selected, Then corner win detected correctly and identifies a win',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(0, 4);
      viewModel.toggleCellSelection(4, 0);
      viewModel.toggleCellSelection(4, 4);
      viewModel.toggleCellSelection(0, 1);
      viewModel.toggleCellSelection(0, 3);
      viewModel.toggleCellSelection(1, 0);
      viewModel.toggleCellSelection(1, 4);
      viewModel.toggleCellSelection(3, 4);
      viewModel.toggleCellSelection(4, 1);
      viewModel.toggleCellSelection(4, 3);
      expect(viewModel.cornerWinCondition(), true);
    });
    test(
        'Given corner win condition function, When correctly initialized and inner square are selected, Then identifies a win',
        () {
      viewModel = TableViewModel();
      viewModel.toggleCellSelection(1, 1);
      viewModel.toggleCellSelection(1, 2);
      viewModel.toggleCellSelection(1, 3);
      viewModel.toggleCellSelection(2, 1);
      viewModel.toggleCellSelection(2, 3);
      viewModel.toggleCellSelection(3, 1);
      viewModel.toggleCellSelection(3, 2);
      viewModel.toggleCellSelection(3, 3);
      expect(viewModel.cornerWinCondition(), true);
    });
    test('Corner win condition should not be detected for random selections',
        () {
      viewModel = TableViewModel();
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(2, 2);
      viewModel.toggleCellSelection(4, 4);
      expect(viewModel.cornerWinCondition(), false);
    });
    test(
        'Given X win condition function, When initialized and satisfy condition, Then identifies a win',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(1, 1);
      viewModel.toggleCellSelection(3, 3);
      viewModel.toggleCellSelection(4, 4);
      viewModel.toggleCellSelection(0, 4);
      viewModel.toggleCellSelection(1, 3);
      viewModel.toggleCellSelection(3, 1);
      viewModel.toggleCellSelection(4, 0);
      expect(viewModel.xWinCondition(), true);
    });
    test(
        'Given X win condition function, when initialized and does not satisfy condition, Then identifies a non-win scenario',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(1, 2);
      viewModel.toggleCellSelection(2, 2);
      viewModel.toggleCellSelection(3, 3);
      expect(viewModel.xWinCondition(), false);
    });
    test(
        'Given horizontal win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(1, 0);
      viewModel.toggleCellSelection(2, 0);
      viewModel.toggleCellSelection(3, 0);
      viewModel.toggleCellSelection(4, 0);
      expect(viewModel.lineHorizontal(), true);
    });
    test(
        'Given horizontal win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(0, 1);
      viewModel.toggleCellSelection(1, 1);
      viewModel.toggleCellSelection(2, 1);
      viewModel.toggleCellSelection(3, 1);
      viewModel.toggleCellSelection(4, 1);
      expect(viewModel.lineHorizontal(), true);
    });
    test(
        'Given horizontal win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(0, 2);
      viewModel.toggleCellSelection(1, 2);
      viewModel.toggleCellSelection(3, 2);
      viewModel.toggleCellSelection(4, 2);
      expect(viewModel.lineHorizontal(), true);
    });
    test(
        'Given horizontal win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(0, 3);
      viewModel.toggleCellSelection(1, 3);
      viewModel.toggleCellSelection(2, 3);
      viewModel.toggleCellSelection(3, 3);
      viewModel.toggleCellSelection(4, 3);
      expect(viewModel.lineHorizontal(), true);
    });
    test(
        'Given horizontal win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(0, 4);
      viewModel.toggleCellSelection(1, 4);
      viewModel.toggleCellSelection(2, 4);
      viewModel.toggleCellSelection(3, 4);
      viewModel.toggleCellSelection(4, 4);
      expect(viewModel.lineHorizontal(), true);
    });
    test(
        'Given Horizontal win condition function, When initialized and does not satisfy condition, Then identifies a non-win scenario',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(2, 2);
      viewModel.toggleCellSelection(4, 4);
      expect(viewModel.lineHorizontal(), false);
    });
    test(
        'Given vertical win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(0, 0);
      viewModel.toggleCellSelection(0, 1);
      viewModel.toggleCellSelection(0, 2);
      viewModel.toggleCellSelection(0, 3);
      viewModel.toggleCellSelection(0, 4);
      expect(viewModel.lineVertical(), true);
    });
    test(
        'Given vertical win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(1, 0);
      viewModel.toggleCellSelection(1, 1);
      viewModel.toggleCellSelection(1, 2);
      viewModel.toggleCellSelection(1, 3);
      viewModel.toggleCellSelection(1, 4);
      expect(viewModel.lineVertical(), true);
    });
    test(
        'Given vertical win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(2, 0);
      viewModel.toggleCellSelection(2, 1);
      viewModel.toggleCellSelection(2, 3);
      viewModel.toggleCellSelection(2, 4);
      expect(viewModel.lineVertical(), true);
    });
    test(
        'Given vertical win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(3, 0);
      viewModel.toggleCellSelection(3, 1);
      viewModel.toggleCellSelection(3, 2);
      viewModel.toggleCellSelection(3, 3);
      viewModel.toggleCellSelection(3, 4);
      expect(viewModel.lineVertical(), true);
    });
    test(
        'Given vertical win condition function, When initialized correctly and satisfy condition, Then identifies a win!',
        () {
      viewModel.toggleCellSelection(4, 0);
      viewModel.toggleCellSelection(4, 1);
      viewModel.toggleCellSelection(4, 2);
      viewModel.toggleCellSelection(4, 3);
      viewModel.toggleCellSelection(4, 4);
      expect(viewModel.lineVertical(), true);
    });
    test(
        'Given vertical win condition function, When initialized correctly and does not satisfy condition, Then identifies a non-win scenario',
        () {
      viewModel.toggleCellSelection(0, 1);
      viewModel.toggleCellSelection(0, 2);
      viewModel.toggleCellSelection(0, 4);
      expect(viewModel.lineVertical(), false);
    });
    test(
        'Given Reset win dialog shown function, when initialized, Then set it to false and notify listeners',
        () {
      // Set the win dialog flag to true initially
      viewModel.winDialogShown = true;
      // Call the method to reset the flag
      viewModel.resetWinDialogShown();
      // Verify that the flag is set to false
      expect(viewModel.winDialogShown, false);
    });
  });

  test('handleCategorySelection should return true for valid win conditions',
      () {
    // Create an instance of the class containing the functions to be tested
    // Replace 'YourClassName' with the actual name of the class containing the functions
    TableViewModel viewModel = TableViewModel();
    // Set selected cells to represent a valid win condition for each category
    viewModel.selectedCells = [
      [true, true, true, true, true],
      [true, true, true, true, true],
      [true, true, true, true, true],
      [true, true, true, true, true],
      [true, true, true, true, true],
    ];
    // Test each category's win condition
    TableViewModel.selectedCategory = 'Black out';
    expect(viewModel.handleCategorySelection(), true);
    TableViewModel.selectedCategory = 'X';
    expect(viewModel.handleCategorySelection(), true);
    TableViewModel.selectedCategory = 'Cross';
    expect(viewModel.handleCategorySelection(), true);
    TableViewModel.selectedCategory = 'L';
    expect(viewModel.handleCategorySelection(), true);
    TableViewModel.selectedCategory = 'Corners';
    expect(viewModel.handleCategorySelection(), true);
    TableViewModel.selectedCategory = 'Line Horizontal';
    expect(viewModel.handleCategorySelection(), true);
    TableViewModel.selectedCategory = 'Line Vertical';
    expect(viewModel.handleCategorySelection(), true);
  });
  test('handleCategorySelection should return false for invalid win conditions',
      () {
    // Create an instance of the class containing the functions to be tested
    // Replace 'YourClassName' with the actual name of the class containing the functions
    TableViewModel viewModel = TableViewModel();
    // Set selected cells to represent invalid win conditions for each category
    viewModel.selectedCells = [
      [false, false, false, false, false],
      [false, false, false, false, false],
      [false, false, false, false, false],
      [false, false, false, false, false],
      [false, false, false, false, false],
    ];
    // Test each category's win condition
    TableViewModel.selectedCategory = 'Black out';
    expect(viewModel.handleCategorySelection(), false);
    TableViewModel.selectedCategory = 'X';
    expect(viewModel.handleCategorySelection(), false);
    TableViewModel.selectedCategory = 'Cross';
    expect(viewModel.handleCategorySelection(), false);
    TableViewModel.selectedCategory = 'L';
    expect(viewModel.handleCategorySelection(), false);
    TableViewModel.selectedCategory = 'Corners';
    expect(viewModel.handleCategorySelection(), false);
    TableViewModel.selectedCategory = 'Line Horizontal';
    expect(viewModel.handleCategorySelection(), false);
    TableViewModel.selectedCategory = 'Line Vertical';
    expect(viewModel.handleCategorySelection(), false);
  });
}
