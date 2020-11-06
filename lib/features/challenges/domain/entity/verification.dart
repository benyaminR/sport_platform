import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Verification extends Equatable{
  final bool isVerified;
  final String verificationDate;
  final String verifiedBy;


  Verification({@required this.isVerified, @required this.verificationDate, @required this.verifiedBy});
  @override
  List<Object> get props => [isVerified, verificationDate, verifiedBy];
}