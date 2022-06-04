part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState{}

class SignupFailed extends SignupState{}

class SignupSuccessful extends SignupState{}
