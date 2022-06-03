// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:afyacare/domain/signup/date_of_birth_domain.dart';
import 'package:afyacare/domain/signup/fullname_domain.dart';
import 'package:afyacare/domain/signup/password_domain.dart';
import 'package:afyacare/domain/signup/username_domain.dart';

class SignupDomain {
  Username username;
  FullName fullName;
  DateOfBirth dateOfBirth;
  Password password;
  Password confirmPassword;
  SignupDomain({
    required this.username,
    required this.fullName,
    required this.dateOfBirth,
    required this.password,
    required this.confirmPassword,
  });
}

