part of 'discovery_bloc.dart';

@immutable
abstract class DiscoveryEvent extends Equatable{}


class GetDiscovery extends DiscoveryEvent{
  @override
  List<Object> get props => [];
}