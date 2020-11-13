import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/features/users_feature/data/datamodel/user_data_model.dart';

abstract class UsersDataSource{
  Future<List<UserDataModel>> getUsers(CommunityCriteria criteriaData);
  Future<UserDataModel> addUser(UserDataModel userData);
  Future<UserDataModel> removeUser(String uid);
  Future<UserDataModel> updateUser(UserDataModel userData);
}

class UsersDataSourceImpl implements UsersDataSource{
  final FirebaseFirestore firestore;

  UsersDataSourceImpl({@required this.firestore});


  @override
  Future<UserDataModel> addUser(UserDataModel userData) async{
    await firestore.
    collection('Users').
    doc(userData.username).
    set(UserDataModel.toMap(userData));
    return userData;
  }

  @override
  Future<List<UserDataModel>> getUsers(CommunityCriteria criteriaData) async{
    if(criteriaData != null) {
      var res = await firestore.collection('Users').where(
          criteriaData.filter, isEqualTo: criteriaData.data).get();

      return res.docs.map((e) => UserDataModel.fromSnapshot(e)).toList();
    }
    else{
      var res = await firestore.collection('Users').get();
      return res.docs.map((e) => UserDataModel.fromSnapshot(e)).toList();
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
  Future<UserDataModel> updateUser(UserDataModel userData) async{
    await firestore.
    collection('Users').
    doc(userData.username).
    update(
        UserDataModel.toMap(userData)
    );
    return userData;
  }

}