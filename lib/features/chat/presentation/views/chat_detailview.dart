import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/chat/presentation/views/chat_element_detailview_message.dart';

import 'chat_element_detailview.dart';
import 'chat_element_detailview_top.dart';



class ChatDetailview extends StatefulWidget {
  ChatDetailview();

  _ChatDetailviewState createState() => _ChatDetailviewState();
}

class _ChatDetailviewState extends State<ChatDetailview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height),
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      ChatElementDetailview(side: 'left', message: 'Hallo mein Bester, ich habe heute richtig stark trainiert, wie ist es bei dir gewesen?', time: '15:30',),
                      SizedBox(
                        height: 30.0,
                      ),
                      ChatElementDetailview(side: 'right', message: "Hallo wollen wir heute Abend noch was unternehmen?", time: '16:30',),
                      SizedBox(
                        height: 30.0,
                      ),
                      ChatElementDetailview(side: 'left', message: 'Hallo mein Bester, ich habe heute richtig stark trainiert, wie ist es bei dir gewesen?', time: '15:30',),
                      SizedBox(
                        height: 30.0,
                      ),
                      ChatElementDetailview(side: 'right', message: "Hallo wollen wir heute Abend noch was unternehmen?", time: '16:30',),
                      SizedBox(
                        height: 30.0,
                      ),
                      ChatElementDetailview(side: 'left', message: 'Hallo mein Bester, ich habe heute richtig stark trainiert, wie ist es bei dir gewesen?', time: '15:30',),
                      SizedBox(
                        height: 30.0,
                      ),
                      ChatElementDetailview(side: 'right', message: "Hallo wollen wir heute Abend noch was unternehmen?", time: '16:30',),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ChatElementDetailviewTop(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 650.0),
                child: ChatElementDetailviewMessage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
