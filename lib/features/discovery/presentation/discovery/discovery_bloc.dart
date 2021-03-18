import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/discovery/domain/entity/discovery.dart';
import 'package:sport_platform/features/discovery/domain/usecases/get_discovery_data_use_case.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';

part 'discovery_event.dart';

part 'discovery_state.dart';


@singleton
class DiscoveryBloc extends Bloc<DiscoveryEvent, DiscoveryState> {

  final GetDiscoveryDataUseCase getDiscoveryDataUseCase;


  DiscoveryBloc({@required this.getDiscoveryDataUseCase}) : super(IdleDiscoveryState());


  @override
  Stream<DiscoveryState> mapEventToState(DiscoveryEvent event) async* {

    if(event is GetDiscovery){
      yield LoadingDiscoveryState();
      var res = await getDiscoveryDataUseCase(NoParams());
      yield res.fold(
              (l) => ErrorDiscoveryState(),
              (r) => LoadedDiscoveryState(data: r)
      );
    }

  }
}
