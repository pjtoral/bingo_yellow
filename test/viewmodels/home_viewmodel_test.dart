import 'package:flutter_test/flutter_test.dart';
import 'package:bingo_yellow/app/app.locator.dart';
import 'package:bingo_yellow/ui/views/home/home_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('incrementCounter -', () {
      test('When called once should return  Counter is: 1', () {
        final model = getModel();
        model.incrementCounter();
        expect(model.counterLabel, 'Counter is: 1');
      });
    });


  });
}
