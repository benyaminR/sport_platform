import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserChallenge extends Equatable{
  final String challengePath;
  final String title;



  UserChallenge({@required this.challengePath, @required this.title});

  @override
  List<Object> get props => [challengePath, title];
}