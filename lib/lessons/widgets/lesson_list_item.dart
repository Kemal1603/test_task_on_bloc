import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task_bloc/lessons/model/lesson.dart';



class LessonListItem extends StatelessWidget {
  const LessonListItem({Key? key, required this.lesson}) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: 335,
          height: 101,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: lesson.name.contains('English')
                  ? const AssetImage("assets/images/englishClassesBackground.png")
                  : const AssetImage("assets/images/regularClassesBackground.png"),
              fit: lesson.name.contains('English') ? BoxFit.contain : BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 18,
          left: 43,
          child: Text(
            lesson.name,
          ),
        ),
        Positioned(
          left: 43,
          top: 53,
          child: Container(
            decoration: BoxDecoration(
              color: lesson.status.contains('completed')
                  ? const Color(0xFF7EC67F)
                  : lesson.status.contains('notStarted')
                  ? const Color(0xFF717FEF)
                  : const Color(0xFFFF7A58),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 4,
                right: 12.75,
                bottom: 6,
                left: 10.25,
              ),
              child: Text(
                lesson.status.contains('inProgress')
                    ? 'In Progress'
                    : lesson.name.contains('notStarted')
                    ? 'Start'
                    : 'Completed',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
          top: 83,
          bottom: 6,
          left: 43,
          child: Text(
            'Last update: ${DateFormat("dd.MM.yyyy").format(
              DateTime.fromMillisecondsSinceEpoch(
                lesson.updateAt * 1000,
              ),
            )}',
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ),
        if(lesson.status != 'completed')
          Positioned(
            top: 35,
            right: 42.74,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.97),
                borderRadius: BorderRadius.circular(37),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 12.42,
                  right: 11.27,
                  bottom: 11.87,
                  left: 13.02,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          )
      ],
    );
  }
}