import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_platform/features/users/data/datamodel/tip_data_model.dart';
import 'package:sport_platform/features/users/data/datamodel/user_course_data_model.dart';
import 'package:sport_platform/features/users/data/datamodel/user_data_model.dart';
import 'package:sport_platform/features/users/data/datasource/users_data_source.dart';
import 'package:sport_platform/utils/criteria.dart';

main() {
  final firestore = MockFirestoreInstance();
  final dataSource = UsersDataSourceImpl(firestore: firestore);
  final testUser = UserDataModel(
      tips: [TipDataModel(date: null, category: null, content: null)],
      joinedDate: 'date',
      description: 'description',
      username: 'username',
      subscription: 'subscription',
      profileImage: 'profileImage',
      friends: ['friend1'],
      createdCourses: [UserCourseDataModel(coursePath: null, title: null)],
      isTrainer: true,
      isVerified: true,
      purchasedCourses: [UserCourseDataModel(coursePath: null, title: null)]
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
      test('should remove a User',()async{
        //act
        await firestore.collection('Users').doc('username').set(UserDataModel.toMap(testUser));
        var res = await dataSource.removeUser('username');
        //assert
        expect(res, isA<UserDataModel>());
      });
    });

    group('getUsers ',(){

      test('should get Specific User', () async{
        //arrange
        var searchData = 'username';
        var criteriaData = Criteria(data: searchData,field: 'username');
        await dataSource.addUser(testUser);
        //act
        var res = await dataSource.getUsers(criteriaData);

        //assert
        expect(res[0].username, searchData);
      });

    });

    group('updateTrainer ', (){
      test('should update the User',()async{
        //arrange
        await dataSource.updateUser(testUser);
        //act
        var changedAlteredDataModel =  UserDataModel(
            tips: [TipDataModel(date: null, category: null, content: null)],
            joinedDate: 'date',
            description: 'description2',
            username: 'username',
            subscription: 'subscription',
            profileImage: 'profileImage',
            friends: ['friend1'],
            createdCourses: [UserCourseDataModel(coursePath: null, title: null)],
            isTrainer: true,
            isVerified: true,
            purchasedCourses: [UserCourseDataModel(coursePath: null, title: null)]
        );
        var res = await dataSource.updateUser(changedAlteredDataModel);
        //assert
        expect(res.description,'description2');
      });
    });

  });
}
