import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/authentication/domain/repository/auth_repo.dart';
import 'package:sport_platform/features/authentication/domain/usecase/check_authentication_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/register_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_google_use_case.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/params.dart';

class AuthRepoMock extends Mock implements AuthRepo{}
class AuthDataMock extends Mock implements Auth{}


main() {
  final repo = AuthRepoMock();
  final authdata = AuthDataMock();
  group('Auth UseCase',(){

    test('RegisterWithEmailUseCase redirects to authrepo.registerWithEmail()', () async{
      //arrange
      final usecase = RegisterWithEmailUseCase(repo:repo);
      var email = 'email';
      var password = 'password';

      when(repo.registerWithEmail(email,password)).thenAnswer((_) async => Right(authdata));
      //act
      var res = await usecase(WithParams(param: [email,password]));
      //assert
      expect(res, Right(authdata));
      verify(repo.registerWithEmail(email, password));
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