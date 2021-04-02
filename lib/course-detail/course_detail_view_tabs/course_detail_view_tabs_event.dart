part of 'course_detail_view_tabs_bloc.dart';

@immutable
abstract class CourseDetailViewTabsEvent extends Equatable {}


class ContentTab extends CourseDetailViewTabsEvent{
  @override
  List<Object> get props => [];

}

class DescriptionTab extends CourseDetailViewTabsEvent{
  @override
  List<Object> get props => [];
}

class ReviewsTab extends CourseDetailViewTabsEvent{
  @override
  List<Object> get props => [];
}