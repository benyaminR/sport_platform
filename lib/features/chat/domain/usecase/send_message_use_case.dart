import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/features/chat/domain/repository/chat_repo.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class SendMessageUseCase extends UseCase<ChatMessage,WithParams>{

  final ChatRepo repo;

  SendMessageUseCase({@required this.repo});


  @override
  Future<Either<Failure, ChatMessage>> call(WithParams params) => repo.sendMessage(params.param);
}