import 'package:bingo_yellow/ui/dialogs/info_alert/info_alert_dialog_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:bingo_yellow/app/app.locator.dart';
import 'package:bingo_yellow/app/app.router.dart';

class MockNavigationService extends Mock implements NavigationService {}

void main() {
  setUpAll(() {
    // Setup for locator in your app
    setupLocator();
  });
  group('InfoAlertDialogModel Test -', () {
    MockNavigationService? mockNavigationService;
    setUp(() {
      locator.unregister<NavigationService>();
      mockNavigationService = MockNavigationService();
      locator.registerLazySingleton<NavigationService>(
          () => mockNavigationService!);
    });
    test('navigateToBingo() calls navigationService.navigateToBingoView()',
        () async {
      // Arrange
      final model = InfoAlertDialogModel(DialogRequest());
      // Act
      await model.navigateToBingo();
      // Assert
      verify(mockNavigationService!.navigateToBingoView()).called(1);
    });
  });
}
