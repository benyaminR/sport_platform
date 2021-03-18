import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/archive/chat/domain/entity/chat_message.dart';
import 'package:sport_platform/archive/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:sport_platform/archive/chat/presentation/bloc/chat/chat_event.dart';
import 'package:sport_platform/archive/chat/presentation/bloc/chat/chat_state.dart';
import 'package:sport_platform/container.dart';
import 'chat_detailview_list_element.dart';
import 'chat_detailview_list_element_message.dart';
import 'chat_detailview_list_element_top.dart';


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
                                itemBuilder:(context, index) => ChatDetailviewListElement(
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
                  child: ChatDetailviewListElementTop(profileImage: otherProfileImage,username: otherUsername,),
                ),
                ChatDetailviewListElementMessage(receiver: otherUID,sender: myUID,),
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
