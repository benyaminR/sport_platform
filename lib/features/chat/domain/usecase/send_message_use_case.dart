import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/chat/domain/entity/message.dart';
import 'package:sport_platform/features/chat/domain/repository/chat_repo.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

class SendMessageUseCase extends UseCase<Message,WithParams>{

  final ChatRepo repo;

  SendMessageUseCase({@required this.repo});


  @override
  Future<Either<Failure, Message>> call(WithParams params) => repo.sendMessage(params.param);
}