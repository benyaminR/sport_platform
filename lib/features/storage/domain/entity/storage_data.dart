import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class StorageData extends Equatable{
  final Uint8List data;
  final String path;

  StorageData({@required this.data, @required this.path});
  @override
  List<Object> get props => [data,path];
}