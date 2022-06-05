import 'package:afyacare/application/medicine/medicine_state.dart';
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
    on<ScheduleCreateEvent>((event, emit) async {
      await _onScheduleCreate(event, emit);

    });

    on<ScheduleUpdateEvent>((event, emit) async {
      await _onScheduleUpdate(event, emit);
    });

    on<ScheduleLoadEvent>((event, emit) async {
      await _onScheduleLoad(event, emit);
    });

    on<ScheduleDeleteEvent>((event, emit) async {
      await _onScheduleDelete(event, emit);
    });


    
  }

  //  done with medicine delete
  Future<void> _onScheduleDelete(event, emit) async {
    try {
      await scheduleRepo.deleteSchedule(event.id);
      emit(SchedulesOperationSuccess());
    } catch (error) {
      emit(ScheduleOperationFailure(error: error));
    }
  }
    // _onScheduleCreate

    Future<void> _onScheduleCreate(event, emit) async {
    emit(ScheduleAdding());
    try {
      await scheduleRepo.createSchedule(event.scheduleDate);
      emit(ScheduleAddSuccessful());
    } catch (error) {
      emit(ScheduleAddFailed());
    }
  }

  Future<void> _onScheduleUpdate(event, emit) async {
    emit(ScheduleAdding());
    try {
      await scheduleRepo.editSchedule(event.time, event.id);
      emit(ScheduleAddSuccessful());
    } catch (error) {
      emit(ScheduleAddFailed());
    }
  }

  Future<void> _onScheduleLoad(event, emit) async{
      SharedPref pref = SharedPref();
      String? cur_role = await pref.getrole();

      emit(ScheduleLoading());
        try {
          // if (cur_role == "doctor"){
          //   final schedules  = await scheduleRepo.getDoctorSchedules();
          //   print("21111134566666666666wooowoooooooooooooooooooooooohahaaaaaaaa6666");
          //   print(schedules);
          //   // if (schedules.length){

          //   // }
          //   emit(SchedulesOperationSuccess(schedules));
          // }
           if(cur_role == "patient"){
            print("noooooooooooooooooooooooooooooooo");
            final schedules = await scheduleRepo.getPatientSchedules();
            emit(SchedulesOperationSuccess(schedules));
          }

        } catch (error) {
          print(error);
          emit(ScheduleOperationFailure(error: error));      
        }
  }





}

