
import 'package:dartz/dartz.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_criteria.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/utils/error/failure.dart';

abstract class ChatRepo{
  Future<Either<Failure, List<ChatMessage>>> getChats(ChatCriteria criteriaData);
  Future<Either<Failure, ChatMessage>> sendMessage(ChatMessage messageData);
  Future<Either<Failure, ChatMessage>> updateMessage(ChatMessage messageData);
}
