import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class StorageRepo{
  Future<Either<Failure,void>> deleteStorageData(String storagePath);
  Future<Either<Failure,String>> getDownloadURL(String storagePath);
  Future<Either<Failure,StorageData>> uploadStorageData(StorageData data);
}