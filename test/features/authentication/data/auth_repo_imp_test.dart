


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/data/datamodel/auth_data_model.dart';
import 'package:sport_platform/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:sport_platform/features/authentication/data/repository/auth_repo_imp.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class AuthRemoteDataSourceMock extends Mock implements AuthRemoteDataSource{}

main() {

  final datasource = AuthRemoteDataSourceMock();
  final repo = AuthRepoImp(dataSource:datasource);
  final left = ServerFailure();
  final right = AuthDatamodel(userCredential: null);

  group('AuthRepoImp ', () {

    group('SignInWithGoogle ',(){

      test('should handle right',() async{
        //arrange
        when(datasource.signInWithGoogle()).thenAnswer((_) async => right);
        //act
        var res = await repo.signInWithGoogle();
        //assert
        expect(res,Right(right));
      });

      test('should handle left',() async{
        //arrange
        when(datasource.signInWithGoogle()).thenThrow(ServerException());
        //act
        var res = await repo.signInWithGoogle();
        //assert
        expect(res,Left(left));
      });
    });

    group('SignInWithEmail ',(){
      test('should handle right',() async{
        //arrange
        when(datasource.signInWithEmail('email', 'password')).thenAnswer((_) async => right);
        //act
        var res = await repo.signInWithEmail('email', 'password');
        //assert
        expect(res,Right(right));
      });

      test('should handle left',() async{
        //arrange
        when(datasource.signInWithEmail('email', 'password')).thenThrow(ServerException());
        //act
        var res = await repo.signInWithEmail('email', 'password');
        //assert
        expect(res,Left(left));
      });
    });

    group('RegisterWithEmail ',(){
      test('should handle right',() async{
        //arrange
        when(datasource.registerWithEmail('email', 'password')).thenAnswer((_) async => right);
        //act
        var res = await repo.registerWithEmail('email', 'password');
        //assert
        expect(res,Right(right));
      });

      test('should handle left',() async{
        //arrange
        when(datasource.registerWithEmail('email', 'password')).thenThrow(ServerException());
        //act
        var res = await repo.registerWithEmail('email', 'password');
        //assert
        expect(res,Left(left));
      });
    });


    group('checkAuthentication ',(){
      test('should handle right',() async{
        //arrange
        when(datasource.checkAuthentication()).thenAnswer((_) async => right);
        //act
        var res = await repo.checkAuthentication();
        //assert
        expect(res,Right(right));
      });

      test('should handle left',() async{
        //arrange
        when(datasource.checkAuthentication()).thenThrow(ServerException());
        //act
        var res = await repo.checkAuthentication();
        //assert
        expect(res,Left(left));
      });
    });

    group('senPasswordRecovery ',(){
      test('should handle right',() async{
        //arrange
        when(datasource.sendPasswordRecoveryEmail('email')).thenAnswer((_) async => right);
        //act
        var res = await repo.sendPasswordRecoveryEmail('email');
        //assert
        expect(res,Right(right));
      });

      test('should handle left',() async{
        //arrange
        when(datasource.sendPasswordRecoveryEmail('email')).thenThrow(ServerException());
        //act
        var res = await repo.sendPasswordRecoveryEmail('email');
        //assert
        expect(res,Left(left));
      });
    });
  });

}