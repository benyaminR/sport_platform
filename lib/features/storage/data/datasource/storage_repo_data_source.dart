import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_platform/features/storage/data/datamodel/storage_data_data_model.dart';
import 'package:sport_platform/utils/error/exception.dart';


abstract class StorageDataSource{
  Future<void> deleteStorageData(String storagePath);
  Future<StorageDataDataModel> replaceStorageData(StorageDataDataModel data);
  Future<String> getDownloadURL(String storagePath);
  Future<StorageDataDataModel> uploadStorageData(StorageDataDataModel data);
}

@Singleton(as: StorageDataSource)
class StorageDataSourceImpl implements StorageDataSource{

  final FirebaseStorage firebaseStorage;

  StorageDataSourceImpl({@required this.firebaseStorage});

  @override
  Future<void> deleteStorageData(String storagePath) async{
    if(storagePath == null) throw ServerException();
    try{
      return await firebaseStorage.ref().child(storagePath).delete();
    }on ServerException{
      throw ServerException();
    }
  }

  @override
  Future<String> getDownloadURL(String storagePath) async{
    if(storagePath == null) throw ServerException();
    try{
      return await firebaseStorage.ref().child(storagePath).getDownloadURL();
    }on ServerException{
      throw ServerException();
    }
  }

  @override
  Future<StorageDataDataModel> replaceStorageData(StorageDataDataModel data) async{
    if(data.data == null || data.path == null) throw ServerException();
    try{
      await deleteStorageData(data.path);
      await uploadStorageData(data);
      return data;
    }on ServerException{
      throw ServerException();
    }
  }

  @override
  Future<StorageDataDataModel> uploadStorageData(StorageDataDataModel data) async{
    if(data.data == null || data.path == null) throw ServerException();
    try{
      await firebaseStorage.ref().child(data.path).putData(data.data).onComplete;
      return data;
    }on ServerException{
      throw ServerException();
    }
  }

}