import 'package:afyacare/domain/auth/login_user_domain.dart';
import 'package:afyacare/infrastructure/auth/login_model.dart';
import 'package:afyacare/infrastructure/auth/login_data_provider.dart';
import 'package:afyacare/infrastructure/core/user_model.dart';



class LoginRepo {
  ApiClient apiClient = ApiClient();
  LoginRepo();

  Future<User> login(LoginDomain loginDomain) async {
  LoginUser loginUser = LoginUser(email: loginDomain.email, password: loginDomain.password);
   return apiClient.login(loginUser);
 }
}