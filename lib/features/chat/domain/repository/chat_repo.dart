import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/chat/domain/entity/message.dart';
import 'package:sport_platform/features/community/domain/entity/criteria.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class ChatRepo{
  Future<Either<Failure, List<Message>>> getChats(Criteria criteriaData);
  Future<Either<Failure, Message>> sendMessage(Message messageData);
  Future<Either<Failure, Message>> updateMessage(Message messageData);
}