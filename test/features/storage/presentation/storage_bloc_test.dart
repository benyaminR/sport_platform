



import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/features/storage/domain/usecase/DeleteStorageDataUseCase.dart';
import 'package:sport_platform/features/storage/domain/usecase/GetDownloadUrlUseCase.dart';
import 'package:sport_platform/features/storage/domain/usecase/ReplaceStorageDataUseCase.dart';
import 'package:sport_platform/features/storage/domain/usecase/UploadStorageDataUseCase.dart';
import 'package:sport_platform/features/storage/presentation/storage/storage_bloc.dart';
import 'package:sport_platform/utils/error/failure.dart';

class DeleteStorageDataUseCaseMock extends Mock implements DeleteStorageDataUseCase{}
class UploadStorageDataUseCaseMock extends Mock implements UploadStorageDataUseCase{}
class ReplaceStorageDataUseCaseMock extends Mock implements ReplaceStorageDataUseCase{}
class GetDownloadUrlUseCaseMock extends Mock implements GetDownloadUrlUseCase{}

main() {
  final deleteUC = DeleteStorageDataUseCaseMock();
  final uploadUC = UploadStorageDataUseCaseMock();
  final replaceUC = ReplaceStorageDataUseCaseMock();
  final getUC = GetDownloadUrlUseCaseMock();
  final data = StorageData(data: null, path: null);
  _bloc () => StorageBloc(
    delete : deleteUC,
    upload : uploadUC,
    replace : replaceUC,
    get : getUC
  );

  group('StorageBloc ', (){
    group('DeleteStorageDataEvent ',(){
      blocTest<StorageBloc,StorageState>('should emit in order [Loading, DeleteStorageDataEvent]',
          build:() {
            when(deleteUC(any)).thenAnswer((realInvocation) async => Right(null));
            return _bloc();
            },
          act: (bloc)=>bloc.add(DeleteStorageDataEvent(path:'deletePath')),
        expect: [StorageLoading(),DeleteStorageDataCompleted()]
      );

      blocTest<StorageBloc,StorageState>('should emit in order [Loading, StorageError]',
          build:() {
            when(deleteUC(any)).thenAnswer((_) async => Left(ServerFailure()));
            return _bloc();
          },
          act: (bloc)=> bloc.add(DeleteStorageDataEvent(path:'deletePath')),
          expect: [StorageLoading(), StorageError(msg: StorageBloc.DELETE_UNSUCCESSFUL)]
      );
    });

    group('UploadDataStorageEvent ',(){
      blocTest<StorageBloc,StorageState>('should emit in order [Loading, UploadDataStorageCompleted]',
          build:() {
            when(uploadUC(any)).thenAnswer((_) async => Right(null));
            return _bloc();
          },
          act: (bloc)=>bloc.add(UploadStorageDataEvent(data: data)),
          expect: [StorageLoading(),UploadStorageDataCompleted()]
      );

      blocTest<StorageBloc,StorageState>('should emit in order [Loading, StorageError]',
          build:() {
            when(uploadUC(any)).thenAnswer((_) async => Left(ServerFailure()));
            return _bloc();
          },
          act: (bloc)=> bloc.add(UploadStorageDataEvent(data:data)),
          expect: [StorageLoading(), StorageError(msg: StorageBloc.UPLOAD_UNSUCCESSFUL)]
      );
    });

    group('ReplaceStorageDataEvent ',(){
      blocTest<StorageBloc,StorageState>('should emit in order [Loading, ReplaceStorageDataCompleted]',
          build:() {
            when(replaceUC(any)).thenAnswer((_) async => Right(data));
            return _bloc();
          },
          act: (bloc)=>bloc.add(ReplaceStorageDataEvent(data: data)),
          expect: [StorageLoading(),ReplaceStorageDataCompleted(data: data)]
      );

      blocTest<StorageBloc,StorageState>('should emit in order [Loading, StorageError]',
          build:() {
            when(replaceUC(any)).thenAnswer((_) async => Left(ServerFailure()));
            return _bloc();
          },
          act: (bloc)=>bloc.add(ReplaceStorageDataEvent(data: data)),
          expect: [StorageLoading(), StorageError(msg: StorageBloc.REPLACE_UNSUCCESSFUL)]
      );
    });

    group('GetDownloadUrlEvent ',(){
      blocTest<StorageBloc,StorageState>('should emit in order [Loading, GetDownloadUrlCompleted]',
          build:() {
            when(getUC(any)).thenAnswer((_) async => Right('url'));
            return _bloc();
          },
          act: (bloc)=>bloc.add(GetDownloadUrlEvent(path: 'path')),
          expect: [StorageLoading(),GetDownloadUrlCompleted(downloadUrl: 'url')]
      );

      blocTest<StorageBloc,StorageState>('should emit in order [Loading, StorageError]',
          build:() {
            when(getUC(any)).thenAnswer((_) async => Left(ServerFailure()));
            return _bloc();
          },
          act: (bloc)=>bloc.add(GetDownloadUrlEvent(path: 'path')),
          expect: [StorageLoading(), StorageError(msg: StorageBloc.GET_UNSUCCESSFUL)]
      );
    });


  });





}