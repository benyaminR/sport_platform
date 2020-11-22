import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/storage/data/datamodel/storage_data_data_model.dart';
import 'package:sport_platform/features/storage/data/datasource/storage_repo_data_source.dart';
import 'package:sport_platform/features/storage/data/repository/storage_repo_imp.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class StorageDataSourceMock extends Mock implements StorageDataSource{}

main() {
  final dataSource = StorageDataSourceMock();
  final repo = StorageRepoImpl(dataSource: dataSource);
  final testData = StorageDataDataModel(data: null, path: null);

  group('StorageRepoImpl ',(){
    group('removeStorageData ', (){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.deleteStorageData('path')).thenThrow(ServerException());
        //act
        final res = await repo.deleteStorageData('path');
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.deleteStorageData('path'));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //act
        await repo.deleteStorageData('path');
        //asses
        verify(dataSource.deleteStorageData('path'));
        verifyNoMoreInteractions(dataSource);
      });
    });
    group('uploadStorageData ', (){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.uploadStorageData(testData)).thenThrow(ServerException());
        //act
        final res = await repo.uploadStorageData(testData);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.uploadStorageData(testData));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.uploadStorageData(testData)).thenAnswer((_) async => testData);
        //act
        final res = await repo.uploadStorageData(testData);
        //asses
        expect(res, Right(testData));
        verify(dataSource.uploadStorageData(testData));
        verifyNoMoreInteractions(dataSource);
      });
    });

    group('getDownloadUrl ', (){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.getDownloadURL('path')).thenThrow(ServerException());
        //act
        final res = await repo.getDownloadURL('path');
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.getDownloadURL('path'));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.getDownloadURL('path')).thenAnswer((_) async => 'url');
        //act
        final res = await repo.getDownloadURL('path');
        //asses
        expect(res, Right('url'));
        verify(dataSource.getDownloadURL('path'));
        verifyNoMoreInteractions(dataSource);
      });
    });
  });
}