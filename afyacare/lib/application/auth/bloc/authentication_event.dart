part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;
  LoggedIn({required this.token});

  @override
  List<Object> get props => [token];
}

class LoggedOut extends AuthenticationEvent {}

class UserDeleted extends AuthenticationEvent {}
