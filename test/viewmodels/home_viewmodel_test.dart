import 'package:bingo_yellow/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bingo_yellow/app/app.locator.dart';
import '../helpers/test_helpers.dart';

void main() {
  group(
    'HomeViewModel Tests',
    () {
      setUpAll(() async {
        registerServices();
      });
      tearDownAll(() {
        locator.reset();
      });
      testWidgets(
        'Should display "PLAY NOW" text',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: HomeView(),
            ),
          );
          expect(find.byKey(Key('asset8')), findsOneWidget);
          expect(find.text('Start'), findsOneWidget);
        },
      );
    },
  );
}
