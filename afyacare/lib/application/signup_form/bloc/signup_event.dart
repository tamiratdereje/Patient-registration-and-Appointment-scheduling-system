part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  @override
  List<Object> get props => [];

  

  
}

class SignUpEvent extends SignupEvent {
  final SignupDomain signupDomain;
  SignUpEvent(this.signupDomain);
}
