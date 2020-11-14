import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/chat/data/datasource/chat_data_source.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_criteria.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/features/chat/domain/repository/chat_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class ChatRepoImpl implements ChatRepo{

  final ChatDataSource dataSource;

  ChatRepoImpl({@required this.dataSource});

  @override
  Future<Either<Failure, List<ChatMessage>>> getChats(ChatCriteria criteriaData) async {
    try{
      return Right(await dataSource.getChats(criteriaData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ChatMessage>> sendMessage(ChatMessage messageData) async{
    try{
      return Right(await dataSource.sendMessage(messageData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ChatMessage>> updateMessage(ChatMessage messageData) async {
    try{
      return Right(await dataSource.updateMessage(messageData));
    }on ServerException{
    return Left(ServerFailure());
    }
  }

}