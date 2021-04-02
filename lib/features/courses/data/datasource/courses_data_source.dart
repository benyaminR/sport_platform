import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';

abstract class CoursesDataSource{
  Future<CourseDataModel> deleteCourse(String path);

  Future<CourseDataModel>addCourse(CourseDataModel courseDataModel);

  Future<CourseDataModel> updateCourse(CourseDataModel courseDataModel);

  Future<List<CourseDataModel>> getCourses(Criteria criteriaData);

  Future<CourseDataModel>getCourse(String id);
}

@Singleton(as:CoursesDataSource)
class CourseDataSourceImpl implements CoursesDataSource{

  final FirebaseFirestore firestore;
  CourseDataSourceImpl({@required this.firestore});


  @override
  Future<CourseDataModel> addCourse(CourseDataModel courseDataModel) async {
    if(courseDataModel == null) throw ServerException();
    try {
      await firestore.collection('Courses').add(CourseDataModel.toMap(courseDataModel));
      return courseDataModel;
    } on Exception catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CourseDataModel> deleteCourse(String path) async{
    if(path == null) throw ServerException();
    try {
      var snapshot = await firestore.doc(path).get();
      var courseDataModel = CourseDataModel.fromSnapshot(snapshot);
      await firestore.doc(path).delete();
      return courseDataModel;
    } on Exception catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<CourseDataModel>> getCourses(Criteria criteriaData) async{
    try {
      if(criteriaData != null) {
        var querySnapshot = await firestore.
        collection('Courses').
        where(criteriaData.field, isEqualTo: criteriaData.data).
        get();
        return querySnapshot.docs.map((e) => CourseDataModel.fromSnapshot(e))
            .toList();
      }
      else
      {   var querySnapshot = await firestore.
      collection('Courses').
      get();
      return querySnapshot.docs.map((e) => CourseDataModel.fromSnapshot(e)).toList();
      }
    } on Exception catch (e) {
      throw ServerException();
    }
  }




  @override
  Future<CourseDataModel> updateCourse(CourseDataModel courseDataModel) async{
    try {
      await firestore.doc(courseDataModel.path).update(CourseDataModel.toMap(courseDataModel));
      var dataModel = CourseDataModel.fromSnapshot(await firestore.doc(courseDataModel.path).get());
      return dataModel;
    } on Exception catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CourseDataModel> getCourse(String id) async{
    try {
        var querySnapshot = await firestore.
        collection('Courses').
            doc(id)
            .get();
        return CourseDataModel.fromSnapshot(querySnapshot);
    } on Exception catch (e) {
      throw ServerException();
    }
  }

}