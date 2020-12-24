import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/chat/presentation/views/chat_detailview.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';



class ChatElementOverview extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String lastMsg;
  final String date;
  final int unreadCount;
  final String uid;
  const ChatElementOverview({
    Key key,
    @required this.imageUrl,
    @required this.username,
    @required this.lastMsg,
    @required this.date,
    @required this.unreadCount,
    @required this.uid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 10.0, bottom: 0.0),
      child: Container(
        child: GestureDetector(
          child: Row(
            children: [
              ProfilePicture(url: imageUrl, size: 30.0,),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      lastMsg,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 100.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Color(0xFFED2644),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF0000).withAlpha(60),
                            blurRadius: 6.0,
                            spreadRadius: 6.0,
                          ),
                        ],
                      ),
                      width: 18.0,
                      height: 18.0,
                      child: Center(
                        child: Text(
                          unreadCount.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            return Navigator.of(context).pushNamed('/home/chatDetailview',arguments: ChatDetailArgs(otherUID:uid,otherImage:imageUrl,otherUsername: username));
          },
        ),
      ),
    );
  }
}
