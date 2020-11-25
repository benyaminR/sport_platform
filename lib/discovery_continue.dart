import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/image_section_3.dart';
import 'package:sport_platform/profile_picture_middle.dart';
import 'package:sport_platform/profile_picture_small.dart';

import 'bottom_sheet.dart';
import 'features/community/presentation/views/post_slide.dart';
import 'image_section.dart';

class DiscoveryContinue extends StatefulWidget {
  @override
  _DiscoveryContinueState createState() => _DiscoveryContinueState();
}

class _DiscoveryContinueState extends State<DiscoveryContinue> {
  final String _course_description =
      "Werde Tennis-Profi in 4 Monaten. Der beste Tenniskurs ever. Ich bin der Tennisprofi!";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 0.0, top: 15.0, right: 0.0, bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFF141416),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height) - 400,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) / 2.0,
                      child: Text(
                        _course_description,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF707070),
                        ),
                      ),
                    ),
                    ImageSection3(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Tennis",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                ElevatedButton(
                  child: Text(
                    'Weitermachen',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffe4572e)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(300, 40)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
