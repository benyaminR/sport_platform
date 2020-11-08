import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/chat/domain/entity/message.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';

@immutable
abstract class ChatEvent extends Equatable{}


class GetChatsEvent extends ChatEvent{
  final Criteria criteriaData;

  GetChatsEvent({@required this.criteriaData});

  @override
  List<Object> get props => [criteriaData];
}

class SendMessageEvent extends ChatEvent{
  final Message messageData;

  SendMessageEvent({@required this.messageData});

  @override
  List<Object> get props => [messageData];
}

class UpdateMessageEvent extends ChatEvent{
  final Message messageData;

  UpdateMessageEvent({@required this.messageData});

  @override
  List<Object> get props => [messageData];
}



