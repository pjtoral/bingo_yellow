import 'package:bingo_yellow/ui/views/bingo/bingo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bingo_yellow/ui/views/bingo/bingo_view.dart';
import 'package:bingo_yellow/ui/views/table/table_view.dart';

class MockBingoViewModel extends Mock implements BingoViewModel {}

void main() {
  group('BingoView widget test', () {
    testWidgets('Should display app bar title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BingoView(),
        ),
      );

      expect(find.text('Bingo Card'), findsOneWidget);
    });

    testWidgets('Should navigate to home when back button is pressed',
        (WidgetTester tester) async {
      final mockViewModel = MockBingoViewModel();

      await tester.pumpWidget(
        MaterialApp(
          home: BingoView(),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));
      verify(mockViewModel.navigateToHome()).called(1);
    });

    testWidgets('Should display background image', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BingoView(),
        ),
      );

      expect(find.byType(Image),
          findsNWidgets(2)); // Assuming there are two background images
    });

    testWidgets('Should display BINGO text with correct style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BingoView(),
        ),
      );

      expect(find.text('BINGO'), findsOneWidget);
      final bingoText = tester.widget<Text>(find.text('BINGO'));
      expect(bingoText.style!.fontSize, 55);
      // Add more style checks as needed
    });

    testWidgets('Should display TableView', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BingoView(),
        ),
      );

      expect(find.byType(TableView), findsOneWidget);
    });

    testWidgets('Should match snapshot', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: BingoView(),
        ),
      );
    });
  });
}
