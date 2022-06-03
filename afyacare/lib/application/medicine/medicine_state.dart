import 'package:afyacare/domain/Medicine/medicine_Domain.dart';
import 'package:equatable/equatable.dart';

abstract class MedicineState extends Equatable {
  const MedicineState();

  @override
  List<Object> get props => [];
}

class MedicineLoading extends MedicineState {}

class MedicinesOperationSuccess extends MedicineState {
  final Iterable<MedicineDomain> medicines;

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