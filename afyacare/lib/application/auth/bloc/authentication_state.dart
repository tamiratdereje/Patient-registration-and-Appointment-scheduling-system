part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class FirstUse extends AuthenticationState {}

class BoardingCompleted extends AuthenticationState {}

class AuthenticationNotAuthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationAuthenticatedadmin extends AuthenticationState{}

class AuthenticationAuthenticatedPharm extends AuthenticationState{}

class AuthenticationAuthenticatedDoct extends AuthenticationState{}

