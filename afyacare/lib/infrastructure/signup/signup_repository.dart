import 'package:afyacare/domain/signup/signup_user_domain.dart';
import 'package:afyacare/infrastructure/signup/signup_data_provider.dart';
import 'package:afyacare/infrastructure/signup/signup_model.dart';
import 'package:afyacare/presentation/pages/signup/signup.dart';

class SignupRepo {
  SignupRepo();
  SignupDataProvider signupDataProvider = SignupDataProvider();

  Future<void> signup(SignupDomain signupDomain) async {
    SignupUser signupUser = SignupUser(
        username: signupDomain.username.toString(),
        fullName: signupDomain.fullName.toString(),
        dateOfBirth: signupDomain.dateOfBirth.toString(),
        password: signupDomain.password.toString());

    try {
      await signupDataProvider.signup(signupUser);
      print("repo");
      return;
    } catch (e) {
      print(e);
      throw Exception("Unable to SignIn");
    }
  }
}
