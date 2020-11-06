import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/features/courses/domain/enitity/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';

abstract class CoursesDataSource{
  Future<CourseDataModel> deleteCourse(String path);

  Future<CourseDataModel>addCourse(CourseDataModel courseDataModel);

  Future<CourseDataModel> updateCourse(CourseDataModel courseDataModel);

  Future<List<CourseDataModel>> getCourses(Criteria criteriaData);
}

@Singleton(as:CoursesDataSource)
class CourseDataSourceImpl implements CoursesDataSource{

  final FirebaseFirestore firestore;
  CourseDataSourceImpl({@required this.firestore});


  @override
  Future<CourseDataModel> addCourse(CourseDataModel courseDataModel) async {
    if(courseDataModel == null) throw ServerException();
    await firestore.collection('Courses').add(CourseDataModel.toMap(courseDataModel));
    return courseDataModel;
  }

  @override
  Future<CourseDataModel> deleteCourse(String path) async{
    if(path == null) throw ServerException();
    var snapshot = await firestore.doc(path).get();
    var courseDataModel = CourseDataModel.fromSnapshot(snapshot);
    await firestore.doc(path).delete();
    return courseDataModel;
  }

  @override
  Future<List<CourseDataModel>> getCourses(Criteria criteriaData) async{
      var querySnapshot = await firestore.
      collection('Courses').
      where(criteriaData.field,isEqualTo: criteriaData.data).
      get();

      return querySnapshot.docs.map((e) => CourseDataModel.fromSnapshot(e)).toList();
  }

  @override
  Future<CourseDataModel> updateCourse(CourseDataModel courseDataModel) async{
    await firestore.doc(courseDataModel.path).update(CourseDataModel.toMap(courseDataModel));
    var dataModel = CourseDataModel.fromSnapshot(await firestore.doc(courseDataModel.path).get());
    return dataModel;
  }

}