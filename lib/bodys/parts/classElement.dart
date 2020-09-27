import 'package:flutter/material.dart';
import 'classInterval.dart';
import 'class.dart';
import '../../data/lesson.dart';

class ClassElement extends StatelessWidget{
  Lesson lesson;
  var teacher;
  ClassElement(this.lesson, this.teacher);

  @override
  Widget build(BuildContext context) {
    return Column(
     children: <Widget>[
       ClassInterval(lesson),
       Class(lesson, teacher)
     ],
    );
  }
}