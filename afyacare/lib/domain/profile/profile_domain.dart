import 'package:afyacare/domain/auth/password_domain.dart';

class ProfileDomain {
  Password old_password;
  Password new_password;

  ProfileDomain({required this.new_password, required this.old_password});
}
