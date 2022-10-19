import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_clone/core/domain/value_objects/not_null_string.dart';

void main() {
  test('StringObject shouldn\'t be null', () async {
    final stringObject = NotNullString('');
    final result = stringObject.validator();
    expect(result is String, true);
  });
}
