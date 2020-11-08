import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer.dart';
import 'package:sport_platform/features/trainers/domain/usecase/add_trainer_use_case.dart';
import 'package:sport_platform/features/trainers/domain/usecase/get_trainers_use_case.dart';
import 'package:sport_platform/features/trainers/domain/usecase/remove_trainer_use_case.dart';
import 'package:sport_platform/features/trainers/domain/usecase/update_trainer_use_case.dart';
import 'package:sport_platform/utils/usecases/params.dart';

part 'trainers_event.dart';
part 'trainers_state.dart';


class TrainersBloc extends Bloc<TrainersEvent, TrainersState> {

  final AddTrainerUseCase addTrainerUseCase;
  final GetTrainersUseCase getTrainersUseCase;
  final RemoveTrainerUseCase removeTrainerUseCase;
  final UpdateTrainerUseCase updateTrainerUseCase;

  TrainersBloc(TrainersState initialState, this.addTrainerUseCase, this.getTrainersUseCase, this.removeTrainerUseCase, this.updateTrainerUseCase) : super(initialState);

  @override
  Stream<TrainersState> mapEventToState(TrainersEvent event) async* {
    //AddTrainerEvent
    if(event is AddTrainerEvent){
      yield LoadingTrainersState();
      var data = await addTrainerUseCase(WithParams(param:event.trainerData));
      yield data.fold(
              (l) => ErrorTrainersState(msg: 'Error'),
              (r) => LoadedTrainersState(trainers: [r])
      );
    }

    //GetTrainersEvent
    if(event is GetTrainersEvent){
      yield LoadingTrainersState();
      var data = await getTrainersUseCase(WithParams(param:event.criteriaData));
      yield data.fold(
              (l) => ErrorTrainersState(msg: 'Error'),
              (r) => LoadedTrainersState(trainers: r)
      );
    }

    //RemoveTrainerEvent
    if(event is RemoveTrainerEvent){
      yield LoadingTrainersState();
      var data = await removeTrainerUseCase(WithParams(param:event.uid));
      yield data.fold(
              (l) => ErrorTrainersState(msg: 'Error'),
              (r) => LoadedTrainersState(trainers: [r])
      );
    }

    //UpdateTrainerEvent
    if(event is UpdateTrainerEvent){
      yield LoadingTrainersState();
      var data = await updateTrainerUseCase(WithParams(param:event.trainerData));
      yield data.fold(
              (l) => ErrorTrainersState(msg: 'Error'),
              (r) => LoadedTrainersState(trainers: [r])
      );
    }


  }
}
