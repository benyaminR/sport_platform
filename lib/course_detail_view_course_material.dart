import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/components/image_section.dart';

class CourseDetailViewCourseMaterial extends StatefulWidget {
  @override
  _CourseDetailViewCourseMaterialState createState() =>
      _CourseDetailViewCourseMaterialState();
}

class _CourseDetailViewCourseMaterialState
    extends State<CourseDetailViewCourseMaterial> {
  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height1 = height - padding.top - padding.bottom;
    // Height (without status bar)
    final double height2 = height - padding.top;
    // Height (without status and toolbar)
    final double height3 = height - padding.top - kToolbarHeight;

    String valueChoose;
    List listItem = [
      "Abschnitt 1",
      "Abschnitt 2",
      "Abschnitt 3",
      "Abschnitt 4"
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF141416),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButtonFormField(
                  hint: Text("Items auswählen: "),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                    });
                  },
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
