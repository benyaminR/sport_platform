// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/authentication/data/datasource/auth_remote_data_source.dart';
import 'features/authentication/domain/repository/auth_repo.dart';
import 'features/authentication/data/repository/auth_repo_imp.dart';
import 'features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'features/authentication/domain/usecase/check_authentication_use_case.dart';
import 'utils/third_party_dependencies/firebase_auth.dart';
import 'features/authentication/domain/usecase/sign_in_anonymouly_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_with_facebook_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_with_google_use_case.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseAuthDependency = _$FirebaseAuthDependency();
  gh.factory<FirebaseAuth>(() => firebaseAuthDependency.prefs);

  // Eager singletons must be registered in the right order
  gh.singleton<InitialAuthenticationState>(InitialAuthenticationState());
  gh.singleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(firebaseAuth: get<FirebaseAuth>()));
  gh.singleton<AuthRepo>(AuthRepoImp(dataSource: get<AuthRemoteDataSource>()));
  gh.singleton<CheckAuthenticationUseCase>(
      CheckAuthenticationUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInAnonymouslyUseCase>(
      SignInAnonymouslyUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInWithEmailUseCase>(
      SignInWithEmailUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInWithFacebookUseCase>(
      SignInWithFacebookUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInWithGoogleUseCase>(
      SignInWithGoogleUseCase(repo: get<AuthRepo>()));
  gh.singleton<AuthenticationBloc>(AuthenticationBloc(
    get<InitialAuthenticationState>(),
    withFacebook: get<SignInWithFacebookUseCase>(),
    withEmail: get<SignInWithEmailUseCase>(),
    withGoogle: get<SignInWithGoogleUseCase>(),
    anonymous: get<SignInAnonymouslyUseCase>(),
    checkAuth: get<CheckAuthenticationUseCase>(),
  ));
  return get;
}

class _$FirebaseAuthDependency extends FirebaseAuthDependency {}
