// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:cloud_functions/cloud_functions.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'archive/chat/data/datasource/chat_data_source.dart' as _i29;
import 'archive/chat/data/repository/chat_repo_impl.dart' as _i31;
import 'archive/chat/domain/repository/chat_repo.dart' as _i30;
import 'archive/chat/domain/usecase/get_chat_history_use_case.dart' as _i16;
import 'archive/chat/domain/usecase/get_chats_use_case.dart' as _i13;
import 'archive/chat/domain/usecase/send_message_use_case.dart' as _i14;
import 'archive/chat/domain/usecase/update_message_use_case.dart' as _i15;
import 'archive/chat/presentation/bloc/chat/chat_bloc.dart' as _i12;
import 'archive/community/data/datasource/community_data_source.dart' as _i33;
import 'archive/community/data/repository/community_repo_impl.dart' as _i35;
import 'archive/community/domain/repository/community_repo.dart' as _i34;
import 'archive/community/domain/usecase/add_post_use_case.dart' as _i63;
import 'archive/community/domain/usecase/comment_community_post_use_case.dart'
    as _i64;
import 'archive/community/domain/usecase/get_posts_use_case.dart' as _i46;
import 'archive/community/domain/usecase/like_post_use_case.dart' as _i49;
import 'archive/community/domain/usecase/remove_post_use_case.dart' as _i51;
import 'archive/community/domain/usecase/update_post_use_case.dart' as _i57;
import 'archive/community/presentation/bloc/community/community_bloc.dart'
    as _i65;
import 'course-detail/course_detail_view_tabs/course_detail_view_tabs_bloc.dart'
    as _i17;
import 'features/authentication/data/datasource/auth_remote_data_source.dart'
    as _i26;
import 'features/authentication/data/repository/auth_repo_imp.dart' as _i28;
import 'features/authentication/domain/repository/auth_repo.dart' as _i27;
import 'features/authentication/domain/usecase/check_authentication_use_case.dart'
    as _i32;
import 'features/authentication/domain/usecase/register_with_email_use_case.dart'
    as _i50;
import 'features/authentication/domain/usecase/send_password_recovery_email_use_case.dart'
    as _i53;
import 'features/authentication/domain/usecase/sign_in_with_email_use_case.dart'
    as _i54;
import 'features/authentication/domain/usecase/sign_in_with_google_use_case.dart'
    as _i55;
import 'features/authentication/presentation/bloc/authentication/authentication_bloc.dart'
    as _i19;
import 'features/courses/data/datasource/courses_data_source.dart' as _i36;
import 'features/courses/data/repository/courses_repo_impl.dart' as _i38;
import 'features/courses/domain/repository/courses_repo.dart' as _i37;
import 'features/courses/domain/usecase/add_course_to_library_use_case.dart'
    as _i61;
import 'features/courses/domain/usecase/add_course_use_case.dart' as _i62;
import 'features/courses/domain/usecase/delete_course_use_case.dart' as _i39;
import 'features/courses/domain/usecase/get_course_use_case.dart' as _i43;
import 'features/courses/domain/usecase/get_courses_use_case.dart' as _i44;
import 'features/courses/domain/usecase/update_course_use_case.dart' as _i56;
import 'features/courses/presentation/bloc/add_course/add_course_bloc.dart'
    as _i67;
import 'features/courses/presentation/bloc/courses/courses_bloc.dart' as _i18;
import 'features/discovery/data/datasource/discovery_data_source.dart' as _i40;
import 'features/discovery/data/repository/DiscoveryRepoImpl.dart' as _i42;
import 'features/discovery/domain/repository/discovery_repo.dart' as _i41;
import 'features/discovery/domain/usecases/get_discovery_data_use_case.dart'
    as _i45;
