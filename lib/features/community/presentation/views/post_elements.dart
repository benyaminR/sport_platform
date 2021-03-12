import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_platform/bottom_sheet_share.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/features/community/domain/usecase/like_post_use_case.dart';
import 'package:sport_platform/features/community/presentation/views/post_slide.dart';
import 'package:sport_platform/post_comment.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';
import 'package:sport_platform/utils/custom_icons_icons.dart';
import 'package:sport_platform/utils/usecases/params.dart';
import '../../../../bottom_sheet_comment.dart';


class PostElements extends StatefulWidget {
  final CommunityPost communityPost;
  PostElements({@required this.communityPost});

  @override
  _PostElementsState createState() => _PostElementsState();
}

class _PostElementsState extends State<PostElements> {

  var isLikedByMe = false;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      var myUID = value.getString("uid");
      isLikedByMe = widget.communityPost.likes.any((element) => element.uid == myUID);
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //whether this post has been liked by me!

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFF141416),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height) - 100,
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  child: Container(
                    child: Row(
                      children: [ProfilePicture(
                        url: widget.communityPost.thumbnail, size: 20.0,),

                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.communityPost.username,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Text(
                                widget.communityPost.location,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF707070),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                height: 60.0,
              ),
              PostSlide(medias: widget.communityPost.media),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    //hier wie mit den Icons machen ob leuchtend oder nicht
                      child: Icon(
                        isLikedByMe ? CustomIcons.heart : CustomIcons.heart_empty,
                        color: Color(0xFFFFFFFF),
                      ),
                      onTap: () => {
                        setState(() {
                          isLikedByMe = !isLikedByMe;
                          //fire up the event
                          getIt<LikePostUseCase>()(WithParams(param: widget.communityPost.docID));
                        })
                      }),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    child: Icon(
                      CustomIcons.comment_empty,
                      color: Color(0xFFFFFFFF),
                    ),
                    onTap: () {
                      if(widget.communityPost.comments.length > 0 ) {
                        onButtonPressedComment(
                            context,
                            widget.communityPost.comments,
                            widget.communityPost.docID
                        );
                      }else{
                        Navigator.of(context).pushNamed(
                            '/home/discovery/postComment',
                            arguments: CommunityCommentsPageArgs(
                                comments: widget.communityPost.comments,
                                postID: widget.communityPost.docID
                            )
                        );
                      }
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    child: Icon(
                      CustomIcons.share,
                      color: Color(0xFFFFFFFF),
                    ),
                    onTap: () => onButtonPressedShare(context),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  RowSuper(
                    children: [
                      ProfilePicture(url:'Users/face_00.jpg', size: 10.0,),
                      ProfilePicture(url:'Users/face_01.jpg', size: 10.0,),
                      ProfilePicture(url:'Users/face_02.jpg', size: 10.0,),
                      ProfilePicture(url:'Users/face_03.jpg', size: 10.0,),
                    ],
                    innerDistance: -12.0,
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text(
                    "liked by James and 12k more",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF707070),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  widget.communityPost.description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
