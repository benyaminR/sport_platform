import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/authentication/presentation/views/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}