import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sport_platform/features/users/domain/entity/tip.dart';

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

  static Map<String,dynamic> toMap(Tip tip)=>{
    'date':tip.date,
    'category':tip.category,
    'content':tip.content,
  };
}