abstract class AuthState {}

class Idle extends AuthState {}

class LoggingIn extends AuthState {
}

class LoginFailed extends AuthState {
  // final Object error;
  
}

class LoginSuccessful extends AuthState {

}
