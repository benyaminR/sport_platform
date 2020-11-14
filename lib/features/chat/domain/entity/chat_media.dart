import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChatMedia extends Equatable{
  final String source;
  final String mediaType;


  ChatMedia({@required this.source,@required this.mediaType});
  @override
  List<Object> get props => [source,mediaType];


}