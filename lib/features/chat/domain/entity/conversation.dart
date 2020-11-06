import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'message.dart';

class Conversation extends Equatable{
  final List<Message> messageData;


  Conversation({@required this.messageData});
  @override
  List<Object> get props => [messageData];
}