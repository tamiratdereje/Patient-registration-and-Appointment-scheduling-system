part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class FirstUse extends AuthenticationState{}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationNotAuthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;
  AuthenticationFailure({required this.message});
}

class AuthenticationAuthenticated extends AuthenticationState {}
