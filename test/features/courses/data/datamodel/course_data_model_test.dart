
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';

main() {
  final firestore = MockFirestoreInstance();

  group('CourseDataModel ', (){
    test('should convert data from Snapshot', () async{
      //arrange
      await firestore.doc('courses/test_course').set({
        'date':DateTime.now().toString(),
        'title': 'Test Course',
        'comments': [
          {
            'username':'user1',
            'thumbnail':'thumb',
            'stars':3.6,
            'text':'a great course',
            'date': DateTime.now().toString(),
          },
          {
            'username':'user1',
            'thumbnail':'thumb',
            'stars':3.6,
            'text':'a great course',
            'date': DateTime.now().toString(),
          }
      ],
        'trainer': {
          'name':'miki',
          'thumbnail':'mikithumbn',
          'path':'path'
        },
        'description': 'descriptionnn',
        'content': [
          {
            'description':'content description',
            'videos':[
              {
                'thumbnail':'thumbnail',
                'creationDate':'creationDate',
                'source':'source',
                'viewCount':1200
              },
              {
                'thumbnail':'thumbnail',
                'creationDate':'creationDate',
                'source':'source',
                'viewCount':1200
              }
            ],
          },
          {
            'description':'content description',
            'videos':[
              {
                'thumbnail':'thumbnail',
                'creationDate':'creationDate',
                'source':'source',
                'viewCount':1200
              },
              {
                'thumbnail':'thumbnail',
                'creationDate':'creationDate',
                'source':'source',
                'viewCount':1200
              }
            ],
          }
        ],
        'students':[
          {
          'name':'name',
          'thumbnail':'thumbnail',
          'path':'path'
          }
        ] ,
        'category': 'Gym',
      });
      var docSnapshot = await firestore.doc('courses/test_course').get();
      //act
      var res = CourseDataModel.fromSnapshot(docSnapshot);
      //assert
      expect(res, isA<CourseDataModel>());
});
});
}