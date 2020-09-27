import 'package:flutter/material.dart';

import 'classElement.dart';
import 'dayName.dart';
import '../../data/lesson.dart';
import 'rkeys.dart';

import 'test.dart';

class WholeDay extends StatelessWidget {
  List<Lesson> lessons;
  List<GlobalKey> keys;
  var teacher;
  WholeDay([this.lessons, this.keys, this.teacher]);

  GlobalKey f(){
    if(lessons[0].dayName == "Понеділок")
      return keys[0];
    if(lessons[0].dayName == "Вівторок")
      return keys[1];
    if(lessons[0].dayName == "Середа")
      return keys[2];
    if(lessons[0].dayName == "Четвер")
      return keys[3];
    if(lessons[0].dayName == "П'ятниця")
      return keys[4];
    if(lessons[0].dayName == "Субота")
      return keys[5];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32.0, 0, 30.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            key: keys[int.parse(lessons[0].dayNumber) - 1],
          ),
          DayName(lessons[0].dayName),
          ...lessons.map((a)=>ClassElement(a, teacher)),
        ],
      ),
    );
  }
}
