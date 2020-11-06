import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_platform/container.dart';
import 'package:sport_platform/features/courses/domain/enitity/comment.dart';
import 'package:sport_platform/features/courses/domain/enitity/content_section.dart';
import 'package:sport_platform/features/courses/domain/enitity/course.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_trainer.dart';
import 'package:sport_platform/features/courses/domain/enitity/course_user.dart';
import 'package:sport_platform/features/courses/domain/enitity/video.dart';
import 'package:sport_platform/features/courses/domain/usecase/add_course_use_case.dart';
import 'package:sport_platform/utils/usecases/params.dart';

Future<void> generate() async{
  final firestore = getIt<FirebaseFirestore>();
  final addUsecase = getIt<AddCourseUseCase>();
  //delete
  if((await firestore.collection('Courses').get()).size > 0) return;
  var data = Course(
    comments: [
      Comment(username: 'Micheal', thumbnail: 'Users/face_00.jpg', stars: 4.5, text: 'Ein toller Kurs', date: DateTime.now().toString()),
      Comment(username: 'Steve', thumbnail: 'Users/face_01.jpg', stars: 3.6, text: 'Empfohlen', date: DateTime.now().toString()),
      Comment(username: 'Sarah', thumbnail: 'Users/face_03.jpg', stars: 5, text: 'der beste Trainer evver', date: DateTime.now().toString()),
    ],
    path: '',
    students: [
      CourseUser(name: 'Micheal', thumbnail: 'Users/face_00.jpg', path: ''),
      CourseUser(name: 'Steve', thumbnail:'Users/face_01.jpg', path: ''),
      CourseUser(name: 'Jack', thumbnail: 'Users/face_02.jpg', path: ''),
      CourseUser(name: 'Melanie', thumbnail: 'Users/face_03.jpg', path: ''),
    ],
    content: [
      ContentSection(description: 'First Section', videos: [
        Video(thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg', viewCount: 300, source: 'Courses/FitnessClass/Canon C200 - Cinematic Fitness Short.mp4', creationDate: DateTime.now().toString()),
        Video(thumbnail: 'Courses/FitnessClass/fitness-fitnessstudio-kornwestheim-funsportzentrum-aktion-2020-herbst-slider-72cc2e30.jpeg', viewCount: 500, source: 'Courses/FitnessClass/fitness-fitnessstudio-kornwestheim-funsportzentrum-aktion-2020-herbst-slider-72cc2e30.jpeg', creationDate: DateTime.now().toString()),
      ]),
      ContentSection(description: 'First Section', videos: [
        Video(thumbnail: 'Courses/FitnessClass/1600x826-iStock-621570608-min-1600x570.jpg', viewCount: 300, source: 'Courses/FitnessClass/Canon C200 - Cinematic Fitness Short.mp4', creationDate: DateTime.now().toString()),
        Video(thumbnail: 'Courses/FitnessClass/fitness-fitnessstudio-kornwestheim-funsportzentrum-aktion-2020-herbst-slider-72cc2e30.jpeg', viewCount: 500, source: 'Courses/FitnessClass/fitness-fitnessstudio-kornwestheim-funsportzentrum-aktion-2020-herbst-slider-72cc2e30.jpeg', creationDate: DateTime.now().toString()),
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
  //add data
  await addUsecase(WithParams(param: data ));

  }
