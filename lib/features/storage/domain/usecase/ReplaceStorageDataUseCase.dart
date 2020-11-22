import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/features/storage/domain/repository/storage_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';
@singleton
class ReplaceStorageDataUseCase extends UseCase<StorageData,WithParams>{

  final StorageRepo repo;

  ReplaceStorageDataUseCase({@required this.repo});

  @override
  Future<Either<Failure, StorageData>> call(WithParams params) => repo.replaceStorageData(params.param);

}