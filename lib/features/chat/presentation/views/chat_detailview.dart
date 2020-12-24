import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_event.dart';
import 'package:sport_platform/features/chat/presentation/bloc/chat/chat_state.dart';
import 'package:sport_platform/features/chat/presentation/views/chat_element_detailview_message.dart';
import 'chat_element_detailview.dart';
import 'chat_element_detailview_top.dart';


class ChatDetailview extends StatefulWidget {

  const ChatDetailview({Key key,}) : super(key: key);

  @override
  _ChatDetailviewState createState()=> _ChatDetailviewState();
}

class _ChatDetailviewState extends State<ChatDetailview> {



  final ScrollController _scrollController = ScrollController();
  var myUID = getIt<FirebaseAuth>().currentUser.uid;
  var otherUID = '';

  var myProfileImage = '';
  var otherProfileImage = '';
  var otherUsername = '';
  _ChatDetailviewState();

  @override
  void initState() {
    super.initState();

    getIt<FirebaseFirestore>().collection('Users').doc(myUID).get().then((value) =>
        setState(() {
          print('loaded my image');
          myProfileImage = value.data()['profileImage'];
        })
    );

  }

  @override
  Widget build(BuildContext context) {
    print('reloading');

    final ChatDetailArgs args = ModalRoute.of(context).settings.arguments;
    otherUID = args.otherUID;
    otherProfileImage = args.otherImage;
    otherUsername = args.otherUsername;
    print(otherUID);

    if(myProfileImage == '')
      return CircularProgressIndicator();

    return Scaffold(
      body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: BlocProvider.value(
                value: getIt<ChatBloc>()..add(GetChatsEvent(userID:otherUID)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: BlocBuilder<ChatBloc,ChatState>(builder:(context, state) {
                    if(state is LoadedChatsState){
                      return StreamBuilder<List<ChatMessage>>(
                          stream: state.messages,
                          builder: (context, snapshot) {
                            if(snapshot.hasData)
                              return ListView.builder(
                                itemBuilder:(context, index) => ChatElementDetailview(
                                  side: snapshot.data[index].sender == myUID ? 'right':'left',
                                  message: snapshot.data[index].text,
                                  time: snapshot.data[index].sentDate,
                                  profilePic:snapshot.data[index].sender == myUID ? myProfileImage: otherProfileImage,
                                ),
                                itemCount: snapshot.data.length,
                                controller: _scrollController,
                              );
                            return Container();
                          }
                      );
                    }
                    if(state is LoadingChatsState){
                      return CircularProgressIndicator();
                    }
                    if(state is ErrorChatsState){
                      return Text(state.msg);
                    }
                    return Container();
                  },),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: ChatElementDetailviewTop(profileImage: otherProfileImage,username: otherUsername,),
                ),
                ChatElementDetailviewMessage(receiver: otherUID,sender: myUID,),
              ],
            )
          ]
      ),
    );
  }
}

class ChatDetailArgs{
  final String otherUID;
  final String otherImage;
  final String otherUsername;
  ChatDetailArgs({@required this.otherUID,@required this.otherImage,@required this.otherUsername});

}
