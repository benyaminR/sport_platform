import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class DiscoveryTrainers2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Im Trend",
                    style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Colors.black,
                    ),
                    height: 18.0,
                    width: 56.0,
                    child: Center(
                      child: Text(
                        'Mehr',
                        style:
                        TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfilePicture(url: 'Trainers/face_01.jpg', size: 30.0,),
                    Text(
                      "@jennyfit",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
