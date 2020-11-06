import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/features/authentication/domain/usecase/check_authentication_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_anonymouly_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_apple_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_facebook_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_google_use_case.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/params.dart';

class AuthRepoMock extends Mock implements AuthRepo{}
class AuthDataMock extends Mock implements Auth{}


main() {
  final repo = AuthRepoMock();
  final authdata = AuthDataMock();
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
      final email = 'e'; final password = 'p';
      when(repo.signInWithEmail(email,password)).thenAnswer((_) async => Right(authdata));
      //act
      var res = await usecase(WithParams(param: [email,password]));
      //assert
      expect(res, Right(authdata));
      verify(repo.signInWithEmail(email,password));

    });

    test('SignInWithFacebookUseCase redirects to authrepo.SignInWithEmail', () async{
      //arrange
      final usecase = SignInWithFacebookUseCase(repo:repo);
      when(repo.signInWithFacebook()).thenAnswer((_) async => Right(authdata));
      //act
      var res = await usecase(NoParams());
      //assert
      expect(res, Right(authdata));
      verify(repo.signInWithFacebook());
    });

    test('CheckAuthenticationUseCase redirects to authrepo.CheckAuthentication()', () async{
      //arrange
      final usecase = CheckAuthenticationUseCase(repo:repo);
      when(repo.checkAuthentication()).thenAnswer((_) async => Right(authdata));
      //act
      var res = await usecase(NoParams());
      //assert
      expect(res, Right(authdata));
      verify(repo.checkAuthentication());
    });

  });

}