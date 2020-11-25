
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/users/data/datamodel/user_data_model.dart';
import 'package:sport_platform/features/users/data/datasource/users_data_source.dart';
import 'package:sport_platform/features/users/data/repository/users_repo_impl.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class UsersDataSourceMock extends Mock implements UsersDataSource{}

main() {
  final dataSource = UsersDataSourceMock();
  final repo = UsersRepoImpl(dataSource: dataSource);
  final testUser = UserDataModel(

  );

  final testUsername = 'testUsername';
  final criteria = Criteria(field: null, data: null);
  final testUsers = [testUser];

  group('TrainersRepoImpl ', ()
  {
    group('add ', () {
      test('should handle Failure ', () async {
        //arrange
        when(dataSource.addUser(testUser)).thenThrow(ServerException());
        //act
        final res = await repo.addUser(testUser);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.addUser(testUser));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async {
        //arrange
        when(dataSource.addUser(testUser)).thenAnswer((
            _) async => testUser);
        //act
        final res = await repo.addUser(testUser);
        //asses
        expect(res, Right(testUser));
        verify(dataSource.addUser(testUser));
        verifyNoMoreInteractions(dataSource);
      });

      group('remove ', () {
        test('should handle Failure ', () async {
          //arrange
          when(dataSource.removeUser('username')).thenThrow(
              ServerException());
          //act
          final res = await repo.removeUser('username');
          //asses
          expect(res, Left(ServerFailure()));
          verify(dataSource.removeUser('username'));
          verifyNoMoreInteractions(dataSource);
        });

        test('should handle success', () async {
          //arrange
          when(dataSource.removeUser('username')).thenAnswer((
              _) async => testUser);
          //act
          final res = await repo.removeUser('username');
          //asses
          expect(res, Right(testUser));
          verify(dataSource.removeUser('username'));
          verifyNoMoreInteractions(dataSource);
        });
      });

      group('update ', () {
        test('should handle Failure ', () async {
          //arrange
          when(dataSource.updateUser(testUser)).thenThrow(
              ServerException());
          //act
          final res = await repo.updateUser(testUser);
          //asses
          expect(res, Left(ServerFailure()));
          verify(dataSource.updateUser(testUser));
          verifyNoMoreInteractions(dataSource);
        });

        test('should handle success', () async {
          //arrange
          when(dataSource.updateUser(testUser)).thenAnswer((
              _) async => testUser);
          //act
          final res = await repo.updateUser(testUser);
          //asses
          expect(res, Right(testUser));
          verify(dataSource.updateUser(testUser));
          verifyNoMoreInteractions(dataSource);
        });
      });

      group('get ', () {
        test('should handle Failure ', () async {
          //arrange
          when(dataSource.getUsers(criteria)).thenThrow(
              ServerException());
          //act
          final res = await repo.getUsers(criteria);
          //asses
          expect(res, Left(ServerFailure()));
          verify(dataSource.getUsers(criteria));
          verifyNoMoreInteractions(dataSource);
        });

        test('should handle success', () async {
          //arrange
          when(dataSource.getUsers(criteria)).thenAnswer((
              _) async => testUsers);
          //act
          final res = await repo.getUsers(criteria);
          //asses
          expect(res, Right(testUsers));
          verify(dataSource.getUsers(criteria));
          verifyNoMoreInteractions(dataSource);
        });
      });
    });


  });
}