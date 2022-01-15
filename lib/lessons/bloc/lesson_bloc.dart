import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:test_task_bloc/lessons/model/lesson.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';


class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(const LessonState()) {
    on<LessonFetched>(_onLessonFetched);
  }


  Future<List<Lesson>> _fetchLessons() async {
    final String response = await rootBundle.loadString('assets/json/data.json');
    final body = json.decode(response) as List;
    return body.map((dynamic json) {
      return Lesson(
        id: json['id'] as int,
        name: json['name'] as String,
        status: json['status'] as String,
        type: json['type'] as String,
        updateAt: json['updateAt'] as int,
      );
    }).toList();
  }

  Future<void> _onLessonFetched(LessonFetched event, Emitter<LessonState> emit) async {

    try {
      Future.delayed(const Duration(seconds: 2));
      if (state.status == LessonStatus.initial && event.query.isEmpty) {
        final lessons = await _fetchLessons();
        return emit(state.copyWith(
          status: LessonStatus.success,
          lessons: lessons,
        ));
      }

      final lessons = await _fetchLessons();
      if(lessons.isEmpty) {
        emit(state.copyWith(
            status: LessonStatus.success,
            lessons: List.of(state.lessons)..addAll(lessons)
        ));
      }
      if(event.query.isNotEmpty && lessons.isNotEmpty){

        List<Lesson> _dummySearchList = [];
        _dummySearchList.addAll(lessons);
        if (event.query.isNotEmpty) {
          List<Lesson> _dummyListData = [];
          for (var item in _dummySearchList) {
            if (item.name.toLowerCase().contains(event.query.toLowerCase())) {
              _dummyListData.add(item);
            }
          }
          lessons.clear();
          lessons.addAll(_dummyListData);
          emit(state.copyWith(
            status: LessonStatus.onSearch,
            lessons: lessons,
          ));
        }
      }
      if (state.status == LessonStatus.onSearch && event.query.isEmpty){
        final lessons = await _fetchLessons();
        return emit(state.copyWith(
          status: LessonStatus.success,
          lessons: lessons,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: LessonStatus.failure));
    }
  }
}