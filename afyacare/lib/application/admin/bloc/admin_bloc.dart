import 'dart:ffi';

import 'package:afyacare/domain/admin_register_user/admin_register_doctor_domian.dart';
import 'package:afyacare/infrastructure/admin_register_user/register_data_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminProvider  adminProvider = AdminProvider(); 
  AdminBloc() : super(AdminInitial()) {
    on<AdminEvent>((event, emit) async{
      
    });

    on<AdminRegisterUser>((event, emit) async{
      await _addUser (event, emit);
      
    });

  }

  Future<void> _addUser(event, emit) async {
    emit(AdminAdding());
    try {
        await adminProvider.createUser(event.addDoctorDomainRequest);
        emit(AdminSuccessful());
      
    } catch (e) {
      print(e);
      emit(AdminFailed());
      
    }
  }
}
