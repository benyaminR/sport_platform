
import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/chat/domain/entity/conversation.dart';
import 'package:sport_platform/features/chat/domain/entity/message.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class ChatRepo{
  Future<Either<Failure, List<Conversation>>> getChats(CommunityCriteria criteriaData);
  Future<Either<Failure, Message>> sendMessage(Message messageData);
  Future<Either<Failure, Message>> updateMessage(Message messageData);
}
