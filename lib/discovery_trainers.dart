import 'package:flutter/cupertino.dart';
import 'package:sport_platform/profile_picture_middle_2.dart';

class DiscoveryTrainers extends StatefulWidget {
  @override
  _DiscoveryTrainersState createState() => _DiscoveryTrainersState();
}

class _DiscoveryTrainersState extends State<DiscoveryTrainers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePictureMiddle2(),
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
      ),
    );
  }
}
