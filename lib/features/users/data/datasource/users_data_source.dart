import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/users/data/datamodel/user_data_model.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/utils/criteria.dart';


abstract class UsersDataSource{
  Future<List<UserDataModel>> getUsers(Criteria criteria);
  Future<UserDataModel> addUser(User user);
  Future<UserDataModel> removeUser(String username);
  Future<UserDataModel> updateUser(User user);
}

@Singleton(as:UsersDataSource)
class UsersDataSourceImpl implements UsersDataSource{
  final FirebaseFirestore firestore;

  UsersDataSourceImpl({@required this.firestore});

  @override
  Future<UserDataModel> addUser(User user) async{
    await firestore.
    collection('Users').
    doc(user.username).
    set(UserDataModel.toMap(user));
    return UserDataModel.fromUser(user);
  }

  @override
  Future<List<UserDataModel>> getUsers(Criteria criteria) async{
    if(criteria != null) {
      var res = await firestore.collection('Users').where(
          criteria.field, isEqualTo: criteria.data).get();

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
  Future<UserDataModel> updateUser(User user) async{
    await firestore.
    collection('Users').
    doc(user.username).
    update(
        UserDataModel.toMap(user)
    );
    return UserDataModel.fromUser(user);
  }


}