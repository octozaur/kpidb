import 'package:flutter/material.dart';
import 'package:kpidb/data/customColors.dart';
import 'package:kpidb/data/lesson.dart';
import '../../data/lesson.dart';

class ClassInterval extends StatelessWidget{
  Lesson lesson;
  ClassInterval(this.lesson);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: CustomColors().text3,
                      width: 3.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(50.0)
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
              child: Text("${lesson.lessonNumber}: ${lesson.timeStart.substring(0, 5)} - ${lesson.timeEnd.substring(0, 5)}", style: TextStyle(fontSize: 15.0, color: CustomColors().text3, fontWeight: FontWeight.bold),),
            ),
          ],
        )
      ],
    );
  }
}