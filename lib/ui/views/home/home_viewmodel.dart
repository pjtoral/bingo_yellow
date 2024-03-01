import 'package:bingo_yellow/app/app.dialogs.dart';
import 'package:bingo_yellow/app/app.locator.dart';
import 'package:bingo_yellow/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
    );
  }

  navigateToBingo() async {
    await _navigationService.navigateToBingoView();
  }
}
