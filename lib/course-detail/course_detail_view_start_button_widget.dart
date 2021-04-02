import 'package:flutter/material.dart';

class CourseDetailViewStartButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Color(0xFFE4572E),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE4572E).withAlpha(60),
            blurRadius: 8.0,
            spreadRadius: 4.0,
          ),
        ],
      ),
      height: height3 * 0.06,
      width: height3 * 0.21,
      child: Center(
        child: Text(
          'Starten',
          style: TextStyle(
              color: Colors.white, fontSize: height3 * 0.03),
        ),
      ),
    );
  }
}
