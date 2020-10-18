import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/data/datamodel/auth_data_model.dart';

abstract class AuthRemoteDataSource{
  Future<AuthDatamodel> signInAnonymously();
  Future<AuthDatamodel> signInWithGoogle();
  Future<AuthDatamodel> signInWithApple();
  Future<AuthDatamodel> signInWithEmail(String email, String password);
  Future<AuthDatamodel> signInWithFacebook();
}

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({@required this.firebaseAuth});

  @override
  Future<AuthDatamodel> signInAnonymously() async{
    final credentials = await firebaseAuth.signInAnonymously();
    return Future.value(AuthDatamodel(userCredential: credentials));
  }

  @override
  Future<AuthDatamodel> signInWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<AuthDatamodel> signInWithEmail(String email, String password) async {
    var authCred = EmailAuthProvider.credential(email: email, password: password);
    var credentials = await firebaseAuth.signInWithCredential(authCred);
    return Future.value(AuthDatamodel(userCredential: credentials));
  }

  @override
  Future<AuthDatamodel> signInWithFacebook() async {
    var credentials = await firebaseAuth.signInWithPopup(FacebookAuthProvider());
    return Future.value(AuthDatamodel(userCredential: credentials));
  }

  @override
  Future<AuthDatamodel> signInWithGoogle() async{
    // hold the instance of the authenticated user
    UserCredential user;
    // flag to check whether we're signed in already
    bool isSignedIn = await GoogleSignIn().isSignedIn();

    if(isSignedIn) {
      final GoogleSignInAccount googleUser =
      await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      var credentials = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);
      user = await firebaseAuth.signInWithCredential(credentials);
      return Future.value(AuthDatamodel(userCredential: user));
    } else {
      final GoogleSignInAuthentication googleAuth =
      await GoogleSignIn().currentUser.authentication;
      var credentials = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);
      user = await firebaseAuth.signInWithCredential(credentials);
      return Future.value(AuthDatamodel(userCredential: user));
    }


  }



}