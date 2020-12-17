import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/personal_course_box_black.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class PostComment extends StatefulWidget {
  PostComment();

  _PostCommentState createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {

  final String _bildbeschreibung = "Ich habe seit über 10 Jahren Berufserfahrung gesammelt im Bereich Sport und bin jetzt bereit dafür dieses Wissen auch an meine Kunden weiterzugeben. Ich hoffe du lernst etwas neues für dich selbst.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFF141416),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Kommentiere hier...',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF707070),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: [
                            ProfilePicture(url: 'https://pbs.twimg.com/profile_images/1325119155377418242/Tz2VwEvI_400x400.jpg', size: 18.0,),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jolie",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    "Berlin, Deutschland",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF707070),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Icon(Icons.star, size: 25.0, color: Colors.white),
                            Icon(Icons.star, size: 25.0, color: Colors.white),
                            Icon(Icons.star, size: 25.0, color: Colors.white),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          _bildbeschreibung,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF707070),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: [
                            ProfilePicture(url: 'https://www.tz.de/bilder/2013/05/02/2884215/2136792343-mila-kunis-33UUse4nec.jpg', size: 18.0,),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mila",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    "Berlin, Deutschland",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF707070),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Icon(Icons.star, size: 25.0, color: Colors.white),
                            Icon(Icons.star, size: 25.0, color: Colors.white),
                            Icon(Icons.star, size: 25.0, color: Colors.white),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          _bildbeschreibung,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF707070),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
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
