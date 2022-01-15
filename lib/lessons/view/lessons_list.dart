import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_bloc/lessons/bloc/lesson_bloc.dart';
import 'package:test_task_bloc/lessons/widgets/lesson_list_item.dart';




class LessonsList extends StatelessWidget {
  const LessonsList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
        builder: (context,state){
          switch (state.status) {
            case LessonStatus.failure:
              return const Center(child: Text('failed to fetch lessons'));
            case LessonStatus.success:
              if (state.lessons.isEmpty) {
                return const Center(child: Text('no lessons'));
              }
              return ListView.builder(
                itemCount: state.lessons.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 17),
                    child: LessonListItem(lesson: state.lessons[index]),
                  );
                },
              );
            case LessonStatus.onSearch:
              if (state.lessons.isEmpty) {
                return const Center(child: Text('no lessons'));
              }
              return ListView.builder(
                itemCount: state.lessons.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 17),
                    child: LessonListItem(lesson: state.lessons[index]),
                  );
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        });
  }
}