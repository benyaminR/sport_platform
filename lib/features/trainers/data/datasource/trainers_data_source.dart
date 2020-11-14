
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/trainers/data/datamodel/trainer_data_model.dart';
import 'package:sport_platform/features/trainers/domain/entity/trainer_criteria.dart';

abstract class TrainersDataSource{
  Future<List<TrainerDataModel>> getTrainers(TrainerCriteria criteriaData);
  Future<TrainerDataModel> addTrainer(TrainerDataModel trainerData);
  Future<TrainerDataModel> removeTrainer(String username);
  Future<TrainerDataModel> updateTrainer(TrainerDataModel trainerData);
}

class TrainersDataSourceImpl implements TrainersDataSource{
  final FirebaseFirestore firestore;

  TrainersDataSourceImpl({@required this.firestore});

  @override
  Future<TrainerDataModel> addTrainer(TrainerDataModel trainerData) async{
    await firestore.
    collection('Trainers').
    doc(trainerData.username).
    set(trainerData.toMap());
    return trainerData;
  }

  @override
  Future<List<TrainerDataModel>> getTrainers(TrainerCriteria criteriaData) async{
    if(criteriaData != null) {
      var res = await firestore.collection('Trainers').where(
          criteriaData.filter, isEqualTo: criteriaData.data).get();

      return res.docs.map((e) => TrainerDataModel.fromSnapshot(e)).toList();
    }
    else{
      var res = await firestore.collection('Trainers').get();
      return res.docs.map((e) => TrainerDataModel.fromSnapshot(e)).toList();
    }
  }

  @override
  Future<TrainerDataModel> removeTrainer(String username) async{
    var users = await getTrainers(null);
    await firestore.
    collection('Trainers').
    doc(username).
    delete();
    return users[0];
  }

  @override
  Future<TrainerDataModel> updateTrainer(TrainerDataModel trainerData) async{
    await firestore.
    collection('Trainers').
    doc(trainerData.username).
    update(
        trainerData.toMap()
    );
    return trainerData;
  }


}