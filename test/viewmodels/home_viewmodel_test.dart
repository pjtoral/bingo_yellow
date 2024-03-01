import 'package:flutter_test/flutter_test.dart';
import 'package:bingo_yellow/app/app.locator.dart';
import 'package:bingo_yellow/ui/views/home/home_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

  });
}
