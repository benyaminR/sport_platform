import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/authentication/domain/usecase/check_authentication_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/register_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/send_password_recovery_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'package:sport_platform/features/authentication/domain/usecase/sign_in_with_google_use_case.dart';
import 'package:sport_platform/utils/usecases/no_params.dart';
import 'package:sport_platform/utils/usecases/params.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

@injectable
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final SignInWithGoogleUseCase withGoogle;
  final SignInWithEmailUseCase withEmail;
  final CheckAuthenticationUseCase checkAuth;
  final RegisterWithEmailUseCase registerWithEmail;
  final SendPasswordRecoveryEmailUseCase resetPassword;

  AuthenticationBloc(InitialAuthenticationState initialState,
      {
        @required this.withEmail,
        @required this.withGoogle,
        @required this.checkAuth,
        @required this.registerWithEmail,
        @required this.resetPassword,
      }
        ) : super(initialState);


  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {

    if(event is SignInWithGoogleEvent){
      yield SigningInState();
      var result = await withGoogle(NoParams());
      yield result.fold(
              (l) => ErrorState(msg: 'error'),
              (r) => SignedInState()
      );
    }

    if(event is RegisterWithEmailEvent){
      yield SigningInState();
      var result = await registerWithEmail(WithParams(param: [event.email, event.password]));
      yield result.fold(
              (l) => ErrorState(msg: 'error'),
              (r) => SignedInState()
      );
    }

    if(event is SignInWithEmailEvent){
      yield SigningInState();
      var result = await withEmail(WithParams(param: [event.email,event.password]));
      yield result.fold(
              (l) => ErrorState(msg: 'error'),
              (r) => SignedInState()
      );
    }

    if(event is CheckAuthenticationEvent){
      var result = await checkAuth(NoParams());
      yield result.fold(
              (l) => InitialAuthenticationState(),
              (r) => SignedInState()
      );
    }

    if(event is ResetPasswordEvent){
      yield SigningInState();
      var result = await resetPassword(WithParams(param: [event.email]));
      yield result.fold(
              (l) => ErrorState(msg:'error'),
              (r) => SignedInState()
      );
    }
  }
}
