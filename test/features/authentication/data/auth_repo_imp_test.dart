


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/data/datamodel/auth_data_model.dart';
import 'package:sport_platform/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:sport_platform/features/authentication/data/repository/auth_repo_imp.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth_data.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class AuthRemoteDataSourceMock extends Mock implements AuthRemoteDataSource{}


main() {

  final datasource = AuthRemoteDataSourceMock();
  final repo = AuthRepoImp(dataSource:datasource);
  final left = ServerFailure();
  final right = AuthDatamodel(userCredential: null);
  group('AuthRepoImp ', () {

    group('SignInAnonymously ',(){

      test('should handle right',() async{
        //arrange
        when(datasource.signInAnonymously()).thenAnswer((_) async => right);
        //act
        var res = await repo.signInAnonymously();
        //assert
        expect(res,Right(right));
      });

      test('should handle left',() async{
        //arrange
        when(datasource.signInAnonymously()).thenThrow(ServerException());
        //act
        var res = await repo.signInAnonymously();
        //assert
        expect(res,Left(left));
      });

    });

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

    group('SignInWithFacebook ',(){
      test('should handle right',() async{
        //arrange
        when(datasource.signInWithFacebook()).thenAnswer((_) async => right);
        //act
        var res = await repo.signInWithFacebook();
        //assert
        expect(res,Right(right));
      });

      test('should handle left',() async{
        //arrange
        when(datasource.signInWithFacebook()).thenThrow(ServerException());
        //act
        var res = await repo.signInWithFacebook();
        //assert
        expect(res,Left(left));
      });
    });

    group('SignInWithApple ',(){

    });

  });

}