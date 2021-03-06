import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth extends Equatable{
  final UserCredential creds;

  Auth({@required this.creds});
  @override
  List<Object> get props => [creds];
}