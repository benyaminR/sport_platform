import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/authentication/domain/usecase/check_authentication_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/register_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_google_use_case.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_platform/utils/error/failure.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/params.dart';

class SignInWithGoogleUsecaseMock extends Mock implements SignInWithGoogleUseCase{}

class SignInWithEmailUseCaseMock extends Mock implements SignInWithEmailUseCase{}


class CheckAuthenticationUseCaseMock extends Mock implements CheckAuthenticationUseCase{}
class RegisterWithEmailUseCaseMock extends Mock implements RegisterWithEmailUseCase{}


main() {

  //handles anonymous sign in
  final withGoogle = SignInWithGoogleUsecaseMock();
  final withEmail = SignInWithEmailUseCaseMock();
  final checkAuth = CheckAuthenticationUseCaseMock();
  final registerWithEmail = RegisterWithEmailUseCaseMock();

  final noParams = NoParams();
  final withParams = WithParams(param: '');
  final authData = Auth(creds: null);
  generateNewBloc()=> AuthenticationBloc(InitialAuthenticationState(),
      withGoogle:withGoogle,
      withEmail: withEmail,
      checkAuth: checkAuth,
    registerWithEmail: registerWithEmail
  );


  group('AuthenticationBloc ',(){

    group('SignIn With Google', (){
      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, SignedInState]',
        build: () {
          when(withGoogle(noParams)).thenAnswer((realInvocation) async => Right(authData));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithGoogleEvent()),
        expect: [SigningInState(),SignedInState()],
      );

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, ErrorState]',
        build: () {
          when(withGoogle(noParams)).thenAnswer((realInvocation) async => Left(ServerFailure()));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithGoogleEvent()),
        expect: [SigningInState(),ErrorState(msg: 'error')],
      );
    });



    group('SignIn With Email', (){

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, SignedInState]',
        build: () {
          when(withEmail(WithParams(param: ['email','password']))).thenAnswer((realInvocation) async => Right(authData));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithEmailEvent(email: 'email',password: 'password')),
        expect: [SigningInState(),SignedInState()],
      );

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, ErrorState]',
        build: () {
          when(withEmail(WithParams(param: ['email','password']))).thenAnswer((realInvocation) async => Left(ServerFailure()));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithEmailEvent(email: 'email',password: 'password')),
        expect: [SigningInState(),ErrorState(msg: 'error')],
      );
    });

    group('Register With Email', (){

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, SignedInState]',
        build: () {
          when(registerWithEmail(WithParams(param: ['email','password']))).thenAnswer((realInvocation) async => Right(authData));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(RegisterWithEmailEvent(email: 'email',password: 'password')),
        expect: [SigningInState(),SignedInState()],
      );

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, ErrorState]',
        build: () {
          when(registerWithEmail(WithParams(param: ['email','password']))).thenAnswer((realInvocation) async => Left(ServerFailure()));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(RegisterWithEmailEvent(email: 'email',password: 'password')),
        expect: [SigningInState(),ErrorState(msg: 'error')],
      );
    });

    group('Check Authentication', (){
      blocTest<AuthenticationBloc,AuthenticationState>('should handle logged in users',
          build: (){
            when(checkAuth(noParams)).thenAnswer((_) async => Right(authData));
            return generateNewBloc();
          },
          act: (cubit)=> cubit.add(CheckAuthenticationEvent()),
          expect: [SignedInState()]
          );
      blocTest<AuthenticationBloc,AuthenticationState>('should handle new users',
          build: (){
            when(checkAuth(noParams)).thenAnswer((realInvocation) async => Left(ServerFailure()));
            return generateNewBloc();
          },
          act: (cubit)=> cubit.add(CheckAuthenticationEvent()),
          expect: [InitialAuthenticationState()]
      );
    });

  });



}