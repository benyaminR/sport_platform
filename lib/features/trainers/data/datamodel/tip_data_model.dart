import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/trainers/domain/entity/tip.dart';

class TipDataModel extends Tip{

  TipDataModel({@required date, @required category, @required content}):super(
    content: content,
    category: category,
    date: date
  );

  factory TipDataModel.fromMap(Map<String,dynamic> map)=> TipDataModel(
    date: map['data'],
    category: map['category'],
    content: map['content'],
  );

  Map<String,dynamic> toMap()=>{
    'date':date,
    'category':category,
    'content':content,
  };
}