

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_platform/features/community/domain/entity/community_criteria.dart';
import 'package:sport_platform/features/users_feature/data/datamodel/user_course_data_model.dart';
import 'package:sport_platform/features/users_feature/data/datamodel/user_data_model.dart';
import 'package:sport_platform/features/users_feature/data/datasource/users_data_source.dart';

main() {
  final firestore = MockFirestoreInstance();
  final dataSource = UsersDataSourceImpl(firestore: firestore);
  final testUser = UserDataModel(
      courses: [UserCourseDataModel(title: 'title', coursePath: 'path')],
      friends: ['friend1','friend2'],
      profileImage: 'image',
      subscription: 'basic',
      username: 'test'
  );


  group('UsersDataSource ',(){
    group('addUser ',(){
      test('should add an User',()async{
        //act
        var res = await dataSource.addUser(testUser);
        //assert
        expect(res, testUser);
      });
    });

    group('removeUser',(){
      test('should remove a Course',()async{
        //act
        await firestore.collection('Users').doc('test').set(UserDataModel.toMap(testUser));
        var res = await dataSource.removeUser('test');
        //assert
        expect(res, isA<UserDataModel>());
      });
    });

    group('getCourses ',(){

      test('should get Specific item', () async{
        //arrange
        var searchData = 'test';
        var criteriaData = CommunityCriteria(data: searchData,filter: 'username');
        await dataSource.addUser(testUser);
        //act
        var res = await dataSource.getUsers(criteriaData);

        //assert
        expect(res[0].username, searchData);
      });

    });

    group('updateUser ', (){
      test('should update the user',()async{
        //arrange
        await dataSource.updateUser(testUser);
        //act
        var changedAlteredDataModel = UserDataModel(
            courses: [UserCourseDataModel(title: 'title', coursePath: 'path')],
            friends: ['friend1','friend2'],
            profileImage: 'image2',
            subscription: 'basic',
            username: 'test'
        );

        var res = await dataSource.updateUser(changedAlteredDataModel);
        //assert
        expect(res.profileImage,'image2');
      });
    });

  });
}