import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lessons/bloc/lesson_bloc.dart';
import 'lessons/view/lessons_page.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
          key: key,
          home: BlocProvider(
            create: (_) => LessonBloc()..add(LessonFetched('')),
            child: const LessonsPage(),
          ),
        );
}
