import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth_data.dart';

class AuthDatamodel extends AuthData{
  final UserCredential userCredential;

  AuthDatamodel({@required this.userCredential}):super(creds: userCredential);

}

