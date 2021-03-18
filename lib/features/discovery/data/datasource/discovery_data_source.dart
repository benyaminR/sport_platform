import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/discovery/data/datamodel/discovery_data_model.dart';
import 'package:sport_platform/utils/error/exception.dart';

abstract class DiscoveryDataSource{
  Future<DiscoveryDataMode> getDiscovery();
}

@Singleton(as:DiscoveryDataSource)
class DiscoveryDataSourceImpl extends DiscoveryDataSource{
  final FirebaseFirestore firestore;

  DiscoveryDataSourceImpl({@required this.firestore});

  @override
  Future<DiscoveryDataMode> getDiscovery() async{
    var data =  await firestore.collection("Discovery").doc("discovery").get();
    if(!data.exists)
      throw ServerException();
    return DiscoveryDataMode.fromSnapshot(data);
  }

}