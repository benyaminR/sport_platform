import 'package:flutter/material.dart';

class CourseDetailViewSectionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF141416),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
        child: Center(
          child: Text("Under Development :)",style: TextStyle(
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}
