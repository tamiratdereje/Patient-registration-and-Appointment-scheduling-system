import 'package:afyacare/domain/auth/loggedIn_domain.dart';
import 'package:afyacare/domain/auth/login_user_domain.dart';
import 'package:afyacare/domain/auth/token.dart';
import 'package:afyacare/domain/auth/user_name_domain.dart';
import 'package:afyacare/infrastructure/auth/login_model.dart';
import 'package:afyacare/infrastructure/auth/login_data_provider.dart';
import 'package:afyacare/infrastructure/auth/login_response_model.dart';

class LoginRepo {
  LoginRepo();
  AuthDataProvider authDataProvider = AuthDataProvider();

  Future<LoggedInDomain> login(LoginDomain loginDomain) async {
    LoginUser loginUser = LoginUser(
        username: loginDomain.username.toString(),
        password: loginDomain.password.toString());
    LoginResponse response = await authDataProvider.login(loginUser);
    LoggedInDomain loggedInDomain = LoggedInDomain(
        token: Token(token: response.token),
        username: Username(username: response.name));

    return loggedInDomain;
  }
}
