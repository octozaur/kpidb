import 'package:flutter/material.dart';
import 'package:kpidb/data/customColors.dart';
import '../../data/lesson.dart';

import '../../navs/teacher.dart';
import '../../navs/subject.dart';
import '../../navs/classroom.dart';
import '../../data/lesson.dart';

class Class extends StatelessWidget{
  Lesson lesson;
  var teacher;
  Class(this.lesson, this.teacher);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(40.0, 25.0, 0, 25.0),
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(30.0)
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors().shadow,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
            )
          ],
        ),
        child:
            Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      //onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Subject()));},
                     child: Container(
                       width: MediaQuery.of(context).size.width - 100.0,
                       margin: const EdgeInsets.fromLTRB(0, 0, 0, 11.0),
                       child: Text(lesson.lessonName, style: TextStyle(fontSize: 19.0, color: CustomColors().main, fontWeight: FontWeight.bold)),
                     ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Teacher(teacher, lesson)));},
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                            child: Text(lesson.teacherName, style: TextStyle(fontSize: 14.0, color: CustomColors().text11),),
                          ),
                        ),
                        InkWell(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Classroom(lesson.lessonRoom)));},
                          child: Container(
                            child: Text(lesson.lessonRoom+" "+lesson.lessonType, style: TextStyle(fontSize: 14.0, color: CustomColors().text11,),
                          ),
                        )
                        )
                      ],
                    )
                  ],
                )
              ],
            )
    );
  }
}