import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ChatHistory extends Equatable{
  final String sender;
  final String date;
  final String text;
  final String profileImage;
  final String uid;

  ChatHistory({@required this.sender, @required this.date, @required this.text, @required this.profileImage, @required this.uid});

  @override
  List<Object> get props => [sender,
    date,
    text,
    profileImage,
    uid

  ];


}