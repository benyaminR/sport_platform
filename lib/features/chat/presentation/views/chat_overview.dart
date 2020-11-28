import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_element_overview.dart';
import 'file:///C:/Users/chris/Documents/SourceCode/sport_platform/lib/features/chat/presentation/views/chat_detailview.dart';

class ChatOverview extends StatefulWidget {
  ChatOverview();

  _ChatOverviewState createState() => _ChatOverviewState();
}

class _ChatOverviewState extends State<ChatOverview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height),
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            ChatElementOverview(),
            ChatElementOverview(),
            ChatElementOverview(),
            ChatElementOverview(),
          ],
        ),
      ),
    );
  }
}
