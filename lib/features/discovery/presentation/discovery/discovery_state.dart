part of 'discovery_bloc.dart';

@immutable
abstract class DiscoveryState {}

class IdleDiscoveryState extends DiscoveryState {}

class LoadingDiscoveryState extends DiscoveryState{}


class ErrorDiscoveryState extends DiscoveryState{}

class LoadedDiscoveryState extends DiscoveryState{
  final DiscoveryData data;
  LoadedDiscoveryState({@required this.data});
}