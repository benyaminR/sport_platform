part of 'storage_bloc.dart';

@immutable
abstract class StorageEvent extends Equatable{}

class GetDownloadUrlEvent extends StorageEvent{
  final String path;

  GetDownloadUrlEvent({this.path});

  @override
  List<Object> get props => [path];
}

class DeleteStorageDataEvent extends StorageEvent{
  final String path;

  DeleteStorageDataEvent({this.path});

  @override
  List<Object> get props => [path];
}

class UploadStorageDataEvent extends StorageEvent{
  final StorageData data;

  UploadStorageDataEvent({this.data});

  @override
  List<Object> get props => [data];
}

