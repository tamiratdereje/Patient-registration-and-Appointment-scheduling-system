part of 'admin_bloc.dart';

@immutable
abstract class AdminState {}

class AdminInitial extends AdminState {
  
}

class AdminAdding extends AdminState{}

class AdminFailed extends AdminState{}

class AdminSuccessful extends AdminState{
  
}
