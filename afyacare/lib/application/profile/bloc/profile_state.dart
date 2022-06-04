part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoggedOut extends ProfileState {}
class LoggingOut extends ProfileState{}
class LoggoutFailed extends ProfileState{}
class AccountDeleted extends ProfileState {}
class DeletingAccount extends ProfileState{}
class ChangingProfile extends ProfileState {}
class DeletingAccoutnFailed extends ProfileState{}
class ProfileChanged extends ProfileState {}

class ProfileChangeFailed extends ProfileState {}
