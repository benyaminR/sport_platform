import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDetailViewInfoWidget extends StatelessWidget{
  final String title;
  final String duration;
  final String sections;

  const CourseDetailViewInfoWidget({Key key,
    @required this.title,
    @required this.duration,
    @required this.sections}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return Container(
      width: height3 * 0.36,
      height: height3 * 0.15,
      decoration: new BoxDecoration(
        color: Color(0xFF141416),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontSize: height3 * 0.024),
                ),
              ],
            ),
            Text(
              '|',
              style: TextStyle(
                  color: Colors.white, fontSize: height3 * 0.10),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kursinhalt',
                  style: TextStyle(
                      color: Colors.white, fontSize: height3 * 0.024),
                ),
                Text(
                  sections,
                  style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: height3 * 0.012),
                ),
                Text(
                  'Dauer',
                  style: TextStyle(
                      color: Colors.white, fontSize: height3 * 0.024),
                ),
                Text(
                  duration,
                  style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: height3 * 0.012),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}