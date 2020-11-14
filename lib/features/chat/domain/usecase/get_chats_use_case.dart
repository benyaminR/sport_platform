import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_conversation.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/features/chat/domain/repository/chat_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

class GetChatsUseCase extends UseCase<List<ChatMessage>,WithParams>{

  final ChatRepo repo;

  GetChatsUseCase({@required this.repo});

  @override
  Future<Either<Failure, List<ChatMessage>>> call(WithParams params) => repo.getChats(params.param);
}
