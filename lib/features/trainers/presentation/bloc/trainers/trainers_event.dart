part of 'trainers_bloc.dart';

@immutable
abstract class TrainersEvent extends Equatable{}


class AddTrainerEvent extends TrainersEvent{
  final Trainer trainerData;

  AddTrainerEvent({@required this.trainerData});

  @override
  List<Object> get props => [trainerData];
}

class GetTrainersEvent extends TrainersEvent{
  final Criteria criteriaData;

  GetTrainersEvent({@required this.criteriaData});

  @override
  List<Object> get props => [criteriaData];
}

class RemoveTrainerEvent extends TrainersEvent{
  final String uid;

  RemoveTrainerEvent({@required this.uid});

  @override
  List<Object> get props => [uid];
}

class UpdateTrainerEvent extends TrainersEvent{
  final Trainer trainerData;

  UpdateTrainerEvent({@required this.trainerData});

  @override
  List<Object> get props => [trainerData];
}


