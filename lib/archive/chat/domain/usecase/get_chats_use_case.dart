import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/archive/chat/domain/repository/chat_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class GetChatsUseCase extends UseCase<Stream<List<ChatMessage>>,WithParams>{

  final ChatRepo repo;

  GetChatsUseCase({@required this.repo});

  @override
  Future<Either<Failure, Stream<List<ChatMessage>>>> call(WithParams params) => repo.getChats(params.param);
}
