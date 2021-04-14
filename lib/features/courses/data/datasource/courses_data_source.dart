import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';

abstract class CoursesDataSource{
  Future<CourseDataModel> deleteCourse(String path);

  Future<CourseDataModel>addCourse(CourseDataModel courseDataModel);

  Future<CourseDataModel> updateCourse(CourseDataModel courseDataModel);

  Future<List<CourseDataModel>> getCourses(Criteria criteriaData);

  Future<CourseDataModel>getCourse(String id);

  Future<CourseDataModel>addCourseToLibrary(Course course);
}

@Singleton(as:CoursesDataSource)
class CourseDataSourceImpl implements CoursesDataSource{

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  CourseDataSourceImpl({@required this.auth, @required this.firestore});


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

  @override
  Future<CourseDataModel> addCourseToLibrary(Course course) async{
    try {

      var snapshot = await firestore.collection("Users").doc(auth.currentUser.uid).get();

      List<dynamic> courses = snapshot.data()['purchasedCourses']?? List<dynamic>();
      
      courses.add({
        'description':course.description,
        'thumbnail':course.thumbnail,
        'title':course.title,
        'path':course.path
      });


      await firestore.collection("Users").doc(auth.currentUser.uid).update({
        'purchasedCourses':courses
      });


      return CourseDataModel.fromCourse(course);
    } on Exception catch (e) {
      throw ServerException();
    }
  }

}