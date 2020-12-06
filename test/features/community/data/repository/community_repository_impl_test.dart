import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/community/data/datamodel/community_post_data_model.dart';
import 'package:sport_platform/features/community/data/datasource/community_data_source.dart';
import 'package:sport_platform/features/community/data/repository/community_repo_impl.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class CommunityDataSourceMock extends Mock implements CommunityDataSource{}

void main() {
  final CommunityDataSourceMock communityDataSourceMock = CommunityDataSourceMock();
  final CommunityRepoImpl communityRepoIml = CommunityRepoImpl(datasource:communityDataSourceMock);

  final post = CommunityPostDataModel(description: null, date: null, media: null, username: null, thumbnail: null, comments: null, likes: null, shares: null);
  final criteria = Criteria(field: null, data: null);

  group('CommunityRepoImpl ',(){
    group('AddPost ',(){
      test('Failure',() async{
        //Arrange
        when(communityDataSourceMock.addPost(post)).thenThrow(ServerException());
        //Act
        var res = await communityRepoIml.addPost(post);
        //Assert
        expect(res,Left(ServerFailure()));
        verify(communityDataSourceMock.addPost(post));
        verifyNoMoreInteractions(communityDataSourceMock);
      });
      test('Success',() async{
        //Arrange
        when(communityDataSourceMock.addPost(post)).thenAnswer((_) async =>post);
        //Act
        var res = await communityRepoIml.addPost(post);
        //Assert
        expect(res,right(post));
        verify(communityDataSourceMock.addPost(post));
        verifyNoMoreInteractions(communityDataSourceMock);
      });
    });

    group('GetPosts ',(){
      test('Failure',() async{
        //Arrange
        when(communityDataSourceMock.getPosts(criteria)).thenThrow(ServerException());
        //Act
        var res = await communityRepoIml.getPosts(criteria);
        //Assert
        expect(res,Left(ServerFailure()));
        verify(communityDataSourceMock.getPosts(criteria));
        verifyNoMoreInteractions(communityDataSourceMock);
      });
      test('Success',() async{
        //Arrange
        var expected = [post];
        when(communityDataSourceMock.getPosts(criteria)).thenAnswer((_) async => expected);
        //Act
        var res = await communityRepoIml.getPosts(criteria);
        //Assert
        expect(res,right(expected));
        verify(communityDataSourceMock.getPosts(criteria));
        verifyNoMoreInteractions(communityDataSourceMock);
      });
    });

    group('UpdatePost ',(){
      test('Failure',() async{
        //Arrange
        when(communityDataSourceMock.updatePost(post)).thenThrow(ServerException());
        //Act
        var res = await communityRepoIml.updatePost(post);
        //Assert
        expect(res,Left(ServerFailure()));
        verify(communityDataSourceMock.updatePost(post));
        verifyNoMoreInteractions(communityDataSourceMock);
      });
      test('Success',() async{
        //Arrange
        when(communityDataSourceMock.updatePost(post)).thenAnswer((_) async =>post);
        //Act
        var res = await communityRepoIml.updatePost(post);
        //Assert
        expect(res,right(post));
        verify(communityDataSourceMock.updatePost(post));
        verifyNoMoreInteractions(communityDataSourceMock);
      });
    });

    group('RemovePost ',(){
      test('Failure',() async{
        //Arrange
        when(communityDataSourceMock.removePost(post)).thenThrow(ServerException());
        //Act
        var res = await communityRepoIml.removePost(post);
        //Assert
        expect(res,Left(ServerFailure()));
        verify(communityDataSourceMock.removePost(post));
        verifyNoMoreInteractions(communityDataSourceMock);
      });
      test('Success',() async{
        //Arrange
        when(communityDataSourceMock.removePost(post)).thenAnswer((_) async =>post);
        //Act
        var res = await communityRepoIml.removePost(post);
        //Assert
        expect(res,right(post));
        verify(communityDataSourceMock.removePost(post));
        verifyNoMoreInteractions(communityDataSourceMock);
      });
    });
  });
}