import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/authentication/data/datamodel/auth_data_model.dart';
import 'package:sport_platform/utils/error/exception.dart';

abstract class AuthRemoteDataSource{
  Future<AuthDatamodel> signInWithGoogle();
  Future<AuthDatamodel> signInWithEmail(String email, String password);
  Future<AuthDatamodel> registerWithEmail(String email, String password);
  Future<void> checkAuthentication();
  Future<AuthDatamodel> sendPasswordRecoveryEmail(String email);
}

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({@required this.firebaseAuth});


  @override
  Future<AuthDatamodel> signInWithEmail(String email, String password) async {
    print(email);
    var credentials = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return Future.value(AuthDatamodel(userCredential: credentials));
  }


  @override
  Future<AuthDatamodel> signInWithGoogle() async{
    // hold the instance of the authenticated user
    UserCredential user;
    // flag to check whether we're signed in already
    bool isSignedIn = await GoogleSignIn().isSignedIn();

    if(!isSignedIn) {

      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      //if user closes the sign in window
      if(googleUser == null) throw ServerException();

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      var credentials = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);
      user = await firebaseAuth.signInWithCredential(credentials);

      return Future.value(AuthDatamodel(userCredential: user));

    } else {

      final GoogleSignInAuthentication googleAuth = await GoogleSignIn().currentUser.authentication;

      var credentials = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);
      user = await firebaseAuth.signInWithCredential(credentials);

      return Future.value(AuthDatamodel(userCredential: user));
    }

  }

  @override
  Future<void> checkAuthentication() async {
    if(firebaseAuth.currentUser == null)
      throw ServerException();
    return Future.value();
  }

  @override
  Future<AuthDatamodel> registerWithEmail(String email, String password) async{
    var credentials = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return Future.value(AuthDatamodel(userCredential: credentials));
  }

  @override
  Future<AuthDatamodel> sendPasswordRecoveryEmail(String email) async{
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return Future.value(AuthDatamodel(userCredential: null));
  }



}