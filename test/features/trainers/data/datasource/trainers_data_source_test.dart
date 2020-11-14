import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_platform/features/trainers/data/datamodel/tip_data_model.dart';
import 'package:sport_platform/features/trainers/data/datamodel/trainer_course_data_model.dart';
import 'package:sport_platform/features/trainers/data/datamodel/trainer_data_model.dart';
import 'package:sport_platform/features/trainers/data/datasource/trainers_data_source.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_criteria.dart';

main() {
  final firestore = MockFirestoreInstance();
  final dataSource = TrainersDataSourceImpl(firestore: firestore);
  final testTrainer = TrainerDataModel(
    username: 'username',
    courses: [TrainerCourseDataModel(coursePath: 'path', title: 'stay healthy')],
    description: 'description',
    joinedDate: 'yesterday',
    tips: [TipDataModel(date: 'today', category: 'health', content: 'drink water')],
    verified: true,
  );


  group('UsersDataSource ',(){
    group('addTrainer ',(){
      test('should add an Trainer',()async{
        //act
        var res = await dataSource.addTrainer(testTrainer);
        //assert
        expect(res, testTrainer);
      });
    });

    group('removeTrainer',(){
      test('should remove a Trainer',()async{
        //act
        await firestore.collection('Trainers').doc('username').set(testTrainer.toMap());
        var res = await dataSource.removeTrainer('username');
        //assert
        expect(res, isA<TrainerDataModel>());
      });
    });

    group('getTrainers ',(){

      test('should get Specific Trainer', () async{
        //arrange
        var searchData = 'username';
        var criteriaData = TrainerCriteria(data: searchData,filter: 'username');
        await dataSource.addTrainer(testTrainer);
        //act
        var res = await dataSource.getTrainers(criteriaData);

        //assert
        expect(res[0].username, searchData);
      });

    });

    group('updateTrainer ', (){
      test('should update the Trainer',()async{
        //arrange
        await dataSource.updateTrainer(testTrainer);
        //act
        var changedAlteredDataModel = TrainerDataModel(
          username: 'username',
          courses: [TrainerCourseDataModel(coursePath: 'path', title: 'stay healthy')],
          description: 'description2',
          joinedDate: 'yesterday',
          tips: [TipDataModel(date: 'today', category: 'health', content: 'drink water')],
          verified: true,
        );

        var res = await dataSource.updateTrainer(changedAlteredDataModel);
        //assert
        expect(res.description,'description2');
      });
    });

  });
}
