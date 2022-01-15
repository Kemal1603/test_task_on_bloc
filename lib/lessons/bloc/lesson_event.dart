part of 'lesson_bloc.dart';

abstract class LessonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LessonFetched extends LessonEvent {
  final String query;

  LessonFetched(this.query);
}