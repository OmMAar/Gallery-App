import 'package:flutter_test/flutter_test.dart';
import 'package:nabed_test/utils/validators/min_length_validator.dart';

void main(){

  test('Invalid Min Length Validator Password Test', () {
    var result = MinLengthValidator(minLength: 8).validate('123');
    expect(result, false);
  });

  test('Valid Min Length Validator Password Test', () {
    var result = MinLengthValidator(minLength: 8).validate('ajay12345');
    expect(result, true);
  });
}