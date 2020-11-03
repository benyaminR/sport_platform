import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class WithParams extends Equatable{
  final Object param;

  WithParams({@required  this.param});

  @override
  // TODO: implement props
  List<Object> get props => [param];

}