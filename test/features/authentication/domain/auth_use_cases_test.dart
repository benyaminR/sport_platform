import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth_data.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_anonymouly_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_apple_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_with_google_use_case.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';

class AuthRepoMock extends Mock implements AuthRepo{}


main() {
  final repo = AuthRepoMock();
  final authdata = AuthData(msg: 'msg');
  group('Auth UseCase',(){
    test('SignInAnonymouslyUseCase redirects to authrepo.SignInAnonymously', () async{
      //arrange
      final usecase = SignInAnonymouslyUseCase(repo:repo);
      when(repo.signInAnonymously()).thenAnswer((_) async => Right(authdata));
      //act
      var res = await usecase(NoParams());
      //assert
      expect(res, Right(authdata));
      verify(repo.signInAnonymously());
    });

    test('SignInWithAppleUseCase redirects to authrepo.SignInWithApple', () async{
      //arrange
      final usecase = SignInWithAppleUseCase(repo:repo);
      when(repo.signInWithApple()).thenAnswer((_) async => Right(authdata));
      //act
      var res = await usecase(NoParams());
      //assert
      expect(res, Right(authdata));
      verify(repo.signInWithApple());

    });

    test('SignInWithGoogleUseCase redirects to authrepo.SignInWithGoogle', () async{
      //arrange
      final usecase = SignInWithGoogleUseCase(repo:repo);
      when(repo.signInWithGoogle()).thenAnswer((_) async => Right(authdata));
      //act
      var res = await usecase(NoParams());
      //assert
      expect(res, Right(authdata));
      verify(repo.signInWithGoogle());
    });

    test('SignInWithEmailUseCase redirects to authrepo.SignInWithEmail', () async{
      //arrange
      final usecase = SignInWithEmailUseCase(repo:repo);
      when(repo.signInWithEmail()).thenAnswer((_) async => Right(authdata));
      //act
      var res = await usecase(NoParams());
      //assert
      expect(res, Right(authdata));
      verify(repo.signInWithEmail());

    });
  });

}