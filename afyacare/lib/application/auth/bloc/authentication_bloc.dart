
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
 

  

  AuthenticationBloc()
      : super(AuthenticationInitial()) {
    on<AppStarted>((event, emit) async {
      await startApp(emit);
    });

    on<LoggedIn>((event, emit) async {
      await loggedIn(event, emit);
    });

    on<LoggedOut>((event, emit) {});

    on<UserDeleted>((event, emit) {});
  }

  Future<void> loggedIn(event, emit) async {
    emit(AuthenticationLoading());

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', event.token);

    startAuth(emit);
  }

  Future<void> startApp(emit) async {
    final isFirstUse = await firstUse();

    if (isFirstUse) {
      emit(FirstUse());
    } else {
      await startAuth(emit);
    }
  }

  Future<void> startAuth(emit) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationNotAuthenticated());
    }
  }

  Future<bool> firstUse() async {
     final prefs = await SharedPreferences.getInstance();


    if (prefs.getBool('first_use') ?? true) {
      prefs.setBool('first_use', false);
      return true;
    }
    return false;
  }
}
