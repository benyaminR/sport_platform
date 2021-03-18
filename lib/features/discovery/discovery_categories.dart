import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/colors.dart';

import '../../utils/components/image_section.dart';
import '../../utils/components/image_section_2.dart';

class DiscoveryCategories extends StatefulWidget {
  @override
  _DiscoveryCategoriesState createState() => _DiscoveryCategoriesState();
}

class _DiscoveryCategoriesState extends State<DiscoveryCategories> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        shadowColor: Color(000000),
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      'Mehr',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 160.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ImageSection2(),
                    SizedBox(
                      width: 20.0,
                    ),
                    ImageSection2(),
                    SizedBox(
                      width: 20.0,
                    ),
                    ImageSection2(),
                    SizedBox(
                      width: 20.0,
                    ),
                    ImageSection2(),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}