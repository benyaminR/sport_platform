import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CriteriaData extends Equatable{
  final String filter;
  final String data;

  CriteriaData({@required this.filter, this.data});
  @override
  List<Object> get props => [filter, data];
}