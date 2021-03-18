import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_media.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/archive/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:sport_platform/archive/chat/presentation/bloc/chat/chat_event.dart';
import 'package:sport_platform/container.dart';

class ChatDetailviewListElementMessage extends StatelessWidget {
  final String receiver;
  final String sender;
  final TextEditingController _controller = TextEditingController();

  ChatDetailviewListElementMessage({Key key,@required this.receiver,@required this.sender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      color: Colors.black,
      child: Container(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              width: 360.0,
              height: 30.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 14.0, left: 16.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Deine Nachricht...',
                    hintStyle: new TextStyle(
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap:(){
                if( _controller.text.length == 0) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Text Field Is Empty!')));
                }else {
                  getIt<ChatBloc>().add(
                      SendMessageEvent(messageData: ChatMessage(
                          sender: sender,
                          text: _controller.text,
                          mediaData: ChatMedia(
                              source: 'none', mediaType: 'text'),
                          receivedDate: DateTime.now().toString(),
                          receiver: receiver,
                          sentDate: DateTime.now().toString())));
                  _controller.clear();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xFFE4572E),
                ),
                width: 30.0,
                height: 30.0,
                child: Center(
                  child: Icon(Icons.send, size: 20.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
