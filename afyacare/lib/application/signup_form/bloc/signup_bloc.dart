import 'package:afyacare/domain/signup/signup_user_domain.dart';
import 'package:afyacare/infrastructure/signup/signup_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupRepo signupRepo = SignupRepo();

  SignupBloc() : super(SignupInitial()) {
    on<SignUpEvent>(
      (event, emit) async {
        emit(SignupLoading());
        try {
          await signupRepo.signup(event.signupDomain);
          emit(SignupSuccessful());
        } catch (e) {
          print("failedd kkkkkkkkkkkkkkkkkk");
          emit(SignupFailed());
        }
      },
    );
  }
}