import 'features/discovery/presentation/discovery/discovery_bloc.dart' as _i66;
import 'features/storage/data/datasource/storage_repo_data_source.dart' as _i20;
import 'features/storage/data/repository/storage_repo_imp.dart' as _i21;
import 'features/storage/domain/repository/storage_repo.dart' as _i8;
import 'features/storage/domain/usecase/DeleteStorageDataUseCase.dart' as _i10;
import 'features/storage/domain/usecase/GetDownloadUrlUseCase.dart' as _i7;
import 'features/storage/domain/usecase/UploadStorageDataUseCase.dart' as _i11;
import 'features/storage/presentation/storage/storage_bloc.dart' as _i9;
import 'features/users/data/datasource/users_data_source.dart' as _i22;
import 'features/users/data/repository/users_repo_impl.dart' as _i24;
import 'features/users/domain/repository/users_repo.dart' as _i23;
import 'features/users/domain/usecase/add_user_use_case.dart' as _i25;
import 'features/users/domain/usecase/get_users_use_case.dart' as _i47;
import 'features/users/domain/usecase/has_purchased_course.dart' as _i48;
import 'features/users/domain/usecase/remove_users_use_case.dart' as _i52;
import 'features/users/domain/usecase/update_update_use_case.dart' as _i58;
import 'features/users/presentation/bloc/users/users_bloc.dart' as _i59;
import 'features/users/presentation/bloc/users_library/users_library_bloc.dart'
    as _i60;
