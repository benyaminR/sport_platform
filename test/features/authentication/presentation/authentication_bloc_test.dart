import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth_data.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_anonymouly_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_facebook_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_google_use_case.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_platform/utils/error/failure.dart';

class SignInWithGoogleUsecaseMock extends Mock implements SignInWithGoogleUseCase{}
class SignInAnonymouslyUsecaseMock extends Mock implements SignInAnonymouslyUseCase{}

class SignInWithEmailUseCaseMock extends Mock implements SignInWithEmailUseCase{}

class SignInWithFacebookUseCaseMock extends Mock implements SignInWithFacebookUseCase{}

main() {

  //handles anonymous sign in
  final withGoogle = SignInWithGoogleUsecaseMock();
  final anonymous = SignInAnonymouslyUsecaseMock();
  final withFacebook = SignInWithFacebookUseCaseMock();
  final withEmail = SignInWithEmailUseCaseMock();

  generateNewBloc()=> AuthenticationBloc(InitialAuthenticationState(),
      withGoogle:withGoogle,
      anonymous:anonymous,
      withEmail: withEmail,
      withFacebook: withFacebook
  );

  group('AuthenticationBloc ',(){
    group('SignIn Anonymously ', (){
      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, SignedInState]',
        build: () {
          when(anonymous(any)).thenAnswer((realInvocation) async => Right(AuthData(creds: null)));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInAnonymouslyEvent()),
        expect: [SigningInState(),SignedInState()],
      );

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, ErrorState]',
        build: () {
          when(anonymous(any)).thenAnswer((realInvocation) async => Left(ServerFailure()));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInAnonymouslyEvent()),
        expect: [SigningInState(),ErrorState(msg: 'error')],
      );
    });

    group('SignIn With Google', (){
      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, SignedInState]',
        build: () {
          when(withGoogle(any)).thenAnswer((realInvocation) async => Right(AuthData(creds: null)));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithGoogleEvent()),
        expect: [SigningInState(),SignedInState()],
      );

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, ErrorState]',
        build: () {
          when(withGoogle(any)).thenAnswer((realInvocation) async => Left(ServerFailure()));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithGoogleEvent()),
        expect: [SigningInState(),ErrorState(msg: 'error')],
      );
    });

    group('SignIn With Facebook', (){
      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, SignedInState]',
        build: () {
          when(withFacebook(any)).thenAnswer((realInvocation) async => Right(AuthData(creds: null)));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithFacebookEvent()),
        expect: [SigningInState(),SignedInState()],
      );

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, ErrorState]',
        build: () {
          when(withFacebook(any)).thenAnswer((realInvocation) async => Left(ServerFailure()));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithFacebookEvent()),
        expect: [SigningInState(),ErrorState(msg: 'error')],
      );
    });

    group('SignIn With Email', (){
      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, SignedInState]',
        build: () {
          when(withEmail(any)).thenAnswer((realInvocation) async => Right(AuthData(creds: null)));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithEmailEvent(email: 'email',password: 'password')),
        expect: [SigningInState(),SignedInState()],
      );

      blocTest<AuthenticationBloc,AuthenticationState>('should emit in order [SigningInState, ErrorState]',
        build: () {
          when(withEmail(any)).thenAnswer((realInvocation) async => Left(ServerFailure()));
          return generateNewBloc();
        },
        act: (cubit) => cubit.add(SignInWithEmailEvent(email: 'email',password: 'password')),
        expect: [SigningInState(),ErrorState(msg: 'error')],
      );
    });


  });



}