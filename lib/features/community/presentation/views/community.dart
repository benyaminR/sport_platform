import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_bloc.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_event.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_state.dart';
import 'package:sport_platform/features/community/presentation/views/post_elements.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height - 130;
    return SafeArea(
      child: Container(
        child: Stack(
          children: <Widget>[
            BlocProvider.value(
                value: getIt<CommunityBloc>()..add(GetPostsEvent(criteriaData: null)),
            child: BlocBuilder<CommunityBloc,CommunityState>(
              builder: (context, state) {
                if(state is LoadedCommunitiesState)
                  return _postsListWidget(height, state.posts);
                if(state is LoadingCommunitiesState)
                  return Center(child: CircularProgressIndicator());
                if(state is ErrorCommunitiesState)
                  return Center(child:Text(state.msg));
                return Container();
              },
            ),),
            Padding(
              padding:
                  EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0, bottom: 0.0),
              child: Container(
                height: 50.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ProfilePicture(url:'https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg', size: 20.0,),
                      ProfilePicture(url:'https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg', size: 20.0,),
                      ProfilePicture(url:'https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg', size: 20.0,),
                      ProfilePicture(url:'https://i.pinimg.com/736x/38/1d/71/381d71e601a0b84411bc242e571288c2.jpg', size: 20.0,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _postsListWidget(double height, List<CommunityPost> posts){
    return Padding(
      padding:
      EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 80.0),
      child: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: false,
            enableInfiniteScroll: false,
            scrollDirection: Axis.vertical,
          ),
          items: posts.map((e) => PostElements(communityPost: e,)).toList(),
        ),
      ),
    );
  }

}
