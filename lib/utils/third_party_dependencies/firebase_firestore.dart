import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseFirestoreDependency{
  FirebaseFirestore get prefs => FirebaseFirestore.instance;
}