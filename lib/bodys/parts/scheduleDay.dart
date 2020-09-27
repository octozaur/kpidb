import 'package:flutter/material.dart';
import 'package:kpidb/bodys/parts/classInterval.dart';

import 'wholeDay.dart';
import '../../data/lesson.dart';

class ScheduleDay extends StatefulWidget {
  Lesson lesson;
  ScheduleDay(this.lesson);
  @override
  _ScheduleDay createState() => _ScheduleDay(this.lesson);
}

class _ScheduleDay extends State<ScheduleDay> {

  Lesson lesson;
  _ScheduleDay(this.lesson);

  @override
  Widget build(BuildContext context) {
    return null;

    //return Container(
    //  child: WholeDay(lesson),
    //);
  }
}