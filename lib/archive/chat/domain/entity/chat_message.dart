import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_media.dart';

class ChatMessage extends Equatable{
  final String receiver;
  final String sender;
  final ChatMedia mediaData;
  final String text;
  final String sentDate;
  final String receivedDate;

  ChatMessage({@required this.receiver, @required this.sender, @required this.mediaData, @required this.text, @required this.sentDate, @required this.receivedDate,});
  @override
  List<Object> get props => [receiver, sender, mediaData, text, sentDate,];
}