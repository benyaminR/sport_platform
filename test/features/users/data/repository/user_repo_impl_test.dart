import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/features/users_feature/data/datamodel/user_course_data_model.dart';
import 'package:sport_platform/features/users_feature/data/datamodel/user_data_model.dart';
import 'package:sport_platform/features/users_feature/data/datasource/users_data_source.dart';
import 'package:sport_platform/features/users_feature/data/repository/users_repo_impl.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';


class UsersDataSourceMock extends Mock implements UsersDataSource{}


main() {
  final dataSource = UsersDataSourceMock();
  final repo = UsersRepoImpl(dataSource: dataSource);
  final testUser = UserDataModel(
      courses: [UserCourseDataModel(title: 'title', coursePath: 'path')],
      friends: ['friend1','friend2'],
      profileImage: 'image',
      subscription: 'basic',
      username: 'username'
  );
  final testUsername = 'testUsername';
  final criteria = CommunityCriteria(filter: null, data: null);
  final testUsers = [testUser];


  group('UsersRepoImpl ', (){
    group('add ',(){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.addUser(testUser)).thenThrow(ServerException());
        //act
        final res = await repo.addUser(testUser);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.addUser(testUser));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.addUser(testUser)).thenAnswer((_) async => testUser);
        //act
        final res = await repo.addUser(testUser);
        //asses
        expect(res, Right(testUser));
        verify(dataSource.addUser(testUser));
        verifyNoMoreInteractions(dataSource);
      });
    });

    group('remove ',(){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.removeUser(testUsername)).thenThrow(ServerException());
        //act
        final res = await repo.removeUser(testUsername);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.removeUser(testUsername));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.removeUser(testUsername)).thenAnswer((_) async => testUser);
        //act
        final res = await repo.removeUser(testUsername);
        //asses
        expect(res, Right(testUser));
        verify(dataSource.removeUser(testUsername));
        verifyNoMoreInteractions(dataSource);
      });
    });

    group('update ',(){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.updateUser(testUser)).thenThrow(ServerException());
        //act
        final res = await repo.updateUser(testUser);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.updateUser(testUser));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.updateUser(testUser)).thenAnswer((_) async => testUser);
        //act
        final res = await repo.updateUser(testUser);
        //asses
        expect(res, Right(testUser));
        verify(dataSource.updateUser(testUser));
        verifyNoMoreInteractions(dataSource);
      });
    });


    group('get ',(){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.getUsers(criteria)).thenThrow(ServerException());
        //act
        final res = await repo.getUsers(criteria);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.getUsers(criteria));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.getUsers(criteria)).thenAnswer((_) async => testUsers);
        //act
        final res = await repo.getUsers(criteria);
        //asses
        expect(res, Right(testUsers));
        verify(dataSource.getUsers(criteria));
        verifyNoMoreInteractions(dataSource);
      });
    });
  });


}