import 'package:flutter/material.dart';
import 'package:kpidb/bodys/lists/TopClassrooms.dart';
import 'package:kpidb/bodys/lists/topTeachers.dart';
import 'lists/teachers.dart';
import 'lists/classrooms.dart';
import '../data/customColors.dart';

class Top extends StatelessWidget{
  var teachers;
  var classrooms;
  Top(this.teachers, this.classrooms);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColors().bg),
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TopTeachers()));},
            child: Container(
              height: 250.0,
              margin: EdgeInsets.only(right: 15.0, top: 10.0, left: 15.0),
              padding: EdgeInsets.only(top: 155.0, left: 35.0),
              decoration: BoxDecoration(
                //gradient: RadialGradient( focalRadius: 8, center: Alignment.bottomLeft, focal: Alignment.bottomLeft, colors: [Color(0xff6622ff), Colors.white]),
                image: DecorationImage(
                  image: AssetImage('assets/images/bg12.png'),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors().shadow,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                  )
                ],
              ),
              child: Text("ТОП ВИКЛАДАЧІВ", style: TextStyle(fontSize: 24.0, color: CustomColors().text2, fontWeight: FontWeight.bold,)),
            ),
          ),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TopClassrooms()));},
            child: Container(
              height: 250.0,
              margin: EdgeInsets.only(right: 15.0, top: 10.0, left: 15.0),
              padding: EdgeInsets.only(top: 155.0, left: 35.0),
              decoration: BoxDecoration(
                //gradient: RadialGradient(focalRadius: 8, center: Alignment.topLeft, focal: Alignment.bottomLeft, colors: [Color(0xff6622ff), Colors.white]),
                image: DecorationImage(
                  image: AssetImage('assets/images/bg13.png'),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors().shadow,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                  )
                ],
              ),
              child: Text("ТОП АУДИТОРІЙ", style: TextStyle(fontSize: 24.0, color: CustomColors().text2, fontWeight: FontWeight.bold,)),
            ),
          ),
        ],
      ),
    ) ;
  }
}