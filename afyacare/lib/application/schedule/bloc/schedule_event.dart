part of 'schedule_bloc.dart';

abstract class ScheduleEvent extends Equatable {

  const ScheduleEvent();
  @override
  List<Object> get props => [];

}

class ScheduleCreateEvent extends ScheduleEvent {

    final ScheduleDate scheduleDate;
    const ScheduleCreateEvent(this.scheduleDate);

    @override
    List<Object> get props => [scheduleDate];   
}


class ScheduleLoadEvent extends ScheduleEvent{

  const ScheduleLoadEvent();
  @override
  List<Object> get props => []; 

}


class ScheduleUpdateEvent extends ScheduleEvent {

  final ScheduleDomain scheduleDomain;
  const ScheduleUpdateEvent(this.scheduleDomain);

  @override
  List<Object> get props => [scheduleDomain]; 
  
}

class ScheduleDeleteEvent extends ScheduleEvent {

  final ScheduleId id;
  const ScheduleDeleteEvent(this.id);

  @override
  List<Object> get props => [id]; 
  
}