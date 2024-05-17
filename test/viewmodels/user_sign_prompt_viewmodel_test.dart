import 'package:flutter_test/flutter_test.dart';
import 'package:school_management/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UserSignPromptViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
