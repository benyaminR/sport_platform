part of 'storage_bloc.dart';

@immutable
abstract class StorageState extends Equatable{}

class IdleStorageState extends StorageState {
  @override
  List<Object> get props => [];
}

class StorageLoading extends StorageState {
  @override
  List<Object> get props => [];
}


class StorageError extends StorageState {
  final String msg;

  StorageError({@required this.msg});

  @override
  List<Object> get props => [msg];
}

class GetDownloadUrlCompleted extends StorageState {
  final String downloadUrl;

  GetDownloadUrlCompleted({@required this.downloadUrl});

  @override
  List<Object> get props => [downloadUrl];
}

class DeleteStorageDataCompleted extends StorageState {
  @override
  List<Object> get props => [];
}

class UploadStorageDataCompleted extends StorageState {

  UploadStorageDataCompleted();

  @override
  List<Object> get props => [];
}

