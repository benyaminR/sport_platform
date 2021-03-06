import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/features/storage/domain/usecase/DeleteStorageDataUseCase.dart';
import 'package:sport_platform/features/storage/domain/usecase/GetDownloadUrlUseCase.dart';
import 'package:sport_platform/features/storage/domain/usecase/UploadStorageDataUseCase.dart';
import 'package:sport_platform/utils/usecases/params.dart';

part 'storage_event.dart';
part 'storage_state.dart';


@injectable
class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final DeleteStorageDataUseCase delete;
  final UploadStorageDataUseCase upload;
  final GetDownloadUrlUseCase get;

  static const DELETE_UNSUCCESSFUL = 'Delete was unsuccessful!';
  static const UPLOAD_UNSUCCESSFUL = 'Upload was unsuccessful!';
  static const GET_UNSUCCESSFUL = 'Get was unsuccessful!';

  StorageBloc(
      {
        @required this.delete,
        @required this.upload,
        @required this.get,
      } ) : super(IdleStorageState());

  @override
  Stream<StorageState> mapEventToState(StorageEvent event) async* {

    if(event is GetDownloadUrlEvent){
      yield StorageLoading();
      var res = await get(WithParams(param:event.path));
      yield res.fold(
              (l) => StorageError(msg: GET_UNSUCCESSFUL),
              (r) => GetDownloadUrlCompleted(downloadUrl: r)
      );
    }

    if(event is UploadStorageDataEvent){
      yield StorageLoading();
      var res = await upload(WithParams(param:event.data));
      yield res.fold(
              (l) => StorageError(msg: UPLOAD_UNSUCCESSFUL),
              (r) => UploadStorageDataCompleted()
      );
    }

    if(event is DeleteStorageDataEvent){
      yield StorageLoading();
      var res = await delete(WithParams(param:event.path));
      yield res.fold(
              (l) => StorageError(msg: DELETE_UNSUCCESSFUL),
              (r) => DeleteStorageDataCompleted()
      );
    }


  }

}
