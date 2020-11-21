import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport_platform/features/authentication/domain/entity/auth.dart';
import 'package:sport_platform/features/storage/domain/entity/storage_data.dart';

class StorageDataDataModel extends StorageData{

  StorageDataDataModel({
    @required data,
    @required path
  })
      :
        super(
          path: path,
          data: data
      );

}

