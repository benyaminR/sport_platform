import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseFunctionsDependency{
  FirebaseFunctions get prefs {
    var instance = FirebaseFunctions.instance;
    instance.useFunctionsEmulator(origin: "http://localhost:5001");
    return instance;
  }
}