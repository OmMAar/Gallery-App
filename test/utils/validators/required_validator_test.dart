import 'package:flutter_test/flutter_test.dart';
import 'package:nabed_test/utils/validators/required_validator.dart';

void main(){

  test('Invalid Required Test', () {
    var result = RequiredValidator().validate('');
    expect(result, false);
  });

  test('Valid Required Test', () {
    var result = RequiredValidator().validate('123');
    expect(result, true);
  });

  test('Invalid Required Test', () {
    var result = RequiredValidator().validate(' ');
    expect(result, false);
  });

}