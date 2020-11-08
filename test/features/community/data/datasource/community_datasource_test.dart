

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_platform/features/community/data/datamodel/community_comment_datamodel.dart';
import 'package:sport_platform/features/community/data/datamodel/community_like_data_model.dart';
import 'package:sport_platform/features/community/data/datamodel/community_media_data_model.dart';
import 'package:sport_platform/features/community/data/datamodel/community_post_data_model.dart';
import 'package:sport_platform/features/community/data/datamodel/community_share_data_model.dart';
import 'package:sport_platform/features/community/data/datasource/community_data_source.dart';

void main() {
  final firebaseMock = MockFirestoreInstance();
  final dataSource = CommunityDataSourceImpl(firebaseFirestore: firebaseMock);

  final testPost = CommunityPostDataModel(
      description: 'des',
      date: 'date',
      media: [CommunityMediaDataModel(thumbnail: 'thumbnail', viewCount: 100, source: 'source', creationDate: 'date', mediaType: 'type')],
      UID: 'uid',
      username: 'username',
      thumbnail: 'thumbnail',
      comments: [CommunityCommentDatamodel(username: 'username', thumbnail: 'thumbnail', stars: 4.3, text: 'sda', date: 'date')],
      likes: [CommunityLikeDataModel(username: 'username', thumbnail: 'thumbnail', date: 'date')],
      shares: [CommunityShareDataModel(username: 'username', thumbnail: 'thumbnail', date: 'date')]
  );

  group('CommunityDataSource ',(){

    group('AddPost ',(){
      test('should return the added Post',() async{
        //arrange
        //act
        var res = await dataSource.addPost(testPost);
        //assert
        expect(res,testPost);
      });
    });
    group('RemovePost ',(){
      test('should return the removed Post',() async{
        //arrange
        //act
        var res = await dataSource.removePost(testPost);
        //assert
        expect(res,testPost);
      });
    });

    group('UpdatePost',(){
      test('should return the removed Post',() async{
        //arrange
        //act
        var res = await dataSource.updatePost(testPost);
        //assert
        expect(res,testPost);
      });
    });

    group('GetPosts',(){
      test('should return the posts',() async{
        //arrange
        //act
        var res = await dataSource.getPosts(null);
        //assert
        expect(res,isA<List<CommunityPostDataModel>>());
      });
    });

  });

}