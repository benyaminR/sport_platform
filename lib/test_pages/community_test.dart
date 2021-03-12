import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_platform/features/community/data/datamodel/community_post_data_model.dart';
import 'package:sport_platform/features/community/domain/entity/community_post.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_bloc.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_event.dart';
import 'package:sport_platform/features/community/presentation/bloc/community/community_state.dart';

class CommunityTestWidget extends StatelessWidget {
  var index = 0;

    @override
    Widget build(BuildContext context) {
      getIt<AuthenticationBloc>().add(SignInWithGoogleEvent());
      var samplePost = CommunityPost(
          description: 'A new Post from me #feelingGood' + Random().nextInt(10000).toString(),
          date: DateTime.now().toString(),
          media: [],
          username: '@UserName',
          thumbnail: 'thumbnail',
          comments: [],
          likes: [],
          shares: [],
          docID: 'id'
      );

      var deleteSample = CommunityPost(
          description: 'A new Post from me #feelingGood' + Random().nextInt(10000).toString(),
          date: DateTime.now().toString(),
          media: [],
          username: '@UserName',
          thumbnail: 'thumbnail',
          comments: [],
          likes: [],
          shares: [],
          docID: 'LTy1MZPHy0iRVIVtA8KI'
      );

      var updatedSample = CommunityPost(
          description: 'This post has been updated!' + Random().nextInt(10000).toString(),
          date: DateTime.now().toString(),
          media: [],
          username: '@UserName',
          thumbnail: 'thumbnail',
          comments: [],
          likes: [],
          shares: [],
          docID: 'VQC3bRccy70aHsaJUMxF'
      );

      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                child: Center(
                  child: BlocProvider.value(
                    value: getIt<CommunityBloc>(),
                    child: BlocBuilder<CommunityBloc,CommunityState>(
                      builder: (context, state){
                        index = 0;
                        if(state is LoadingCommunitiesState)
                          return CircularProgressIndicator();
                        if(state is ErrorCommunitiesState)
                          return Text(state.msg);
                        if(state is LoadedCommunitiesState)
                        return SingleChildScrollView(
                              child: Text(state.posts.map((e) {
                                return '${index++}. '+CommunityPostDataModel.toMap(e).toString() +'\n\n';
                              }).toList().toString())
                          );
                        return Text('...');
                      },
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FlatButton(
                      onPressed:()=> getIt<CommunityBloc>().add(AddPostEvent(postData: samplePost)),
                      child: Text('Add')
                  ),
                  FlatButton(
                      onPressed:()=> getIt<CommunityBloc>().add(GetPostsEvent(criteriaData: null)),
                      child: Text('Get')
                  ),
                  FlatButton(
                      onPressed:()=> getIt<CommunityBloc>().add(RemovePostEvent(postData: deleteSample)),
                      child: Text('Delete')
                  ),
                  FlatButton(
                      onPressed:()=> getIt<CommunityBloc>().add(UpdatePostEvent(postData: updatedSample)),
                      child: Text('Update')
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
}
