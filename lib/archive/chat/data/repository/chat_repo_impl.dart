import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/archive/chat/data/datasource/chat_data_source.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_history.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/archive/chat/domain/repository/chat_repo.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';


@Singleton(as: ChatRepo)
class ChatRepoImpl implements ChatRepo{

  final ChatDataSource dataSource;

  ChatRepoImpl({@required this.dataSource});

  @override
  Future<Either<Failure, Stream<List<ChatMessage>>>> getChats(String userID) async {
    try{
      return Right(await dataSource.getChats(userID));
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

  @override
  Future<Either<Failure, Stream<List<ChatHistory>>>> getChatHistory() async{
    try{
      return Right(await dataSource.getChatHistory());
    }on ServerException{
    return Left(ServerFailure());
    }
  }

}