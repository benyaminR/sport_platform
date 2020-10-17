import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/data/datasource/auth_remote_data_source.dart';



main() {
  group('AuthRemoteDataSource ', (){

    final fa = MockFirebaseAuth();
    final ds = AuthRemoteDataSourceImpl(firebaseAuth:fa);

    test('signInAnonymously should signIn and return @UserCredential', () async{
      //act
      var res = await ds.signInAnonymously();
      //assert
      expect(res.creds, isNotNull);
    });

    test('signInWithGoogle should call appropriate functions ', () async{

      //act
      var res = await ds.signInWithGoogle();
      //assert
      expect(res,isNotNull);
      verify(fa.signInWithRedirect(any));
      verify(fa.getRedirectResult());
      verifyNoMoreInteractions(fa);
    });


    test('signInWithFacebook should call appropriate functions', () async{

      //act
      var res = await ds.signInWithFacebook();
      //assert
      expect(res,isNotNull);
      verify(fa.signInWithRedirect(any));
      verify(fa.getRedirectResult());
      verifyNoMoreInteractions(fa);
    });


    test('signInWithEmail should call appropriate functions', () async{

      //act
      var res = await ds.signInWithEmail('email', 'password');
      //assert
      expect(res,isNotNull);
      verifyNoMoreInteractions(fa);
    });


  });
}