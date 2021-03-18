import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

import 'features/discovery/domain/entity/trending_trainer.dart';

class DiscoveryTrainers extends StatelessWidget {
  final List<TrendingTrainer> trainers;

  const DiscoveryTrainers({Key key,@required this.trainers}) : super(key: key);


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

    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: height3 * 0.024, right: height3 * 0.024, top: 0.0, bottom: 0.0),
        child: Column(
          children: <Widget>[
            Container(
              height: height3 * 0.045,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Im Trend",
                    style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: height3 * 0.03),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Colors.black,
                    ),
                    height: height3 * 0.027,
                    width: height3 * 0.084,
                    child: Center(
                      child: Text(
                        'Mehr',
                        style:
                        TextStyle(color: Colors.white, fontSize: height3 * 0.021),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: trainers.map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePicture(url: e.thumbnail, size: height3 * 0.045),
                  Text(
                    e.name,
                    style: TextStyle(
                      fontSize: height3 * 0.015,
                      color: Color(0xFF707070),
                    ),
                  ),
                ],
              ), ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
