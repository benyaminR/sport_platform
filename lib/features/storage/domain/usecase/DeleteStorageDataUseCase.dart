import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/storage/domain/repository/storage_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class DeleteStorageDataUseCase extends UseCase<void,WithParams>{

  final StorageRepo repo;

  DeleteStorageDataUseCase({@required this.repo});

  @override
  Future<Either<Failure, void>> call(WithParams params) => repo.deleteStorageData(params.param);

}