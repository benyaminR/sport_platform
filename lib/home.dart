import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/discovery.dart';
import 'package:sport_platform/navigation_bar.dart';

class Home extends StatefulWidget {

  Home();

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  Widget currentPage = Discovery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: NavigationBar(),
    );
  }
}
