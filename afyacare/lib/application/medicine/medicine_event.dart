import 'package:afyacare/domain/Medicine/medicine_Domain.dart';
import 'package:afyacare/domain/Medicine/medicine_name.dart';
import 'package:equatable/equatable.dart';

abstract class MedicineEvent extends Equatable {
  const MedicineEvent();
  @override
  List<Object> get props => [];
}

class MedicineCreateEvent extends MedicineEvent {
  final MedicineDomain medicineDomain;
  const MedicineCreateEvent(this.medicineDomain);

  @override
  List<Object> get props => [medicineDomain];
}

class MedicineLoadAllEvent extends MedicineEvent {
  const MedicineLoadAllEvent();

  @override
  List<Object> get props => [];
}

class MedicineDetailLoadEvent extends MedicineEvent {
  final MedicineId id;
  const MedicineDetailLoadEvent(this.id);

  @override
  List<Object> get props => [id];
}

class MedicineUpdateEvent extends MedicineEvent {
  final MedicineDomain medicineDomain;
  const MedicineUpdateEvent(this.medicineDomain);

  @override
  List<Object> get props => [medicineDomain];
}

class MedicineDeleteEvent extends MedicineEvent {
  final MedicineId id;
  const MedicineDeleteEvent(this.id);

  @override
  List<Object> get props => [id];
}


class SearchMedicine extends MedicineEvent {
  final String name;
  const SearchMedicine(this.name);

  @override
  List<Object> get props => [name];
}

class medIdle extends MedicineEvent{}
