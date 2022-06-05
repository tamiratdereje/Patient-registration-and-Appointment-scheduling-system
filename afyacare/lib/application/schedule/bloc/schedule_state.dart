part of 'schedule_bloc.dart';

abstract class ScheduleState extends Equatable{
  const ScheduleState();

    @override
    List<Object> get props => [];

}

class ScheduleLoading extends ScheduleState {}

class SchedulesOperationSuccess extends ScheduleState {
  final List<ScheduleDomain> schedules;

   SchedulesOperationSuccess([this.schedules = const []]);
  @override
  List<Object> get props => [schedules];
}


class ScheduleOperationFailure extends ScheduleState {
  final Object error;
  ScheduleOperationFailure({required this.error});

  @override
  List<Object> get props => [error];
  
}