import 'package:afyacare/domain/record/record_domain.dart';
import 'package:afyacare/infrastructure/record/record_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordRepository recordRepo = RecordRepository();
  RecordBloc() : super(RecordLoading()) {
    on<RecordCreateEvent>((event, emit) async {
      await _onRecordCreate(event, emit);
    });

    on<RecordUpdateEvent>((event, emit) async {
      await _onRecordUpdate(event, emit);
    });
    // on<RecordDeleteEvent>((event, emit) async {
    //   await _onRecordDelete(event, emit);
    // });

    on<RecordLoadAllEvent>((event, emit) async {
      await _onRecordLoadAll(event, emit);
    });

    on<RecordDetailLoadEvent>((event, emit) async {
      await _onRecordDetailLoad(event, emit);
    });
  }

// done with record detail
  Future<void> _onRecordDetailLoad(event, emit) async {
    try {
      // final record = await recordRepo.getRecordDetail(event.id);
      // emit(RecordOperationSuccess(record));

    } catch (error) {
      emit(RecordOperationFailure(error: error));
    }
  }

// record create
  Future<void> _onRecordCreate(event, emit) async {
    try {
      // await recordRepo.createRecord(event.recordDomain);
      emit(RecordOperationSuccess());
    } catch (error) {
      emit(RecordOperationFailure(error: error));
    }
  }

// record update
  Future<void> _onRecordUpdate(event, emit) async {
    try {
      // await recordRepo.editRecord(event.recordDomain);
      emit(RecordOperationSuccess());
    } catch (error) {
      emit(RecordOperationFailure(error: error));
    }
  }

// done with record delete
  // Future<void> _onRecordDelete(event, emit) async {
  //   try {
  //     await recordRepo.deleteRecord(event.id);
  //     emit(RecordOperationSuccess());
  //   } catch (error) {
  //     emit(RecordOperationFailure(error: error));
  //   }
  // }

  //
   
  Future<void> _onRecordLoadAll(event, emit) async {
    emit(RecordLoading());
    print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    try {
      final records = await recordRepo.getAllRecord();
      emit(RecordOperationSuccess(records));
    } catch (error) {
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      emit(RecordOperationFailure(error: error));
    }
  }
}