import 'utils/third_party_dependencies/firebase_auth.dart' as _i68;
import 'utils/third_party_dependencies/firebase_firestore.dart' as _i69;
import 'utils/third_party_dependencies/firebase_functions.dart' as _i70;
import 'utils/third_party_dependencies/firebase_storage.dart'
    as _i71; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseAuthDependency = _$FirebaseAuthDependency();
  final firebaseFirestoreDependency = _$FirebaseFirestoreDependency();
  final firebaseFunctionsDependency = _$FirebaseFunctionsDependency();
  final firebaseStorageDependency = _$FirebaseStorageDependency();
  gh.factory<_i3.FirebaseAuth>(() => firebaseAuthDependency.prefs);
  gh.factory<_i4.FirebaseFirestore>(() => firebaseFirestoreDependency.prefs);
  gh.factory<_i5.FirebaseFunctions>(() => firebaseFunctionsDependency.prefs);
  gh.factory<_i6.FirebaseStorage>(() => firebaseStorageDependency.prefs);
  gh.factory<_i7.GetDownloadUrlUseCase>(
      () => _i7.GetDownloadUrlUseCase(repo: get<_i8.StorageRepo>()));
  gh.factory<_i9.StorageBloc>(() => _i9.StorageBloc(
      delete: get<_i10.DeleteStorageDataUseCase>(),
      upload: get<_i11.UploadStorageDataUseCase>(),
      get: get<_i7.GetDownloadUrlUseCase>()));
  gh.factory<_i12.ChatBloc>(() => _i12.ChatBloc(
      get<_i13.GetChatsUseCase>(),
      get<_i14.SendMessageUseCase>(),
      get<_i15.UpdateMessageUseCase>(),
      get<_i16.GetChatHistoryUseCase>()));
  gh.singleton<_i17.CourseDetailViewTabsBloc>(_i17.CourseDetailViewTabsBloc());
  gh.singleton<_i18.IdleCoursesState>(_i18.IdleCoursesState());
  gh.singleton<_i19.InitialAuthenticationState>(
      _i19.InitialAuthenticationState());
  gh.singleton<_i20.StorageDataSource>(
      _i20.StorageDataSourceImpl(firebaseStorage: get<_i6.FirebaseStorage>()));
  gh.singleton<_i8.StorageRepo>(
      _i21.StorageRepoImpl(dataSource: get<_i20.StorageDataSource>()));
  gh.singleton<_i11.UploadStorageDataUseCase>(
      _i11.UploadStorageDataUseCase(repo: get<_i8.StorageRepo>()));
  gh.singleton<_i22.UsersDataSource>(_i22.UsersDataSourceImpl(
      firestore: get<_i4.FirebaseFirestore>(),
      firebaseAuth: get<_i3.FirebaseAuth>()));
  gh.singleton<_i23.UsersRepo>(
      _i24.UsersRepoImpl(dataSource: get<_i22.UsersDataSource>()));
  gh.singleton<_i25.AddUserUseCase>(
      _i25.AddUserUseCase(repo: get<_i23.UsersRepo>()));
  gh.singleton<_i26.AuthRemoteDataSource>(
      _i26.AuthRemoteDataSourceImpl(firebaseAuth: get<_i3.FirebaseAuth>()));
  gh.singleton<_i27.AuthRepo>(
      _i28.AuthRepoImp(dataSource: get<_i26.AuthRemoteDataSource>()));
  gh.singleton<_i29.ChatDataSource>(_i29.ChatDataSourceImpl(
      firestore: get<_i4.FirebaseFirestore>(),
      auth: get<_i3.FirebaseAuth>(),
      functions: get<_i5.FirebaseFunctions>()));
  gh.singleton<_i30.ChatRepo>(
      _i31.ChatRepoImpl(dataSource: get<_i29.ChatDataSource>()));
  gh.singleton<_i32.CheckAuthenticationUseCase>(
      _i32.CheckAuthenticationUseCase(repo: get<_i27.AuthRepo>()));
  gh.singleton<_i33.CommunityDataSource>(_i33.CommunityDataSourceImpl(
      functions: get<_i5.FirebaseFunctions>(),
      firebaseFirestore: get<_i4.FirebaseFirestore>()));
  gh.singleton<_i34.CommunityRepo>(
      _i35.CommunityRepoImpl(datasource: get<_i33.CommunityDataSource>()));
  gh.singleton<_i36.CoursesDataSource>(_i36.CourseDataSourceImpl(
      auth: get<_i3.FirebaseAuth>(), firestore: get<_i4.FirebaseFirestore>()));
  gh.singleton<_i37.CoursesRepo>(
      _i38.CoursesRepoImpl(dataSource: get<_i36.CoursesDataSource>()));
  gh.singleton<_i39.DeleteCourseUseCase>(
      _i39.DeleteCourseUseCase(repo: get<_i37.CoursesRepo>()));
  gh.singleton<_i10.DeleteStorageDataUseCase>(
      _i10.DeleteStorageDataUseCase(repo: get<_i8.StorageRepo>()));
  gh.singleton<_i40.DiscoveryDataSource>(
      _i40.DiscoveryDataSourceImpl(firestore: get<_i4.FirebaseFirestore>()));
  gh.singleton<_i41.DiscoveryRepo>(
      _i42.DiscoveryRepoImpl(ds: get<_i40.DiscoveryDataSource>()));
  gh.singleton<_i16.GetChatHistoryUseCase>(
      _i16.GetChatHistoryUseCase(repo: get<_i30.ChatRepo>()));
  gh.singleton<_i13.GetChatsUseCase>(
      _i13.GetChatsUseCase(repo: get<_i30.ChatRepo>()));
  gh.singleton<_i43.GetCourseUseCase>(
      _i43.GetCourseUseCase(repo: get<_i37.CoursesRepo>()));
  gh.singleton<_i44.GetCoursesUseCase>(
      _i44.GetCoursesUseCase(repo: get<_i37.CoursesRepo>()));
  gh.singleton<_i45.GetDiscoveryDataUseCase>(
      _i45.GetDiscoveryDataUseCase(repo: get<_i41.DiscoveryRepo>()));
  gh.singleton<_i46.GetPostsUseCase>(
      _i46.GetPostsUseCase(repo: get<_i34.CommunityRepo>()));
  gh.singleton<_i47.GetUsersUseCase>(
      _i47.GetUsersUseCase(repo: get<_i23.UsersRepo>()));
  gh.singleton<_i48.HasPurchasedCourse>(
      _i48.HasPurchasedCourse(repo: get<_i23.UsersRepo>()));
  gh.singleton<_i49.LikePostUseCase>(
      _i49.LikePostUseCase(repo: get<_i34.CommunityRepo>()));
  gh.singleton<_i50.RegisterWithEmailUseCase>(
      _i50.RegisterWithEmailUseCase(repo: get<_i27.AuthRepo>()));
  gh.singleton<_i51.RemovePostUseCase>(
      _i51.RemovePostUseCase(repo: get<_i34.CommunityRepo>()));
  gh.singleton<_i52.RemoveUserUseCase>(
      _i52.RemoveUserUseCase(repo: get<_i23.UsersRepo>()));
  gh.singleton<_i14.SendMessageUseCase>(
      _i14.SendMessageUseCase(repo: get<_i30.ChatRepo>()));
  gh.singleton<_i53.SendPasswordRecoveryEmailUseCase>(
      _i53.SendPasswordRecoveryEmailUseCase(repo: get<_i27.AuthRepo>()));
  gh.singleton<_i54.SignInWithEmailUseCase>(
      _i54.SignInWithEmailUseCase(repo: get<_i27.AuthRepo>()));
  gh.singleton<_i55.SignInWithGoogleUseCase>(
      _i55.SignInWithGoogleUseCase(repo: get<_i27.AuthRepo>()));
  gh.singleton<_i56.UpdateCourseUseCase>(
      _i56.UpdateCourseUseCase(repo: get<_i37.CoursesRepo>()));
  gh.singleton<_i15.UpdateMessageUseCase>(
      _i15.UpdateMessageUseCase(repo: get<_i30.ChatRepo>()));
  gh.singleton<_i57.UpdatePostUseCase>(
      _i57.UpdatePostUseCase(repo: get<_i34.CommunityRepo>()));
  gh.singleton<_i58.UpdateUserUseCase>(
      _i58.UpdateUserUseCase(repo: get<_i23.UsersRepo>()));
  gh.singleton<_i59.UsersBloc>(_i59.UsersBloc(
      addUserUseCase: get<_i25.AddUserUseCase>(),
      getUsersUseCase: get<_i47.GetUsersUseCase>(),
      removeUserUseCase: get<_i52.RemoveUserUseCase>(),
      updateUserUseCase: get<_i58.UpdateUserUseCase>()));
  gh.singleton<_i60.UsersLibraryBloc>(_i60.UsersLibraryBloc(
      hasPurchasedCourse: get<_i48.HasPurchasedCourse>()));
  gh.singleton<_i61.AddCourseToLibraryUseCase>(
      _i61.AddCourseToLibraryUseCase(repo: get<_i37.CoursesRepo>()));
  gh.singleton<_i62.AddCourseUseCase>(
      _i62.AddCourseUseCase(repo: get<_i37.CoursesRepo>()));
  gh.singleton<_i63.AddPostUseCase>(
      _i63.AddPostUseCase(repo: get<_i34.CommunityRepo>()));
  gh.singleton<_i19.AuthenticationBloc>(_i19.AuthenticationBloc(
      get<_i19.InitialAuthenticationState>(),
      withEmail: get<_i54.SignInWithEmailUseCase>(),
      withGoogle: get<_i55.SignInWithGoogleUseCase>(),
      checkAuth: get<_i32.CheckAuthenticationUseCase>(),
      registerWithEmail: get<_i50.RegisterWithEmailUseCase>(),
      resetPassword: get<_i53.SendPasswordRecoveryEmailUseCase>()));
  gh.singleton<_i64.CommentCommunityPostUseCase>(
      _i64.CommentCommunityPostUseCase(repo: get<_i34.CommunityRepo>()));
  gh.singleton<_i65.CommunityBloc>(_i65.CommunityBloc(
      get<_i63.AddPostUseCase>(),
      get<_i46.GetPostsUseCase>(),
      get<_i51.RemovePostUseCase>(),
      get<_i57.UpdatePostUseCase>(),
      get<_i64.CommentCommunityPostUseCase>()));
  gh.singleton<_i18.CoursesBloc>(_i18.CoursesBloc(
      initialState: get<_i18.IdleCoursesState>(),
      getCoursesUseCase: get<_i44.GetCoursesUseCase>(),
      updateCourseUseCase: get<_i56.UpdateCourseUseCase>(),
      addCourseUseCase: get<_i62.AddCourseUseCase>(),
      deleteCourseUseCase: get<_i39.DeleteCourseUseCase>(),
      getCourseUseCase: get<_i43.GetCourseUseCase>()));
  gh.singleton<_i66.DiscoveryBloc>(_i66.DiscoveryBloc(
      getDiscoveryDataUseCase: get<_i45.GetDiscoveryDataUseCase>()));
  gh.singleton<_i67.AddCourseBloc>(_i67.AddCourseBloc(
      addCourseToLibraryUseCase: get<_i61.AddCourseToLibraryUseCase>()));
  return get;
}

class _$FirebaseAuthDependency extends _i68.FirebaseAuthDependency {}

class _$FirebaseFirestoreDependency extends _i69.FirebaseFirestoreDependency {}

class _$FirebaseFunctionsDependency extends _i70.FirebaseFunctionsDependency {}

class _$FirebaseStorageDependency extends _i71.FirebaseStorageDependency {}
