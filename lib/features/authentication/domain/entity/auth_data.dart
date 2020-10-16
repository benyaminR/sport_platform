import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthData extends Equatable{
  final String msg;

  AuthData({@required this.msg});
  @override
  List<Object> get props => [msg];

}