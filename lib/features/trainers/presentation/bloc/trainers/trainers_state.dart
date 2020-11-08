part of 'trainers_bloc.dart';

@immutable
abstract class TrainersState extends Equatable{}


class IdleTrainersState extends TrainersState{
  @override
  List<Object> get props => [];
}

class LoadingTrainersState extends TrainersState{
  @override
  List<Object> get props => [];
}

class LoadedTrainersState extends TrainersState{
  final List<Trainer> trainers;

  LoadedTrainersState({@required this.trainers});

  @override
  List<Object> get props => [trainers];
}


class ErrorTrainersState extends TrainersState{
  final String msg;

  ErrorTrainersState({@required this.msg});

  @override
  List<Object> get props => [msg];
}