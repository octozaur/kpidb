import 'package:flutter/material.dart';
import 'lists/teachers.dart';
import 'lists/classrooms.dart';
import '../data/customColors.dart';

class Home extends StatelessWidget{
  var teachers;
  var classrooms;
  final Function(int) ind;
  Home(this.ind, this.teachers, this.classrooms);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColors().bg),
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Teachers(teachers)));},
                child: Container(
                  height: 170.0,
                  margin: EdgeInsets.only(right: 15.0, top: 10.0, left: 15.0),
                  padding: EdgeInsets.only(top: 95.0, left: 35.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg5.png'),
                      fit: BoxFit.cover,
                    ),
                    gradient: LinearGradient(stops: [0.05, 0.9],begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [CustomColors().text4, CustomColors().text3,]),
                    //gradient: RadialGradient( focalRadius: 1, center: Alignment.topRight, focal: Alignment.bottomLeft, colors: [CustomColors().text3, CustomColors().text4]),
                    //color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors().shadow,
                        blurRadius: 10.0, // has the effect of softening the shadow
                        spreadRadius: 5.0, // has the effect of extending the shadow
                      )
                    ],
                  ),
                  child: Text("ОЦІНИТИ ВИКЛАДАЧІВ", style: TextStyle(fontSize: 24.0, color: CustomColors().text2, fontWeight: FontWeight.bold,)),
                ),
          ),
          InkWell(
            onTap: (){ind(1);},
            child: Container(
              height: 170.0,
              margin: EdgeInsets.only(right: 15.0, top: 10.0, left: 15.0),
              padding: EdgeInsets.only(top: 95.0, left: 35.0),
              decoration: BoxDecoration(
                //gradient: RadialGradient(focalRadius: 8, center: Alignment.topLeft, focal: Alignment.bottomLeft, colors: [Color(0xff6622ff), Colors.white]),
                image: DecorationImage(
                  image: AssetImage('assets/images/bg9.png'),
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
              child: Text("РОЗКЛАД", style: TextStyle(fontSize: 24.0, color: CustomColors().text2, fontWeight: FontWeight.bold,)),
            ),
          ),
          InkWell(
            onTap: (){ind(2);},
            child: Container(
              height: 170.0,
              margin: EdgeInsets.only(right: 15.0, top: 10.0, left: 15.0, bottom: 10.0),
              padding: EdgeInsets.only(top: 95.0, left: 35.0),
              decoration: BoxDecoration(
                //gradient: RadialGradient(focalRadius: 8, center: Alignment.topLeft, focal: Alignment.bottomRight, colors: [Color(0xff6622ff), Colors.white]),
                image: DecorationImage(
                  image: AssetImage('assets/images/bg8.png'),
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
              child: Text("ТОПИ", style: TextStyle(fontSize: 24.0, color: CustomColors().text2, fontWeight: FontWeight.bold,)),
            ),
          ),
        ],
      ),
    ) ;
  }
}