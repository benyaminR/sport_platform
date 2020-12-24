import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseFirestoreDependency{
  FirebaseFirestore get prefs {
    // Switch host based on platform.
//    String host = defaultTargetPlatform == TargetPlatform.android
//        ? '10.0.2.2:8080'
//        : 'localhost:8080';
    var instance = FirebaseFirestore.instance;
    instance.settings = Settings(
//      sslEnabled: false,
//      host: host,
      persistenceEnabled: false
    );

    return instance;
  }
}