import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'course_detail_view_tabs_event.dart';

part 'course_detail_view_tabs_state.dart';

@singleton
class CourseDetailViewTabsBloc
    extends Bloc<CourseDetailViewTabsEvent, CourseDetailViewTabsState> {

  CourseDetailViewTabsBloc() : super(InitCourseDetailViewTabState());

  @override
  Stream<CourseDetailViewTabsState> mapEventToState(
      CourseDetailViewTabsEvent event) async* {
    if(event is ContentTab)
      yield ContentTabState();
    if(event is DescriptionTab)
      yield DescriptionTabState();
    if(event is ReviewsTab)
      yield ReviewsTabState();
  }
}
