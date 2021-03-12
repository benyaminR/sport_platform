
import 'dart:ffi';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/storage/data/datamodel/storage_data_data_model.dart';
import 'package:sport_platform/features/storage/data/datasource/storage_repo_data_source.dart';
import 'package:sport_platform/utils/error/exception.dart';

class FirebaseStorageMock extends Mock implements FirebaseStorage{}
class FirebaseRefMock extends Mock implements StorageReference{}
class TaskMock extends Mock implements StorageUploadTask{}
class TaskSnapshotMock extends Mock implements StorageTaskSnapshot{}

main() {
  final firebaseStorage = FirebaseStorageMock();
  final datasource = StorageDataSourceImpl(firebaseStorage: firebaseStorage);
  final ref = FirebaseRefMock();
  final invalidPath = 'invalidPath';
  final correctPath = 'correctPath';
  final nullPath = null;

  final storageDataDataMissing = StorageDataDataModel(data: null, path: correctPath);
  final storageDataPathMissing = StorageDataDataModel(data: Uint8List(10), path: nullPath);
  final storageData = StorageDataDataModel(data: Uint8List(10), path: correctPath);
  final storageDataInvalidPath= StorageDataDataModel(data: Uint8List(10), path: invalidPath);

  final task = TaskMock();
  final snapshot = TaskSnapshotMock();

  group('StorageDataSource',(){
    group('deleteStorageData ', (){
      test('should throw exception if path == nullPath ', () async{
        //assert
        expect(()=> datasource.deleteStorageData(nullPath),throwsException);
      });

      test('should throw exception if path is invalid ', () async{
        when(firebaseStorage.ref()).thenAnswer((realInvocation) => ref);
        when(ref.child(invalidPath)).thenThrow(ServerException());
        //assert
        expect(()=> datasource.deleteStorageData(invalidPath),throwsException);
      });

      test('should delete data successfully', () async{
        //arrange
        when(firebaseStorage.ref()).thenAnswer((_) => ref);
        when(ref.child(correctPath)).thenAnswer((_) => ref);
        //assert
        expect(() async => await datasource.deleteStorageData(correctPath),returnsNormally);
      });
    });

    group('getDownloadURL ', (){
      test('should throw exception if path == nullPath ', () async{
        //assert
        expect(()=> datasource.getDownloadURL(nullPath),throwsException);
      });

      test('should throw exception if path is invalid ', () async{
        when(firebaseStorage.ref()).thenAnswer((realInvocation) => ref);
        when(ref.child(invalidPath)).thenThrow(ServerException());
        //assert
        expect(()=> datasource.getDownloadURL(invalidPath),throwsException);
      });

      test('should get downloadUrl successfully', () async{
        //arrange
        when(firebaseStorage.ref()).thenAnswer((_) => ref);
        when(ref.child(correctPath)).thenAnswer((_) => ref);
        when(ref.getDownloadURL()).thenAnswer((_) async=> 'url' );
        //act
        var url = await datasource.getDownloadURL(correctPath);
        //assert
        expect(url, 'url');
      });

    });

    group('uploadStorageData ', (){
      test('should throw exception if path == nullPath', () async{
        //assert
        expect(()=> datasource.uploadStorageData(storageDataPathMissing),throwsException);
      });

      test('should throw exception if data == null', () async{
        //assert
        expect(()=> datasource.uploadStorageData(storageDataDataMissing),throwsException);
      });

      test('should throw exception if path is invalid ', () async{
        when(firebaseStorage.ref()).thenAnswer((realInvocation) => ref);
        when(ref.child(invalidPath)).thenThrow(ServerException());
        //assert
        expect(()=> datasource.uploadStorageData(storageDataInvalidPath),throwsException);
      });

      test('should upload successfully', () async{
        //arrange
        when(firebaseStorage.ref()).thenAnswer((_) => ref);
        when(ref.child(storageData.path)).thenAnswer((_) => ref);
        when(task.onComplete).thenAnswer((_) async => snapshot);
        when(ref.putData(storageData.data)).thenAnswer((_) => task );
        //act
        var data = await datasource.uploadStorageData(storageData);
        //assert
        expect(data, storageData);
      });

    });

  });
}