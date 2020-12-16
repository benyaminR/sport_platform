import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ChatHistory extends Equatable{
  final String sender;
  final String date;
  final String text;
  final String profileImage;

  ChatHistory({@required this.sender, @required this.date, @required this.text, @required this.profileImage});

  @override
  List<Object> get props => [sender,
    date,
    text,
    profileImage];


}