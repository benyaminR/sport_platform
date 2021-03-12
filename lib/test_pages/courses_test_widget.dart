import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_platform/features/courses/data/datamodel/course_data_model.dart';
import 'package:sport_platform/features/courses/domain/enitity/comment.dart';
import 'package:sport_platform/features/courses/domain/enitity/content_section.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_trainer.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_user.dart';
import 'package:sport_platform/features/courses/domain/enitity/video.dart';
import 'package:sport_platform/features/courses/presentation/bloc/courses/courses_bloc.dart';

import '../container.dart';


class CoursesTestWidget extends StatelessWidget {

  var course = Course(
    thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg',
    comments: [
      Comment(username: 'Micheal', thumbnail: 'Users/face_00.jpg', stars: 4.5, text: 'Ein toller Kurs', date: DateTime.now().toString()),
    ],
    path: '',
    students: [
      CourseUser(name: 'Micheal', thumbnail: 'Users/face_00.jpg', path: ''),
    ],
    content: [
      ContentSection(description: 'First Section', videos: [
        Video(thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg', viewCount: 300, source: 'Courses/FitnessClass/Canon C200 - Cinematic Fitness Short.mp4', creationDate: DateTime.now().toString()),
      ]),
    ],
    trainer: CourseTrainer(
      path: '',
      thumbnail: 'Trainers/face_01.jpg',
      name: 'Ricardo The Trainer',
    ),
    title: 'Fitness Class',
    date: DateTime.now().toString() ,
    category: 'Fitness',
    description: 'Bei diesem knackigen Workout werden deine Bauchmuskeln ABSolutely in Bestform gebracht!  Hier trainierst du nicht nur deine geraden und schrägen Bauchmuskeln, sondern stabilisierst deinen gesamten Rumpf. Denk dran: Du brauchst deine Bauchmuskulatur bei fast jeder Körperbewegung, sie unterstützt benachbarte Muskeln bei der Atmung und entlastet deine Wirbelsäule - und nebenbei sieht ein trainierter Bauch auch noch verdammt gut aus!',
  );

  var updateCourse = Course(
    thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg',
    comments: [
      Comment(username: 'Micheal', thumbnail: 'Users/face_00.jpg', stars: 4.5, text: 'Ein toller Kurs', date: DateTime.now().toString()),
    ],
    path: '',
    students: [
      CourseUser(name: 'Micheal', thumbnail: 'Users/face_00.jpg', path: ''),
    ],
    content: [
      ContentSection(description: 'First Section', videos: [
        Video(thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg', viewCount: 300, source: 'Courses/FitnessClass/Canon C200 - Cinematic Fitness Short.mp4', creationDate: DateTime.now().toString()),
      ]),
      ContentSection(description: 'First Section', videos: [
        Video(thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg', viewCount: 300, source: 'Courses/FitnessClass/Canon C200 - Cinematic Fitness Short.mp4', creationDate: DateTime.now().toString()),
      ]),
    ],
    trainer: CourseTrainer(
      path: '',
      thumbnail: 'Trainers/face_01.jpg',
      name: 'Ricardo The Trainer',
    ),
    title: 'Fitness Class',
    date: DateTime.now().toString() ,
    category: 'Fitness',
    description: 'UPDATED',
  );
  var path = '';
  List<Course> courses = [];
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height-100,
              child: Center(
                child: BlocProvider.value(
                  value: getIt<CoursesBloc>(),
                  child: BlocBuilder<CoursesBloc,CoursesState>(
                    builder: (context, state){
                      index = 0;
                      if(state is LoadingCoursesState)
                        return CircularProgressIndicator();
                      if(state is ErrorCoursesState)
                        return Text(state.msg);
                      if(state is LoadedCoursesState) {
                        courses = state.courses;
                        return SingleChildScrollView(child: Text(state.courses.map((e) => '${index++}'+CourseDataModel.toMap(e).toString() + '\n -----------------------------------\n').toString()));
                      }
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
                    onPressed:()=> getIt<CoursesBloc>().add(AddCoursesEvent(course:course)),
                    child: Text('Add')
                ),
                FlatButton(
                    onPressed:()=> getIt<CoursesBloc>().add(GetCoursesEvent(criteriaData: null)),
                    child: Text('Get')
                ),
                FlatButton(
                    onPressed:(){
                      var updateCourse = Course(
                        thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg',
                        comments: [
                          Comment(username: 'Micheal', thumbnail: 'Users/face_00.jpg', stars: 4.5, text: 'Ein toller Kurs', date: DateTime.now().toString()),
                        ],
                        path: courses[0].path,
                        students: [
                          CourseUser(name: 'Micheal', thumbnail: 'Users/face_00.jpg', path: ''),
                        ],
                        content: [
                          ContentSection(description: 'First Section', videos: [
                            Video(thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg', viewCount: 300, source: 'Courses/FitnessClass/Canon C200 - Cinematic Fitness Short.mp4', creationDate: DateTime.now().toString()),
                          ]),
                          ContentSection(description: 'First Section', videos: [
                            Video(thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg', viewCount: 300, source: 'Courses/FitnessClass/Canon C200 - Cinematic Fitness Short.mp4', creationDate: DateTime.now().toString()),
                          ]),
                        ],
                        trainer: CourseTrainer(
                          path: '',
                          thumbnail: 'Trainers/face_01.jpg',
                          name: 'Ricardo The Trainer',
                        ),
                        title: 'Fitness Class',
                        date: DateTime.now().toString() ,
                        category: 'Fitness',
                        description: 'UPDATED',
                      );
                      getIt<CoursesBloc>().add(UpdateCoursesEvent(course: updateCourse));
                    },
                    child: Text('Update')
                ),
                FlatButton(
                    onPressed:()=> getIt<CoursesBloc>().add(DeleteCoursesEvent(path: courses[0].path)),
                    child: Text('Delete')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
