import 'package:afyacare/domain/schedule/schedule_date_time.dart';
import 'package:afyacare/domain/schedule/schedule_domain.dart';
import 'package:afyacare/domain/schedule/schedule_id.dart';
import 'package:afyacare/infrastructure/Schedule/schedule_repository.dart';
import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {

    ScheduleRepoistory scheduleRepo = ScheduleRepoistory();

  ScheduleBloc() : super(ScheduleLoading()) {
    // on<ScheduleCreateEvent>((event, emit) {
    //   await _onMedicineCreate(event, emit);
      
    // });
    // on<ScheduleUpdateEvent>((event, emit) async {
    //   await _onMedicineUpdate(event, emit);
    // });

    // on<ScheduleLoadEvent>((event, emit) async {
    //   await _onScheduleLoad(event, emit);
    // });

    // on<ScheduleDeleteEvent>((event, emit) async {
    //   await _onMedicineUpdate(event, emit);
    // });
  }
    

  // Future<void> _onScheduleLoad(event, emit) async{
  //     SharedPref pref = SharedPref();

      
  //     emit(ScheduleLoading());
  //       try {
          
  //         final medicines  = await scheduleRepo.getDoctorSchedules();

  //         emit(MedicinesOperationSuccess(medicines));
  //       } catch (error) {
  //         emit(MedicineOperationFailure(error: error));      
  //       }
  // }


}

