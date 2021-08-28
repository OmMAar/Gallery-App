import 'package:flutter_test/flutter_test.dart';
import 'package:nabed_test/utils/validators/match_validator.dart';

void main(){
  test('Valid Match Validator Test', () {
    var result = MatchValidator(value: "omar").validate('omar');
    expect(result, true);
  });

  test('Invalid Match Validator Test', () {
    var result = MatchValidator(value: "omar").validate('');
    expect(result, false);
  });

  test('Invalid Match Validator Test', () {
    var result = MatchValidator(value: "omar").validate('Omar');
    expect(result, false);
  });

  test('Invalid Match Validator Test', () {
    var result = MatchValidator(value: "omar").validate('oma');
    expect(result, false);
  });

}