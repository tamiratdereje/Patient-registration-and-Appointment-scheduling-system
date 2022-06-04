part of 'record_bloc.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}


// class RecordInitial extends RecordState {


// }

class RecordLoading extends RecordState {

  
}

class RecordOperationSuccess extends RecordState {

  final Iterable<RecordDomain> records;
  RecordOperationSuccess([this.records = const []]);

  @override
  List<Object> get props => [records];

}

class RecordOperationFailure extends RecordState {

  final Object error;
  RecordOperationFailure({required this.error});

  @override
  List<Object> get props => [error];

}
