import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_media_data_model.dart';
import 'package:sport_platform/features/chat/data/datamodel/chat_message_data_model.dart';
import 'package:sport_platform/features/chat/data/datasource/chat_data_source.dart';
import 'package:sport_platform/features/chat/data/repository/chat_repo_impl.dart';
import 'package:sport_platform/utils/criteria.dart';
import 'package:sport_platform/utils/error/exception.dart';
import 'package:sport_platform/utils/error/failure.dart';

class ChatDataSourceMock extends Mock implements ChatDataSource{}

main() {


  final dataSource = ChatDataSourceMock();
  final repo = ChatRepoImpl(dataSource: dataSource);
  final testMessage = ChatMessageDataModel(
      sentDate: 'sentDate',
      sender: 'me',
      receiver: 'you',
      receivedDate: 'receivedDate',
      mediaData: ChatMediaDataModel(
          mediaType: 'photo',
          source: 'source',
      ),
      text: 'sup!');

  final testConversations = [testMessage];

  final criteria = Criteria(field: null, data: null);



  group('ChatRepoImpl ', ()
  {
    group('add ', () {
      test('should handle Failure ', () async {
        //arrange
        when(dataSource.sendMessage(testMessage)).thenThrow(ServerException());
        //act
        final res = await repo.sendMessage(testMessage);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.sendMessage(testMessage));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async {
        //arrange
        when(dataSource.sendMessage(testMessage)).thenAnswer((_) async => testMessage);
        //act
        final res = await repo.sendMessage(testMessage);
        //asses
        expect(res, Right(testMessage));
        verify(dataSource.sendMessage(testMessage));
        verifyNoMoreInteractions(dataSource);
      });
    });

    group('update ', () {
      test('should handle Failure ', () async {
        //arrange
        when(dataSource.updateMessage(testMessage)).thenThrow(ServerException());
        //act
        final res = await repo.updateMessage(testMessage);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.updateMessage(testMessage));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async {
        //arrange
        when(dataSource.updateMessage(testMessage)).thenAnswer((_) async => testMessage);
        //act
        final res = await repo.updateMessage(testMessage);
        //asses
        expect(res, Right(testMessage));
        verify(dataSource.updateMessage(testMessage));
        verifyNoMoreInteractions(dataSource);
      });
    });

    group('get ', () {
      test('should handle Failure ', () async {
        //arrange
        when(dataSource.getChats(criteria)).thenThrow(ServerException());
        //act
        final res = await repo.getChats(criteria);
        //asses
        expect(res, Left(ServerFailure()));
        verify(dataSource.getChats(criteria));
        verifyNoMoreInteractions(dataSource);
      });

      test('should handle success', () async {
        //arrange
        when(dataSource.getChats(criteria)).thenAnswer((_) async => testConversations);
        //act
        final res = await repo.getChats(criteria);
        //asses
        expect(res, Right(testConversations));
        verify(dataSource.getChats(criteria));
        verifyNoMoreInteractions(dataSource);
      });
    });
  });


}