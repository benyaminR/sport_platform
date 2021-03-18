import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/archive/community/domain/entity/community_comment.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

import '../container.dart';
import 'community/presentation/bloc/community/community_bloc.dart';
import 'community/presentation/bloc/community/community_event.dart';


class PostComment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final CommunityCommentsPageArgs args = ModalRoute.of(context).settings.arguments;
    final TextEditingController _commentTextEditingController = TextEditingController();
    final comments = args.comments;
    final postID = args.postID;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFF141416),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          controller: _commentTextEditingController,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (value) {
                            if(value != ""){
                              getIt<CommunityBloc>().add(CommentCommunityPostEvent(
                                communityComment: CommunityComment(
                                  thumbnail: "Users/UnknownUserImage.png",
                                  username: "Benyamin Radmard",
                                  date: DateTime.now().toString(),
                                  text: value,
                                  postID: postID,
                                )
                              ));
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Kommentiere hier...',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF707070),
                            ),
                          ),
                        ),
                        Column(
                          children: comments.map((e){
                            return Column(
                              children: [
                                SizedBox(
                                  height: 40.0,
                                ),
                                Row(
                                  children: [
                                    ProfilePicture(url: e.thumbnail, size: 18.0,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.username,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          Text(
                                            "Berlin, Deutschland",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFF707070),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  e.text,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF707070),
                                  ),
                                ),

                              ],
                            );
                          }).toList(),
                        )

                      ],
                    ),
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


class CommunityCommentsPageArgs{
  final List<CommunityComment> comments;
  final String postID;
  CommunityCommentsPageArgs({
    @required this.comments,
    @required this.postID
  });
}
