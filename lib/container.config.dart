// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/courses/domain/usecase/add_course_use_case.dart';
import 'features/authentication/data/datasource/auth_remote_data_source.dart';
import 'features/authentication/domain/repository/auth_repo.dart';
import 'features/authentication/data/repository/auth_repo_imp.dart';
import 'features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'features/authentication/domain/usecase/check_authentication_use_case.dart';
import 'features/courses/presentation/courses/courses_bloc.dart';
import 'features/courses/data/datasource/courses_data_source.dart';
import 'features/courses/domain/repository/courses_repo.dart';
import 'features/courses/data/repository/courses_repo_impl.dart';
import 'features/courses/domain/usecase/delete_course_use_case.dart';
import 'utils/third_party_dependencies/firebase_auth.dart';
import 'utils/third_party_dependencies/firebase_firestore.dart';
import 'features/courses/domain/usecase/get_courses_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_anonymouly_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_with_facebook_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_with_google_use_case.dart';
import 'features/courses/domain/usecase/update_course_use_case.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseAuthDependency = _$FirebaseAuthDependency();
  final firebaseFirestoreDependency = _$FirebaseFirestoreDependency();
  gh.factory<FirebaseAuth>(() => firebaseAuthDependency.prefs);
  gh.factory<FirebaseFirestore>(() => firebaseFirestoreDependency.prefs);

  // Eager singletons must be registered in the right order
  gh.singleton<IdleCoursesState>(IdleCoursesState());
  gh.singleton<InitialAuthenticationState>(InitialAuthenticationState());
  gh.singleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(firebaseAuth: get<FirebaseAuth>()));
  gh.singleton<AuthRepo>(AuthRepoImp(dataSource: get<AuthRemoteDataSource>()));
  gh.singleton<CheckAuthenticationUseCase>(
      CheckAuthenticationUseCase(repo: get<AuthRepo>()));
  gh.singleton<CoursesDataSource>(
      CourseDataSourceImpl(firestore: get<FirebaseFirestore>()));
  gh.singleton<CoursesRepo>(
      CoursesRepoImpl(dataSource: get<CoursesDataSource>()));
  gh.singleton<DeleteCourseUseCase>(
      DeleteCourseUseCase(repo: get<CoursesRepo>()));
  gh.singleton<GetCourseUseCase>(GetCourseUseCase(repo: get<CoursesRepo>()));
  gh.singleton<SignInAnonymouslyUseCase>(
      SignInAnonymouslyUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInWithEmailUseCase>(
      SignInWithEmailUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInWithFacebookUseCase>(
      SignInWithFacebookUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInWithGoogleUseCase>(
      SignInWithGoogleUseCase(repo: get<AuthRepo>()));
  gh.singleton<UpdateCourseUseCase>(
      UpdateCourseUseCase(repo: get<CoursesRepo>()));
  gh.singleton<AddCourseUseCase>(AddCourseUseCase(repo: get<CoursesRepo>()));
  gh.singleton<AuthenticationBloc>(AuthenticationBloc(
    get<InitialAuthenticationState>(),
    withFacebook: get<SignInWithFacebookUseCase>(),
    withEmail: get<SignInWithEmailUseCase>(),
    withGoogle: get<SignInWithGoogleUseCase>(),
    anonymous: get<SignInAnonymouslyUseCase>(),
    checkAuth: get<CheckAuthenticationUseCase>(),
  ));
  gh.singleton<CoursesBloc>(CoursesBloc(
    initialState: get<IdleCoursesState>(),
    getCourseUseCase: get<GetCourseUseCase>(),
    updateCourseUseCase: get<UpdateCourseUseCase>(),
    addCourseUseCase: get<AddCourseUseCase>(),
    deleteCourseUseCase: get<DeleteCourseUseCase>(),
  ));
  return get;
}

class _$FirebaseAuthDependency extends FirebaseAuthDependency {}

class _$FirebaseFirestoreDependency extends FirebaseFirestoreDependency {}
