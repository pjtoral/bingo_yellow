import 'package:bingo_yellow/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:bingo_yellow/ui/dialogs/info_alert/info_alert_dialog_model.dart';
import 'package:flutter/material.dart';
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

    testWidgets('Should display app bar title', (WidgetTester tester) async {
      // Create a DialogRequest and completer function
      final request =
          DialogRequest(title: 'Test Title', description: 'Test Description');
      DialogResponse? dialogResponse;
      final completer = (response) {
        dialogResponse = response;
      };
      // Build the InfoAlertDialog widget
      await tester.pumpWidget(MaterialApp(
        home: InfoAlertDialog(request: request, completer: completer),
      ));

      // Find the InfoAlertDialog widget
      final alertDialogFinder = find.byType(AlertDialog);
      // Find the InfoAlertDialog widget
      final dropBox = find.byType(DropdownButton<String>);
      final text = find.byType(Text);
      // Verify that the InfoAlertDialog widget exists
      expect(alertDialogFinder, findsOneWidget);
      expect(dropBox, findsOneWidget);
      expect(text, findsAny);
    });
  });
}
