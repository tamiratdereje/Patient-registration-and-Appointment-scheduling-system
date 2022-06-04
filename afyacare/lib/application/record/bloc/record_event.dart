part of 'record_bloc.dart';


abstract class RecordEvent extends Equatable {

  const RecordEvent();

  @override
  List<Object> get props => [];
}


class RecordCreateEvent extends RecordEvent {

    final RecordDomain recordDomain;
    const RecordCreateEvent(this.recordDomain);

    @override
    List<Object> get props => [recordDomain];
}


class RecordLoadAllEvent extends RecordEvent{
  
  RecordPatientId patientId;
  RecordLoadAllEvent(this.patientId);

  @override
  List<Object> get props => [patientId]; 
}


class RecordDetailLoadEvent extends RecordEvent{

  final RecordId id;
  const RecordDetailLoadEvent(this.id);

  @override
  List<Object> get props => [id]; 
}




class RecordUpdateEvent extends RecordEvent {

  final RecordDomain recordDomain;
  const RecordUpdateEvent(this.recordDomain);

  @override
  List<Object> get props => [recordDomain]; 
  
}

class RecordDeleteEvent extends RecordEvent {

  final RecordId id;
  const RecordDeleteEvent(this.id);

  @override
  List<Object> get props => [id]; 
  
}
