import 'package:afyacare/domain/auth/authValidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
group('validation login', () {
  test('empty username returns error string', () {
    final result =authValidator().usernameValidater('');
    expect(result, ' Enter correct username. Eg. tame_dere');
  });
  ;

  test('non-empty and correct username returns null', () {

    final result =authValidator().usernameValidater('username');
    expect(result, null);
  });

  test('password less than 8 character returns error string', () {

    final result = authValidator().passwordValidater('1234567');
    expect(result, ' Password should not below 8 character');
  });

  test('password greater or equal to 8 character password returns null', () {

    final result = authValidator().passwordValidater('pass1234');
    expect(result, null);
  });
  });
}