import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/data/datamodel/auth_data_model.dart';
import 'package:sport_platform/utils/error/exception.dart';

abstract class AuthRemoteDataSource {
  Future<AuthDatamodel> signInAnonymously();

  Future<AuthDatamodel> signInWithGoogle();

  Future<AuthDatamodel> signInWithApple();

  Future<AuthDatamodel> signInWithEmail(String email, String password);

  Future<AuthDatamodel> signInWithFacebook();

  Future<AuthDatamodel> checkAuthentication();
}

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({@required this.firebaseAuth});

  ///throws [ServerException] in case the firebase auth fails to sign in
  ///it support login for both logged in users and new users
  @override
  Future<AuthDatamodel> signInAnonymously() async {
    final credentials = await firebaseAuth.signInAnonymously();
    return Future.value(AuthDatamodel(userCredential: credentials));
  }

  @override
  Future<AuthDatamodel> signInWithApple() {
    throw UnimplementedError();
  }

  ///throws [ServerException] in case the password or email are incorrect
  ///it support login for both logged in users and new users???
  @override
  Future<AuthDatamodel> signInWithEmail(String email, String password) async {
    try {
      var credentials = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Future.value(AuthDatamodel(userCredential: credentials));
    } on Exception {
      throw ServerException();
    }
  }

  ///throws [ServerException] in case user closes the pop up before fully signing in
  ///it support login for both logged in users and new users
  @override
  Future<AuthDatamodel> signInWithFacebook() async {
    throw UnimplementedError();

//    final facebookAuth = FacebookAuth.instance;
//
//    final isSignedIn = await facebookAuth.isLogged != null;
//
//    if(!isSignedIn) {
//      final LoginResult result = await facebookAuth.login();
//
//      if(result == null) throw ServerException();
//
//      final FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider
//          .credential(result.accessToken.token);
//      var credentials = await firebaseAuth.signInWithCredential(
//          facebookAuthCredential);
//      return Future.value(AuthDatamodel(userCredential: credentials));
//
//    }else{
//      var accessToken = await facebookAuth.isLogged;
//      final FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
//
//      var credentials = await firebaseAuth.signInWithCredential(facebookAuthCredential);
//
//      return Future.value(AuthDatamodel(userCredential: credentials));
//    }
  }

  ///throws [ServerException] in case user closes the pop up before fully signing in
  ///it support login for both logged in users and new users
  @override
  Future<AuthDatamodel> signInWithGoogle() async {
    // hold the instance of the authenticated user
    UserCredential user;
    // flag to check whether we're signed in already
    bool isSignedIn = await GoogleSignIn().isSignedIn();

    if (!isSignedIn) {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      //if user closes the sign in window
      if (googleUser == null) throw ServerException();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      var credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      user = await firebaseAuth.signInWithCredential(credentials);

      return Future.value(AuthDatamodel(userCredential: user));
    } else {
      final GoogleSignInAuthentication googleAuth =
          await GoogleSignIn().currentUser.authentication;

      var credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      user = await firebaseAuth.signInWithCredential(credentials);

      return Future.value(AuthDatamodel(userCredential: user));
    }
  }

  @override
  Future<AuthDatamodel> checkAuthentication() {
    if (firebaseAuth.currentUser == null) throw ServerException();
    return Future.value(AuthDatamodel(userCredential: null));
  }
}
