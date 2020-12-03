import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/chat/presentation/views/chat_detailview.dart';
import 'package:sport_platform/features/chat/presentation/views/chat_overview.dart';
import 'file:///C:/Users/chris/Documents/SourceCode/sport_platform/lib/features/authentication/presentation/views/register.dart';
import 'file:///C:/Users/chris/Documents/SourceCode/sport_platform/lib/features/authentication/presentation/views/reset_password.dart';
import 'package:sport_platform/utils/colors.dart';
import 'package:sport_platform/utils/db_demo_data.dart';
import 'home.dart';
import 'features/authentication/presentation/views/login.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  //await generate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: PRIMARYCOLOR_ORANGE,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> Login(),
        '/home':(context) => Home(),
        '/register':(context) => Register(),
        '/resetPassword':(context) => ResetPassword(),
        '/home/chatDetailview':(context) => ChatDetailview(),
      },
    );
  }
}
