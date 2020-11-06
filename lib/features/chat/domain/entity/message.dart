import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/community/domain/entity/media.dart';

class Message extends Equatable{
  final String receiver;
  final String sender;
  final Media mediaData;
  final String text;
  final String sentDate;
  final String receivedDate;
  final String readDate;


  Message({@required this.receiver, @required this.sender, @required this.mediaData, @required this.text, @required this.sentDate, @required this.receivedDate, @required this.readDate});
  @override
  List<Object> get props => [receiver, sender, mediaData, text, sentDate, readDate, readDate];
}