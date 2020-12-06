import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/features/courses/data/datasource/courses_data_source.dart';
import 'package:sport_platform/features/courses/data/repository/courses_repo_impl.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class CoursesDataSourceMock extends Mock implements CoursesDataSource{}

main() {
  final CoursesDataSourceMock dataSource = CoursesDataSourceMock();
  final CoursesRepoImpl repo = CoursesRepoImpl(dataSource:dataSource);
  final CourseDataModel courseDataModel = CourseDataModel(date: null, title: null, comments: null, trainer: null, description: null, content: null, students: null, category: null, path: null);
  final String fakePath = 'Fake Path';
  final Criteria criteriaData = Criteria(field: '', data: '');
  final List<CourseDataModel> courses = [courseDataModel];

  group('CoursesRepoImpl ', (){
    group('addCourse ', (){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.addCourse(courseDataModel)).thenThrow(ServerException());
        //act
        final res = await repo.addCourse(courseDataModel);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.addCourse(courseDataModel));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.addCourse(courseDataModel)).thenAnswer((_) async => courseDataModel);
        //act
        final res = await repo.addCourse(courseDataModel);
        //asses
        expect(res, Right(courseDataModel));
        verify(dataSource.addCourse(courseDataModel));
        verifyNoMoreInteractions(dataSource);
      });
    });

    group('deleteCourse ', (){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.deleteCourse(fakePath)).thenThrow(ServerException());
        //act
        final res = await repo.deleteCourse(fakePath);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.deleteCourse(fakePath));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.deleteCourse(fakePath)).thenAnswer((_) async => courseDataModel);
        //act
        final res = await repo.deleteCourse(fakePath);
        //asses
        expect(res, Right(courseDataModel));
        verify(dataSource.deleteCourse(fakePath));
        verifyNoMoreInteractions(dataSource);
      });
    });

    group('updateCourse ', (){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.updateCourse(courseDataModel)).thenThrow(ServerException());
        //act
        final res = await repo.updateCourse(courseDataModel);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.updateCourse(courseDataModel));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.updateCourse(courseDataModel)).thenAnswer((_) async => courseDataModel);
        //act
        final res = await repo.updateCourse(courseDataModel);
        //asses
        expect(res, Right(courseDataModel));
        verify(dataSource.updateCourse(courseDataModel));
        verifyNoMoreInteractions(dataSource);
      });
    });

    group('getCourse ',(){
      test('should handle Failure ', () async{
        //arrange
        when(dataSource.getCourses(criteriaData)).thenThrow(ServerException());
        //act
        final res = await repo.getCourses(criteriaData);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.getCourses(criteriaData));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async{
        //arrange
        when(dataSource.getCourses(criteriaData)).thenAnswer((_) async => courses);
        //act
        final res = await repo.getCourses(criteriaData);
        //asses
        expect(res, Right(courses));
        verify(dataSource.getCourses(criteriaData));
        verifyNoMoreInteractions(dataSource);
      });
    });

  });
}