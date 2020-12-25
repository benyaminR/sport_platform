import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_platform/features/community/data/datamodel/community_comment_datamodel.dart';
import 'package:sport_platform/features/community/data/datamodel/community_like_data_model.dart';
import 'package:sport_platform/features/community/data/datamodel/community_media_data_model.dart';
import 'package:sport_platform/features/community/data/datamodel/community_post_data_model.dart';
import 'package:sport_platform/features/community/data/datamodel/community_share_data_model.dart';

void main() {
  final firestore = MockFirestoreInstance();
  final testPost = CommunityPostDataModel(
      description: 'des',
      date: 'date',
      media: [CommunityMediaDataModel(thumbnail: 'thumbnail', viewCount: 100, source: 'source', creationDate: 'date', mediaType: 'type')],
      username: 'username',
      thumbnail: 'thumbnail',
      comments: [CommunityCommentDatamodel(username: 'username', thumbnail: 'thumbnail', postID: 4.3, text: 'sda', date: 'date')],
      likes: [CommunityLikeDataModel(username: 'username', thumbnail: 'thumbnail', date: 'date')],
      shares: [CommunityShareDataModel(username: 'username', thumbnail: 'thumbnail', date: 'date')]
  );

  test('should convert correctly ',() async{
    //arrange
    var data = CommunityPostDataModel.toMap(testPost);
    await firestore.collection('Community').doc('testPost').set(data);
    var snap = await firestore.doc('Community/testPost').get();
    //act
    var res = CommunityPostDataModel.fromSnapshot(snap);
    //assert
    expect(res,isA<CommunityPostDataModel>());
  });


}