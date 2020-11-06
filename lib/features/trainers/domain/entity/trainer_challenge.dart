import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TrainerChallenge extends Equatable{
  final String challengePath;
  final String title;


  TrainerChallenge({@required this.challengePath, @required this.title});
  @override
  List<Object> get props => [challengePath, title];
}