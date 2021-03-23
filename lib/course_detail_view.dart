import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/archive/post_comment.dart';
import 'package:sport_platform/course_detail_view_course_material.dart';
import 'package:sport_platform/course_detail_view_top.dart';
import 'package:sport_platform/utils/components/image_section.dart';
import 'package:video_player/video_player.dart';

import 'VideoApp.dart';
import 'VideoApp.dart';
import 'course_detail_view_review.dart';

// ignore: must_be_immutable
class CourseDetailView extends StatelessWidget {
  final String _bildbeschreibung =
      "Hallo Fitness-Freunde, ich habe heute eine ganz spezielle Übung für euch, welche ich euch natürlich nicht vorenthalten möchte.";

  var otherProfileImage = 'Trainers/face_01.jpg';
  var otherUsername = '@Ben';

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

    return SafeArea(
      child: Material(
        child: Container(
          color: Colors.black,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: height3 * 0.015,
              ),
              CourseDetailViewTop(
                profileImage: otherProfileImage,
                username: otherUsername,
              ),
              SizedBox(
                height: height3 * 0.015,
              ),
              // VideoApp(
              //   videoPlayerController: VideoPlayerController.asset(
              //     'assets/videos/IntroVideo.mp4',
              //   ),
              //   looping: true,
              // ),
              VideoApp(
                videoPlayerController: VideoPlayerController.network(
                  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                ),
                looping: true,
              ),
              SizedBox(
                height: height3 * 0.015,
              ),
              // TODO Kursinfos
              Container(
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
                            'Calisthenics für',
                            style: TextStyle(
                                color: Colors.white, fontSize: height3 * 0.024),
                          ),
                          Text(
                            'Anfänger',
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
                            '12 Abschnitte',
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
                            '8 Stunden',
                            style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: height3 * 0.012),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height3 * 0.015,
              ),
              Container(
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
              ),
              SizedBox(
                height: height3 * 0.015,
              ),
              // TODO Kursinhalt - Beschreibung - Reviews Übersicht
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF141416),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kursinhalt",
                            style: TextStyle(
                              fontSize: height3 * 0.022,
                              color: Color(0xFF707070),
                            ),
                          ),
                          Text(
                            "Beschreibung",
                            style: TextStyle(
                              fontSize: height3 * 0.022,
                              color: Color(0xFF707070),
                            ),
                          ),
                          Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: height3 * 0.022,
                              color: Color(0xFF707070),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height3 * 0.015,
              ),
              // TODO dann jeweils nach Menüpunkt was anderes einblenden
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF141416),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
                  child: CourseDetailViewCourseMaterial(),
                ),
              ),
              SizedBox(
                height: height3 * 0.015,
              ),
              Container(
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
                        "Was werde ich lernen?",
                        style: TextStyle(
                          fontSize: height3 * 0.032,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                      child: Text(
                        "Am Ende des Kurses bist du in der Lage eine Menge Bullshit Übungen zu machen. Außerdem kannst du 1000 Liegestützen in 10 Sekunden machen.",
                        style: TextStyle(
                          fontSize: height3 * 0.022,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height3 * 0.015,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF141416),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
                      child: CourseDetailViewReview(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height3 * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
