import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Tip extends Equatable{
  final String date;
  final String category;
  final String content;


  Tip({@required this.date, @required this.category, @required this.content});
  @override
  List<Object> get props => [date, category, content];
}