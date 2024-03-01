import 'package:bingo_yellow/app/app.locator.dart';
import 'package:bingo_yellow/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class WinningCombination {
  final _navigationService = locator<NavigationService>();

  Future<void> navigateToBingo() async {
    await _navigationService.navigateToBingoView();
  }

  void handleCategorySelection(String? selectedCategory) {
    switch (selectedCategory) {
      case 'Black out':
       navigateToBingo();
      // You can add logic for other cases here
      case 'X':
        // Handle X category logic
        break;
      case 'Cross':
        // Handle Cross category logic
        break;
      case 'L':
        // Handle L category logic
        break;
      case 'Corners':
        // Handle Corners category logic
        break;
      case 'Line Vertical':
        // Handle Line Vertical category logic
        break;
      case 'Line Horizontal':
        // Handle Line Horizontal category logic
        break;
      default:
        // Handle default case (if needed)
        break;
    }
  }
}