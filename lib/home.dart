import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/discovery.dart';
import 'package:sport_platform/personal.dart';
import 'package:sport_platform/utils/colors.dart';

import 'community.dart';

class Home extends StatefulWidget {
  final Widget child;

  Home({Key key, this.child}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  Widget currentPage = Discovery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: PRIMARYCOLOR_ORANGE,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: PRIMARYCOLOR_ORANGE,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: PRIMARYCOLOR_ORANGE,
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            switch (index) {
              case 0:
                currentPage = Discovery();
                break;
              case 1:
                currentPage = Community();
                break;
              case 2:
                currentPage = Personal();
                break;
              default:
                break;
            }
          });
        },
      ),
    );
  }
}
