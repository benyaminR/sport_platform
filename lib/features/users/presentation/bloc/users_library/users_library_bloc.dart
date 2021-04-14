import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sport_platform/features/users/domain/usecase/has_purchased_course.dart';
import 'package:sport_platform/utils/usecases/params.dart';

part 'users_library_event.dart';

part 'users_library_state.dart';

@singleton
class UsersLibraryBloc extends Bloc<UsersLibraryEvent, UsersLibraryState> {
  final HasPurchasedCourse hasPurchasedCourse;


  UsersLibraryBloc({@required this.hasPurchasedCourse}) : super(new InitialUsersLibraryState());
  static const HAS_PURCHASED_COURSE_ERROR = 'Failed To Get Course Ownership Status!';

  @override
  Stream<UsersLibraryState> mapEventToState(UsersLibraryEvent event) async* {
    if(event is HasPurchasedCourseEvent){
      yield LoadingUsersLibraryState();
      var hasPurchased = await hasPurchasedCourse(WithParams(param:event.courseID));
      yield hasPurchased.fold(
              (l) => ErrorUsersLibraryState(msg: HAS_PURCHASED_COURSE_ERROR),
              (r) => HasPurchasedCourseState(hasPurchased: r)
      );
    }
  }
}
