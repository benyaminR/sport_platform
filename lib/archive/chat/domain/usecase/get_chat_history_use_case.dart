import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_history.dart';
import 'package:sport_platform/archive/chat/domain/repository/chat_repo.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import 'package:sport_platform/utils/usecases/usecase.dart';

@singleton
class GetChatHistoryUseCase extends UseCase<Stream<List<ChatHistory>>,NoParams>{

  final ChatRepo repo;

  GetChatHistoryUseCase({@required this.repo});


  @override
  Future<Either<Failure, Stream<List<ChatHistory>>>> call(NoParams params) => repo.getChatHistory();
}