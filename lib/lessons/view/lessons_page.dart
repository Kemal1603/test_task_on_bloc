import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task_bloc/lessons/bloc/lesson_bloc.dart';

import 'lessons_list.dart';

class LessonsPage extends StatelessWidget {
const LessonsPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    },
    child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21.77,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 63.32,
              ),
              const Text(
                'My Classroom',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.23,
                      right: 15.5,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Group.svg',
                    ),
                  ),
                  SizedBox(
                    width: 261,
                    child: Theme(
                      data: ThemeData(
                        textSelectionTheme: const TextSelectionThemeData(
                          selectionColor: Colors.grey,
                          cursorColor: Colors.grey,
                          selectionHandleColor: Colors.grey,
                        ),
                      ),
                      child:  TextField(
                        onChanged: (query) {
                          /*query.isNotEmpty
                              ? context.read<LessonBloc>().add(LessonFetched(query))
                              : context.read<LessonBloc>().add(LessonFetched(''));*/
                          context.read<LessonBloc>().add(LessonFetched(query));
                        },
                        autocorrect: true,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 29,
              ),
               const Expanded(
                child: LessonsList(),
              ),
            ],
          ),
        ),
      ),
  );
}
}