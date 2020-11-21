import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/storage/data/datasource/storage_repo_data_source.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';
import 'package:sport_platform/features/storage/domain/repository/storage_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';


@Singleton(as: StorageRepo)
class StorageRepoImpl implements StorageRepo{
  final StorageDataSource dataSource;

  StorageRepoImpl({@required this.dataSource});

  @override
  Future<Either<Failure, void>> deleteStorageData(String storagePath) async{
    try{
      return Right(await dataSource.deleteStorageData(storagePath));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getDownloadURL(String storagePath) async {
    try{
      return Right(await dataSource.getDownloadURL(storagePath));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StorageData>> replaceStorageData(StorageData data) async{
    try{
      return Right(await dataSource.replaceStorageData(data));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StorageData>> uploadStorageData(StorageData data) async{
    try{
      return Right(await dataSource.uploadStorageData(data));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}