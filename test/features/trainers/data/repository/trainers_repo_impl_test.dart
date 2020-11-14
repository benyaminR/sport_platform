
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/trainers/data/datamodel/tip_data_model.dart';
import 'package:sport_platform/features/trainers/data/datamodel/trainer_course_data_model.dart';
import 'package:sport_platform/features/trainers/data/datamodel/trainer_data_model.dart';
import 'package:sport_platform/features/trainers/data/datasource/trainers_data_source.dart';
import 'package:sport_platform/features/trainers/data/repository/trainers_repo_impl.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class TrainersDataSourceMock extends Mock implements TrainersDataSource{}

main() {
  final dataSource = TrainersDataSourceMock();
  final repo = TrainersRepoImpl(dataSource: dataSource);
  final testTrainer = TrainerDataModel(
    username: 'username',
    courses: [TrainerCourseDataModel(coursePath: 'path', title: 'stay healthy')],
    description: 'description',
    joinedDate: 'yesterday',
    tips: [TipDataModel(date: 'today', category: 'health', content: 'drink water')],
    verified: true,
  );

  final testUsername = 'testUsername';
  final criteria = TrainerCriteria(filter: null, data: null);
  final testTrainers = [testTrainer];

  group('TrainersRepoImpl ', ()
  {
    group('add ', () {
      test('should handle Failure ', () async {
        //arrange
        when(dataSource.addTrainer(testTrainer)).thenThrow(ServerException());
        //act
        final res = await repo.addTrainer(testTrainer);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.addTrainer(testTrainer));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async {
        //arrange
        when(dataSource.addTrainer(testTrainer)).thenAnswer((
            _) async => testTrainer);
        //act
        final res = await repo.addTrainer(testTrainer);
        //asses
        expect(res, Right(testTrainer));
        verify(dataSource.addTrainer(testTrainer));
        verifyNoMoreInteractions(dataSource);
      });

      group('remove ', () {
        test('should handle Failure ', () async {
          //arrange
          when(dataSource.removeTrainer('username')).thenThrow(
              ServerException());
          //act
          final res = await repo.removeTrainer('username');
          //asses
          expect(res, Left(ServerFailure()));
          verify(dataSource.removeTrainer('username'));
          verifyNoMoreInteractions(dataSource);
        });

        test('should handle success', () async {
          //arrange
          when(dataSource.removeTrainer('username')).thenAnswer((
              _) async => testTrainer);
          //act
          final res = await repo.removeTrainer('username');
          //asses
          expect(res, Right(testTrainer));
          verify(dataSource.removeTrainer('username'));
          verifyNoMoreInteractions(dataSource);
        });
      });

      group('update ', () {
        test('should handle Failure ', () async {
          //arrange
          when(dataSource.updateTrainer(testTrainer)).thenThrow(
              ServerException());
          //act
          final res = await repo.updateTrainer(testTrainer);
          //asses
          expect(res, Left(ServerFailure()));
          verify(dataSource.updateTrainer(testTrainer));
          verifyNoMoreInteractions(dataSource);
        });

        test('should handle success', () async {
          //arrange
          when(dataSource.updateTrainer(testTrainer)).thenAnswer((
              _) async => testTrainer);
          //act
          final res = await repo.updateTrainer(testTrainer);
          //asses
          expect(res, Right(testTrainer));
          verify(dataSource.updateTrainer(testTrainer));
          verifyNoMoreInteractions(dataSource);
        });
      });

      group('get ', () {
        test('should handle Failure ', () async {
          //arrange
          when(dataSource.getTrainers(criteria)).thenThrow(
              ServerException());
          //act
          final res = await repo.getTrainers(criteria);
          //asses
          expect(res, Left(ServerFailure()));
          verify(dataSource.getTrainers(criteria));
          verifyNoMoreInteractions(dataSource);
        });

        test('should handle success', () async {
          //arrange
          when(dataSource.getTrainers(criteria)).thenAnswer((
              _) async => testTrainers);
          //act
          final res = await repo.getTrainers(criteria);
          //asses
          expect(res, Right(testTrainers));
          verify(dataSource.getTrainers(criteria));
          verifyNoMoreInteractions(dataSource);
        });
      });
    });


  });
}