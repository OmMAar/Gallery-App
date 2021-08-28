import 'package:flutter_test/flutter_test.dart';
import 'package:nabed_test/utils/validators/email_validator.dart';

void main(){
  test('Invalid Email Test', (){
    var result = EmailValidator().validate('');
    expect(result, false);
  });

  test('Invalid Email Test', (){
    var result = EmailValidator().validate('omar.alshyokh@gmail.');
    expect(result, false);
  });

  test('Valid Email Test', () {
    var result = EmailValidator().validate('omar.alshyokh@gmail.com');
    expect(result, true);
  });

  test('Invalid Email Test', () {
    var result = EmailValidator().validate('testest.test');
    expect(result, false);
  });

  test('Valid Email Test', () {
    var result = EmailValidator().validate('tes@test.test');
    expect(result, true);
  });

}