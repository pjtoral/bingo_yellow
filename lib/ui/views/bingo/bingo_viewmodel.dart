import 'package:bingo_yellow/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BingoViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void navigateToHome() {
    _navigationService.back();
  }
}