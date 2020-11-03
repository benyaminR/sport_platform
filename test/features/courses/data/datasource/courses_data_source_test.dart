import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_comment_data_model.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_content_section_data_model.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_user_data_model.dart';
import 'package:sport_platform/features/courses/data/datasource/courses_data_source.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_trainer.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';

main() {
  final firestore = MockFirestoreInstance();
  final dataSource = CourseDataSourceImpl(firestore: firestore);
  final courseDataModel = CourseDataModel(
      date  : DateTime.now().toString(),
          title : 'Gym',
          trainer : CourseTrainer(name: '', path: '', thumbnail: ''),
          description :'Great course',
          category : 'Fitness',
    content: List<CourseContentSectionDataModel>(),
    students: List<CourseUserDataModel>(),
    comments: List<CourseCommentDataModel>()
  );
  group('CourseDataSource ',(){
    group('addCourse ',(){
      test('should add a Course',()async{
        //act
        var res = await dataSource.addCourse(courseDataModel);
        //assert
        expect(res, courseDataModel);
      });

    });

    group('removeCourse',(){
      test('should remove a Course',()async{
        //act
        await firestore.collection('Courses').doc('test').set({
          'date': DateTime.now().toString(),
          'title': courseDataModel.title,
          'comments': courseDataModel.comments,
          'trainer': {
            'name': courseDataModel.trainer.name,
            'thumbnail': courseDataModel.trainer.thumbnail,
            'path': courseDataModel.trainer.path
          },
          'description': courseDataModel.description,
          'content': courseDataModel.content,
          'students': courseDataModel.students,
          'category': courseDataModel.category,
        });
        var res = await dataSource.deleteCourse('Courses/test');
        //assert
        expect(res, isA<CourseDataModel>());
      });
    });

    group('getCourses ',(){

      test('should get Specific item', () async{
        //arrange
        var searchData = 'Gym';
        var criteriaData = CriteriaData(data: searchData,field: 'title');
        await dataSource.addCourse(courseDataModel);
        //act
        var res = await dataSource.getCourses(criteriaData);
        //assert
        expect(res[0].title, searchData);
      });

    });

    group('updateCourse ', (){
      test('should update the course',()async{
        //arrange
        await dataSource.addCourse(courseDataModel);
        //act
        var changedAlteredDataModel =  CourseDataModel(
            date  : DateTime.now().toString(),
            title : 'Gym_Changed',
            trainer : CourseTrainer(name: '', path: '', thumbnail: ''),
            description :'Great course',
            category : 'Fitness',
            content: List<CourseContentSectionDataModel>(),
            students: List<CourseUserDataModel>(),
            comments: List<CourseCommentDataModel>(),
            path: 'Courses/test'
        );
        var res = await dataSource.updateCourse(changedAlteredDataModel);
        //assert
        expect(res.title,'Gym_Changed');
      });
    });

  });

}