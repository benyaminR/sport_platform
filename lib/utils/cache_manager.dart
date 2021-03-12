


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_platform/container.dart';

Future<void> cacheUserDate() async{
  print('caching user data...');
  var sp = await SharedPreferences.getInstance();
  var auth = getIt<FirebaseAuth>();
  var user = await getIt<FirebaseFirestore>().collection("Users").doc(auth.currentUser.uid).get();

  await sp.setString('username', user.data()['username']);
  await sp.setString('uid', auth.currentUser.uid);
  await sp.setString('profileImage', user.data()['profileImage']);
  print('user data has been successfully cached!');


}