import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/chat/domain/entity/conversation.dart';
import 'package:sport_platform/features/chat/domain/entity/message.dart';
import 'package:sport_platform/features/chat/domain/repository/chat_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

class GetChatsUseCase extends UseCase<List<Message>,WithParams>{

  final ChatRepo repo;

  GetChatsUseCase({@required this.repo});


  @override
  Future<Either<Failure, List<Conversation>>> call(WithParams params) => repo.getChats(params.param);
}
