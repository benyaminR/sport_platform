import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/features/storage/domain/repository/storage_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class GetDownloadUrlUseCase extends UseCase<String,WithParams>{

  final StorageRepo repo;

  GetDownloadUrlUseCase({@required this.repo});

  @override
  Future<Either<Failure, String>> call(WithParams params) => repo.getDownloadURL(params.param);

}