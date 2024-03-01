import 'package:bingo_yellow/app/app.locator.dart';
import 'package:bingo_yellow/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InfoAlertDialogModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  InfoAlertDialogModel(DialogRequest request);

  Future<void> navigateToBingo() async {
    await _navigationService.navigateToBingoView();
  }

 
}
