// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/courses/domain/usecase/add_course_use_case.dart';
import 'features/authentication/data/datasource/auth_remote_data_source.dart';
import 'features/authentication/domain/repository/auth_repo.dart';
import 'features/authentication/data/repository/auth_repo_imp.dart';
import 'features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'features/authentication/domain/usecase/check_authentication_use_case.dart';
import 'features/courses/presentation/bloc/courses/courses_bloc.dart';
import 'features/courses/data/datasource/courses_data_source.dart';
import 'features/courses/domain/repository/courses_repo.dart';
import 'features/courses/data/repository/courses_repo_impl.dart';
import 'features/courses/domain/usecase/delete_course_use_case.dart';
import 'features/storage/domain/usecase/DeleteStorageDataUseCase.dart';
import 'utils/third_party_dependencies/firebase_auth.dart';
import 'utils/third_party_dependencies/firebase_firestore.dart';
import 'utils/third_party_dependencies/firebase_storage.dart';
import 'features/courses/domain/usecase/get_courses_use_case.dart';
import 'features/storage/domain/usecase/GetDownloadUrlUseCase.dart';
import 'features/authentication/domain/usecase/register_with_email_use_case.dart';
import 'features/storage/domain/usecase/ReplaceStorageDataUseCase.dart';
import 'features/authentication/domain/usecase/send_password_recovery_email_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_with_email_use_case.dart';
import 'features/authentication/domain/usecase/sign_in_with_google_use_case.dart';
import 'features/storage/presentation/storage/storage_bloc.dart';
import 'features/storage/data/datasource/storage_repo_data_source.dart';
import 'features/storage/domain/repository/storage_repo.dart';
import 'features/storage/data/repository/storage_repo_imp.dart';
import 'features/courses/domain/usecase/update_course_use_case.dart';
import 'features/storage/domain/usecase/UploadStorageDataUseCase.dart';

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
  final firebaseStorageDependency = _$FirebaseStorageDependency();
  gh.factory<FirebaseAuth>(() => firebaseAuthDependency.prefs);
  gh.factory<FirebaseFirestore>(() => firebaseFirestoreDependency.prefs);
  gh.factory<FirebaseStorage>(() => firebaseStorageDependency.prefs);

  // Eager singletons must be registered in the right order
  gh.singleton<IdleCoursesState>(IdleCoursesState());
  gh.singleton<InitialAuthenticationState>(InitialAuthenticationState());
  gh.singleton<StorageDataSource>(
      StorageDataSourceImpl(firebaseStorage: get<FirebaseStorage>()));
  gh.singleton<StorageRepo>(
      StorageRepoImpl(dataSource: get<StorageDataSource>()));
  gh.singleton<UploadStorageDataUseCase>(
      UploadStorageDataUseCase(repo: get<StorageRepo>()));
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
  gh.singleton<DeleteStorageDataUseCase>(
      DeleteStorageDataUseCase(repo: get<StorageRepo>()));
  gh.singleton<GetCourseUseCase>(GetCourseUseCase(repo: get<CoursesRepo>()));
  gh.singleton<GetDownloadUrlUseCase>(
      GetDownloadUrlUseCase(repo: get<StorageRepo>()));
  gh.singleton<RegisterWithEmailUseCase>(
      RegisterWithEmailUseCase(repo: get<AuthRepo>()));
  gh.singleton<ReplaceStorageDataUseCase>(
      ReplaceStorageDataUseCase(repo: get<StorageRepo>()));
  gh.singleton<SendPasswordRecoveryEmailUseCase>(
      SendPasswordRecoveryEmailUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInWithEmailUseCase>(
      SignInWithEmailUseCase(repo: get<AuthRepo>()));
  gh.singleton<SignInWithGoogleUseCase>(
      SignInWithGoogleUseCase(repo: get<AuthRepo>()));
  gh.singleton<StorageBloc>(StorageBloc(
    delete: get<DeleteStorageDataUseCase>(),
    upload: get<UploadStorageDataUseCase>(),
    get: get<GetDownloadUrlUseCase>(),
    replace: get<ReplaceStorageDataUseCase>(),
  ));
  gh.singleton<UpdateCourseUseCase>(
      UpdateCourseUseCase(repo: get<CoursesRepo>()));
  gh.singleton<AddCourseUseCase>(AddCourseUseCase(repo: get<CoursesRepo>()));
  gh.singleton<AuthenticationBloc>(AuthenticationBloc(
    get<InitialAuthenticationState>(),
    withEmail: get<SignInWithEmailUseCase>(),
    withGoogle: get<SignInWithGoogleUseCase>(),
    checkAuth: get<CheckAuthenticationUseCase>(),
    registerWithEmail: get<RegisterWithEmailUseCase>(),
    resetPassword: get<SendPasswordRecoveryEmailUseCase>(),
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

class _$FirebaseStorageDependency extends FirebaseStorageDependency {}
