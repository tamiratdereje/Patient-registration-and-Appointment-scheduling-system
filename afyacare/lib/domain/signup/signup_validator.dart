import 'package:afyacare/domain/signup/confirm_password_validator.dart';
import 'package:afyacare/domain/signup/date_of_birth_domain.dart';
import 'package:afyacare/domain/signup/fullname_domain.dart';
import 'package:afyacare/domain/signup/password_domain.dart';
import 'package:afyacare/domain/signup/username_domain.dart';

class SignupValidator {
  String? usernameValidater(String? value) {
    try {
      Username(username: value);
      return null;
    } catch (e) {
      return e.toString().substring(10);
    }
  }

  String? passwordValidater(String? value) {
    try {
      Password(password: value);
      return null;
    } catch (e) {
      return e.toString().substring(10);
    }
  }

  String? fullNameValidater(String? value) {
    try {
      FullName(fullName: value);
      return null;
    } catch (e) {
      return e.toString().substring(10);
    }
  }

  String? dateOfBirthValidator(String? value) {
    try {
      print("here");
      DateOfBirth(dateOfBirth: value);
      return null;
    } catch (e) {
      return e.toString().substring(10);
    }
  }

  String? confrimPasswordValidator(String? value, String password) {
    try {
      ConfirmPassword(confirmPassword: value, password: password);
      return null;
    } catch (e) {
      return e.toString().substring(10);
    }
  }
}
