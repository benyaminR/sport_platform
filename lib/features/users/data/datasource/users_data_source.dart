import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/users/data/datamodel/user_data_model.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';


abstract class UsersDataSource{
  Future<List<UserDataModel>> getUsers(Criteria criteria);
  Future<UserDataModel> getUser(String userID);
  Future<UserDataModel> addUser(User user);
  Future<UserDataModel> removeUser(String username);
  Future<UserDataModel> updateUser(User user);
  Future<bool> hasPurchasedCourse(String courseID);

}

@Singleton(as:UsersDataSource)
class UsersDataSourceImpl implements UsersDataSource{
  final FirebaseFirestore firestore;
  final Auth.FirebaseAuth firebaseAuth;

  UsersDataSourceImpl({@required this.firestore,@required this.firebaseAuth});

  @override
  Future<UserDataModel> addUser(User user) async{
    await firestore.
    collection('Users').
    doc(firebaseAuth.currentUser.uid).
    set(UserDataModel.toMap(user));
    return UserDataModel.fromUser(user);
  }

  @override
  Future<List<UserDataModel>> getUsers(Criteria criteria) async{
    try {
      if (criteria != null) {
        var res = await firestore.collection('Users').where(
            criteria.field, isEqualTo: criteria.data).get();
        return res.docs.map((e) => UserDataModel.fromSnapshot(e)).toList();
      }
      else {
        var uid = firebaseAuth.currentUser.uid;
        var res = await firestore.collection('Users').doc(uid).get();
        return [UserDataModel.fromSnapshot(res)];
      }
    } on Exception{
      throw ServerException();
    }
  }

  @override
  Future<UserDataModel> removeUser(String username) async{
    var users = await getUsers(null);
    await firestore.
    collection('Users').
    doc(username).
    delete();
    return users[0];
  }

  @override
  Future<UserDataModel> updateUser(User user) async{
    await firestore.
    collection('Users').
    doc(firebaseAuth.currentUser.uid).
    update(
        UserDataModel.toMap(user)
    );
    return UserDataModel.fromUser(user);
  }

  @override
  Future<bool> hasPurchasedCourse(String courseID) async{
    var user = await firestore.collection('Users').doc(firebaseAuth.currentUser.uid).get();
    var converted = UserDataModel.fromSnapshot(user);
    var courses = converted.purchasedCourses;

    for(Course course in courses)
      if(course.path == courseID)
        return true;

    return false;
  }

  @override
  Future<UserDataModel> getUser(String userID) async{
    try {
      var uid = userID;
      if (userID.isEmpty)
        uid = firebaseAuth.currentUser.uid;
      var res = await firestore.collection('Users').doc(uid).get();
      return UserDataModel.fromSnapshot(res);
    } on Exception{
      throw ServerException();
    }
  }


}