import 'package:flutter/material.dart';
import 'package:sport_platform/features/users/domain/entity/user.dart';
import 'package:sport_platform/personal_course_box_black.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class PersonalMainBody extends StatelessWidget {
  final User user;
  const PersonalMainBody({Key key,@required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height3 * 0.04,
              ),
              ProfilePicture(
                url: user.profileImage,
                size: height3 * 0.15,
              ),
              SizedBox(
                height: height3 * 0.02,
              ),
              Text(
                '@${user.username}',
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 20,
                  fontSize: height3 * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                // height: 20,
                height: height3 * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  user.description,
                  style: TextStyle(
                    fontSize: height3 * 0.022,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
              SizedBox(
                height: height3 * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF141416),
                ),
                //height: height3,
                width: width,
                child: Column(
                  children: user.purchasedCourses.map((e) => PersonalCourseBoxBlack(course: e,)).toList(),
                ),
              ),
              SizedBox(
                height: height3 * 0.06,
              ),
            ],
          ),
        ),
      ),
    );  }
}
