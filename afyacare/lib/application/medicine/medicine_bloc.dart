import 'dart:async';

import 'package:afyacare/application/medicine/medicine_event.dart';
import 'package:afyacare/application/medicine/medicine_state.dart';
import 'package:afyacare/domain/Medicine/medicine_Domain.dart';
import 'package:afyacare/infrastructure/medicine/medicine_repository.dart';
import 'package:afyacare/presentation/core/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineBLoc extends Bloc<MedicineEvent, MedicineState> {
  MedicineRepo medicineRepo = MedicineRepo();

  MedicineBLoc() : super(MedicineLoading()) {
    on<MedicineCreateEvent>((event, emit) async {
      await _onMedicineCreate(event, emit);
    });
    on<MedicineUpdateEvent>((event, emit) async {
      await _onMedicineUpdate(event, emit);
    });
    on<SearchMedicine>((event, emit) async {
      await _onMedicineSearch(event, emit);
    });
    on<MedicineDeleteEvent>((event, emit) async {
      await _onMedicineDelete(event, emit);
    });
    on<medIdle>((event, emit) async {
      emit(Idle());
    });

    on<MedicineLoadAllEvent>((event, emit) async {
      await _onMedicineLoadAll(event, emit);
    });
    on<MedicineDetailLoadEvent>((event, emit) async {
      await _onMedicineDetailLoad(event, emit);
    });
  }

// load specific medicine
  Future<void> _onMedicineDetailLoad(event, emit) async {
    try {
      final medicine = await medicineRepo.getMedicineDetail(event.id);

      emit(MedicinesOperationSuccess(medicine));
    } catch (error) {
      emit(MedicineOperationFailure(error: error));
    }
  }

//  load all med
  Future<void> _onMedicineLoadAll(event, emit) async {
    emit(MedicineLoading());
    try {
      final medicines = await medicineRepo.getAllMedicine();
      emit(MedicinesOperationSuccess(medicines));
    } catch (error) {
      emit(MedicineOperationFailure(error: error));
    }
  }

//  done with create medicine
  Future<void> _onMedicineCreate(event, emit) async {
    emit(MedicineAdding());
    try {
      await medicineRepo.createMedicine(event.medicineDomain);
      print("herer");
      emit(MedicineAddSuccessful());
    } catch (error) {
      emit(MedicineAddFailed());
    }
  }

//  done medicine editint
  Future<void> _onMedicineUpdate(event, emit) async {
    try {
      await medicineRepo.editMedicine(event.medicineDomain);
      emit(MedicinesOperationSuccess());
    } catch (error) {
      emit(MedicineOperationFailure(error: error));
    }
  }

//  done with medicine delete
  Future<void> _onMedicineDelete(event, emit) async {
    try {
      await medicineRepo.deleteMedicine(event.id);
      emit(MedicinesOperationSuccess());
    } catch (error) {
      emit(MedicineOperationFailure(error: error));
    }
  }

  Future<void> _onMedicineSearch(event, emit) async {
    emit(SearchingMed());
    try {
      print("ere abeleeeeeeeeeeeeeeeeeeeeeeeeeee  event.name)");
      print(event.name);
      final response = await medicineRepo.searchMedicine(event.name.toString());
      emit(MedicinesSearchSuccess(medicineModel: response));
    } catch (error) {
      print(error);
      emit(MedicineOperationFailure(error: error));
    }
  }
}
