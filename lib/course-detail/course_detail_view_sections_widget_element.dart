import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class CourseDetailViewSectionsWidgetElement extends StatelessWidget {
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

    const loremIpsum = "Ungeöffnet";

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
                          "Abschnitt 1",
                          style: TextStyle(
                            fontSize: height3 * 0.026,
                            color: Colors.white,
                          ),
                        )),
                    collapsed: null,
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            "Kapitel 1",
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
                        GestureDetector(
                          child: Text(
                            "Kapitel 2",
                            style: TextStyle(
                              fontSize: height3 * 0.022,
                              color: Color(0xFF707070),
                            ),
                          ),
                          onTap: () {
                            //TODO hier muss dann das Video asugetauscht werden
                          },
                        ),
                      ],
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
}
