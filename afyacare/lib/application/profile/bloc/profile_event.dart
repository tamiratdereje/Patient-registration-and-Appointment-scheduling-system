part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class EditPassword extends ProfileEvent {
  ProfileDomain profileDomain;
  EditPassword({required this.profileDomain});
}

class Logout extends ProfileEvent {}

class DeleteAccount extends ProfileEvent {}
