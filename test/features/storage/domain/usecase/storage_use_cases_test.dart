

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/features/storage/domain/repository/storage_repo.dart';
import 'package:sport_platform/features/storage/domain/usecase/DeleteStorageDataUseCase.dart';
import 'package:sport_platform/features/storage/domain/usecase/GetDownloadUrlUseCase.dart';
import 'package:sport_platform/features/storage/domain/usecase/ReplaceStorageDataUseCase.dart';
import 'package:sport_platform/features/storage/domain/usecase/UploadStorageDataUseCase.dart';
import 'package:sport_platform/utils/usecases/params.dart';
class MockStorageRepo extends Mock implements StorageRepo{}

main() {
  final repo = MockStorageRepo();
  final deleteUC = DeleteStorageDataUseCase(repo: repo);
  final uploadUC = UploadStorageDataUseCase(repo: repo);
  final replaceUC = ReplaceStorageDataUseCase(repo: repo);
  final getUC = GetDownloadUrlUseCase(repo: repo);

  group('Storage UseCases redirect' , (){
    test('DeleteStorageDataUseCase should redirect to repo.deleteStorageData()',()async{
      //arrange
      final path = 'path';
      //act
      await deleteUC(WithParams(param: path));
      //assert
      verify(repo.deleteStorageData(path));
    });
    test('UploadStorageDataUseCase should redirect to repo.uploadStorageData()',()async{
      //arrange
      final data = StorageData(data: null, path: null);
      //act
      await uploadUC(WithParams(param: data));
      //assert
      verify(repo.uploadStorageData(data));
    });

    test('ReplaceStorageDataUseCase should redirect to repo.replaceStorageData()',()async{
      //arrange
      final data = StorageData(data: null, path: null);
      //act
      await replaceUC(WithParams(param: data));
      //assert
      verify(repo.replaceStorageData(data));
    });

    test('GetDownloadUrlUseCase should redirect to repo.getDownloadUrl()',()async{
      //arrange
      final path = 'path';
      //act
      await getUC(WithParams(param: path));
      //assert
      verify(repo.getDownloadURL(path));
    });

  });

}