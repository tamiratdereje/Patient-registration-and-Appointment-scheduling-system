import 'package:afyacare/domain/signup/signup_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validation signup username', () {
    test('empty username returns error string', () {
      final result = SignupValidator().usernameValidater('');
      expect(result, ' Enter correct username. Eg. jeba_deju');
    });
    test('if not username returns error string', () {
      final result = SignupValidator().usernameValidater('!abebef&=');
      expect(result, ' Enter correct username. Eg. jeba_deju');
    });

    test('non-empty and correct username returns null', () {
      final result = SignupValidator().usernameValidater('tamirat');
      expect(result, null);
    });
  });

  group('validation signup full name', () {
    test('empty fullname returns error string', () {
      final result = SignupValidator().fullNameValidater('');
      expect(result, ' Enter correct name');
    });
    test(' not name returns error string', () {
      final result = SignupValidator().fullNameValidater('!abebef&=');
      expect(result, ' Enter correct name');
    });

    test('non-empty and correct name returns null', () {
      final result = SignupValidator().fullNameValidater('abel mekonen');
      expect(result, null);
    });
  });

  group('validation signup date of birth', () {
    test('empty returns error string', () {
      final result = SignupValidator().dateOfBirthValidator('');
      expect(result, 'Pick date'); // check this message
    });

    test('non-empty date returns null', () {
      final result = SignupValidator().dateOfBirthValidator('2000-05-02');
      expect(result, null);
    });
  });

  group('validation signup', () {
    test('password less than 8 character returns error string', () {
      final result = SignupValidator().passwordValidater('1234567');
      expect(result, 'Password should not below 8 character');
    });

    test('password greater or equal to 8 character password returns null', () {
      final result = SignupValidator().passwordValidater('pass1234');
      expect(result, null);
    });
  });

  group("confirm password", () {
    test('password less than 8 character returns error string', () {
      final result = SignupValidator().confrimPasswordValidator('1234567','');
      expect(result, 'Password should not below 8 character');
    });

    test('password matched password returns null', () {
      final result =SignupValidator().confrimPasswordValidator("abcdefghij","0011223344");
      
      expect(result, null);
    });

    test('password not matched character password returns null', () {
    
      final result = SignupValidator().confrimPasswordValidator("00224466","00224466");
      
      expect(result, "Password not matched!");
    });

  });
}