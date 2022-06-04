import 'package:afyacare/domain/profile/profile_domain.dart';
import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/infrastructure/profile/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepo profileRepo = ProfileRepo();
  SharedPref sharedPref = SharedPref();
  ProfileBloc() : super(ProfileInitial()) {
    on<EditPassword>((event, emit) async {
      emit(ChangingProfile());
      try {
        await profileRepo.editPassword(event.profileDomain);
      } catch (e) {
        emit(ProfileChangeFailed());
      }
    });
    on<Logout>(((event, emit) async {
      emit(LoggingOut());
      try {
        final token =await  (sharedPref.getToken());
        await profileRepo.logout( token);
        await sharedPref.deleteToken();
        await sharedPref.deleteName();
        emit(LoggedOut());
      } catch (e) {
        emit(LoggoutFailed());
      }
    }));

    on<DeleteAccount>(((event, emit) async {
      emit(DeletingAccount());
      try {
        await profileRepo.deleteAccount();
        await sharedPref.deleteToken();
        await sharedPref.deleteName();
      } catch (e) {
        emit(DeletingAccoutnFailed());
      }
    }));
  }
}
