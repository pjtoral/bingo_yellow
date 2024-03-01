import 'package:bingo_yellow/ui/views/bingo/bingo_view.dart';
import 'package:bingo_yellow/ui/views/bingo/bingo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bingo_yellow/app/app.locator.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import '../helpers/test_helpers.dart';

class MockNavigationService extends Mock implements BingoViewModel {}

void main() {
  group('BingoViewModel Tests -', () {
    late MockNavigationService viewModel;
    setUp(() => {
          registerServices(),
          viewModel = MockNavigationService(),
        });
    tearDown(() => locator.reset());
    testWidgets('Should display app bar title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: BingoView()),
      );

      expect(find.text('Bingo Card'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pump();
    });
    testWidgets(
        'Given Bingo View, When Initialized, Then See ee all images and background image',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: BingoView()),
      );

      expect(find.byKey(const Key('asset1')), findsOneWidget);

      // Find the Container widget
      final containerFinder = find.byKey(Key('background'));
      // Verify that the Container widget exists
      expect(containerFinder, findsOneWidget);

      // Get the BoxDecoration from the Container
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as BoxDecoration?;

      // Verify that the BoxDecoration contains the expected AssetImage
      final decorationImage = decoration?.image as DecorationImage?;
      expect(decorationImage?.image, isA<AssetImage>());
      expect(decorationImage?.image, equals(AssetImage('assets/7.png')));
      expect(decorationImage?.fit, BoxFit.cover);
    });

    testWidgets(
        'Given Bingo View, When Initialized, Then See ee all images and background image',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: BingoView()),
      );

      expect(find.byKey(const Key('asset1')), findsOneWidget);
      expect(find.byKey(const Key('asset2')), findsOneWidget);
      // Find the Container widget
      final containerFinder = find.byKey(Key('background'));
      // Verify that the Container widget exists
      expect(containerFinder, findsOneWidget);

      // Get the BoxDecoration from the Container
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as BoxDecoration?;

      // Verify that the BoxDecoration contains the expected AssetImage
      final decorationImage = decoration?.image as DecorationImage?;
      expect(decorationImage?.image, isA<AssetImage>());
      expect(decorationImage?.image, equals(AssetImage('assets/7.png')));
      expect(decorationImage?.fit, BoxFit.cover);
    });
  });
}
