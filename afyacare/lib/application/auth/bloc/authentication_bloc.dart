import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  SharedPref pref = SharedPref();
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AppStarted>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      await startApp(emit);
    });
    on<LoggedIn>(((event, emit) async {
      String? role = await pref.getrole();
      if (role == 'patient') {
        emit(AuthenticationAuthenticated());
      } else if (role == 'doctor') {
        emit(AuthenticationAuthenticatedDoct());
      } else if (role == 'pharmacist') {
        emit(AuthenticationAuthenticatedPharm());
      } else {
        emit(AuthenticationAuthenticated());
      }
    }));

    on<UserLoggedout>((event, emit) async {
      emit(AuthenticationNotAuthenticated());
    });
    on<UserDeleted>((event, emit) async {
      emit(AuthenticationNotAuthenticated());
    });
    on<BoardingComplete>((event, emit) {
      emit(BoardingCompleted());
    });
  }

  Future<void> startApp(emit) async {
    final isFirstUse = await pref.firstUse();

    if (isFirstUse) {
      emit(FirstUse());
    } else {
      await startAuth(emit);
    }
  }

  Future<void> startAuth(emit) async {
    final role = await pref.getrole();
   
    final token = await pref.getToken();
    if (token != null) {
      if (role == 'patient') {
        emit(AuthenticationAuthenticated());
      } else if (role == 'doctor') {
        emit(AuthenticationAuthenticatedDoct());
      } else if (role == 'pharmacist') {
        emit(AuthenticationAuthenticatedPharm());
      } else {
        emit(AuthenticationAuthenticated());
      }
    } else {
      emit(AuthenticationNotAuthenticated());
    }
  }
}
