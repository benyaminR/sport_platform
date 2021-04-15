import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:sport_platform/features/courses/domain/enitity/content_section.dart';
import 'package:sport_platform/features/courses/domain/enitity/video.dart';

class CourseDetailViewSectionsWidgetElement extends StatelessWidget {

  final ContentSection contentSection;
  final int index;

  const CourseDetailViewSectionsWidgetElement({Key key,@required this.contentSection,@required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    final double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    final padding = MediaQuery.of(context).padding;
    final double height3 = height - padding.top - kToolbarHeight;


    return Container(
      child: ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
          child: Card(
            color: Colors.black,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      iconColor: Colors.white,
                      tapBodyToCollapse: false,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Abschnitt ${index+1}",
                          style: TextStyle(
                            fontSize: height3 * 0.026,
                            color: Colors.white,
                          ),
                        )),
                    collapsed: null,
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: contentSection.videos.map((video) => VideoWidget(video,height3)).toList(),
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget VideoWidget(Video video, double height3){
    return Column(
      children: [
        GestureDetector(
          child: Text(
            video.title,
            style: TextStyle(
              fontSize: height3 * 0.022,
              color: Color(0xFF707070),
            ),
          ),
          onTap: () {
            //TODO hier muss dann das Video asugetauscht werden
          },
        ),
        SizedBox(
          height: height3 * 0.015,
        ),
      ],
    );
  }
}
