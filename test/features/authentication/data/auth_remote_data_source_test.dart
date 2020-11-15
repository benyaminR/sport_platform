import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/data/datasource/auth_remote_data_source.dart';



main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AuthRemoteDataSource ', (){

    final fa = MockFirebaseAuth();
    final ds = AuthRemoteDataSourceImpl(firebaseAuth:fa);


    test('signInWithGoogle should call appropriate functions ', () async{
      //act
      var res = await ds.signInWithGoogle();
      //assert
      expect(res,isNotNull);
      verifyNoMoreInteractions(fa);
    });


    test('signInWithEmail should call appropriate functions', () async{
      //act
      var res = await ds.signInWithEmail('email', 'password');
      //assert
      expect(res,isNotNull);
    });

    test('registerWithEmail should call appropriate functions', () async{
      //act
      var res = await ds.registerWithEmail('email', 'password');
      //assert
      expect(res,isNotNull);
    });


  });
}