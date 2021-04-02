import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDetailViewDescriptionWidget extends StatelessWidget{

  final String title;
  final String description;

  const CourseDetailViewDescriptionWidget({Key key, @required this.title,@required this.description}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF141416),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 16.0, right: 8.0, bottom: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: height3 * 0.032,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(description,
              style: TextStyle(
                fontSize: height3 * 0.022,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

}