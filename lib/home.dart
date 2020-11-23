import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/discovery.dart';
import 'package:sport_platform/navigation_bar.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'features/community/presentation/views/post.dart';
import 'navigation_bar_new.dart';

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
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF141416),
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: _currentIndex == 0
                      ? GlowIcon(
                          Icons.home,
                          size: 30.0,
                          color: Color(0xFFE4572E),
                          blurRadius: 4.0,
                          glowColor: Color(0xFFE4572E),
                        )
                      : Icon(
                          Icons.home,
                          size: 30.0,
                          color: Color(0xFF5B5B5C),
                        ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                      currentPage = Discovery();
                    });
                  },
                ),
                IconButton(
                  icon: _currentIndex == 1
                      ? GlowIcon(
                          Icons.language,
                          size: 30.0,
                          color: Color(0xFFE4572E),
                          blurRadius: 4.0,
                          glowColor: Color(0xFFE4572E),
                        )
                      : Icon(
                          Icons.language,
                          size: 30.0,
                          color: Color(0xFF5B5B5C),
                        ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                      currentPage = Post();
                    });
                  },
                ),
                SizedBox.shrink(),
                IconButton(
                  icon: _currentIndex == 2
                      ? GlowIcon(
                          Icons.person,
                          size: 30.0,
                          color: Color(0xFFE4572E),
                          blurRadius: 4.0,
                          glowColor: Color(0xFFE4572E),
                        )
                      : Icon(
                          Icons.person,
                          size: 30.0,
                          color: Color(0xFF5B5B5C),
                        ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                      currentPage = Discovery();
                    });
                  },
                ),
                IconButton(
                  icon: _currentIndex == 3
                      ? GlowIcon(
                          Icons.message,
                          size: 30.0,
                          color: Color(0xFFE4572E),
                          blurRadius: 4.0,
                          glowColor: Color(0xFFE4572E),
                        )
                      : Icon(
                          Icons.message,
                          size: 30.0,
                          color: Color(0xFF5B5B5C),
                        ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3;
                      currentPage = Discovery();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFE4572E),
          child: Icon(Icons.add),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
