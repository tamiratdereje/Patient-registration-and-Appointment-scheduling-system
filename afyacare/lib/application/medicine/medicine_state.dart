import 'package:afyacare/domain/Medicine/medicine_Domain.dart';
import 'package:afyacare/domain/Medicine/medicine_name.dart';
import 'package:afyacare/infrastructure/medicine/medicine_model.dart';
import 'package:equatable/equatable.dart';

abstract class MedicineState extends Equatable {
  const MedicineState();

  @override
  List<Object> get props => [];
}

class MedicineLoading extends MedicineState {}

class MedicineAdding extends MedicineState {}

class MedicineAddSuccessful extends MedicineState {}

class MedicineAddFailed extends MedicineState {}

class MedicinesOperationSuccess extends MedicineState {
  final List<MedicineDomain> medicines;

  MedicinesOperationSuccess([this.medicines = const []]);

  @override
  List<Object> get props => [medicines];
}

class MedicineOperationFailure extends MedicineState {
  final Object error;
  MedicineOperationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
class searchFailed extends MedicineState{}

class MedicieSearchSuccessful extends MedicineState {
  final MedicineName medicineName;
  MedicieSearchSuccessful({required this.medicineName});
}

class Idle extends MedicineState{}
class SearchingMed extends MedicineState{}
class MedicinesSearchSuccess extends MedicineState {
  final MedicineModel medicineModel;
  MedicinesSearchSuccess({required this.medicineModel});
}
