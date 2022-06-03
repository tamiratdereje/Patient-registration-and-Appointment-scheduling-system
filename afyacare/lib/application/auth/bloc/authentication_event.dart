part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {}

class BoardingComplete extends AuthenticationEvent {}

class OnBoardingComplete extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}

class UserDeleted extends AuthenticationEvent {}
