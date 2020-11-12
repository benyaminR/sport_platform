import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/register.dart';
import 'package:sport_platform/reset_password.dart';
import 'package:sport_platform/utils/colors.dart';
import 'package:sport_platform/utils/db_demo_data.dart';

import 'home.dart';
import 'login.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  await generate();
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: PRIMARYCOLOR_ORANGE,
      ),
      initialRoute: '/login',
      routes: {
        '/login':(context)=> Login(),
        '/home':(context) => Home(),
        '/login/register':(context) => Register(),
        '/login/resetPassword':(context) => ResetPassword(),
      },
    );
  }
}
