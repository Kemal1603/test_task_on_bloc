part of 'lesson_bloc.dart';


enum LessonStatus { initial, success, failure, onSearch }

class LessonState extends Equatable {
  const LessonState({
    this.status = LessonStatus.initial,
    this.lessons = const <Lesson>[],
  });

  final LessonStatus status;
  final List<Lesson> lessons;


  LessonState copyWith({
    LessonStatus? status,
    List<Lesson>? lessons,
  }) {
    return LessonState(
      status: status ?? this.status,
      lessons: lessons ?? this.lessons,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status,  lessons: ${lessons.length} }''';
  }

  @override
  List<Object> get props => [status, lessons];
}