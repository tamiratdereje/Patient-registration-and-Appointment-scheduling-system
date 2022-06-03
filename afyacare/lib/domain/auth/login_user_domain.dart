import 'package:afyacare/domain/auth/password_domain.dart';
import 'package:afyacare/domain/auth/user_name_domain.dart';

class LoginDomain {
  Username username;
  Password password;
  LoginDomain({required this.username, required this.password});
}

