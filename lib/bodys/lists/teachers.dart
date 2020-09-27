import 'package:flutter/material.dart';
import 'package:kpidb/bodys/lists/teachersTeacher.dart';
import '../../data/customColors.dart';

class Teachers extends StatelessWidget{
  var teachers;
  double rating = 0;
  Teachers(this.teachers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Image.asset('assets/images/logo_white.png'),
          ),
          centerTitle: true,
          backgroundColor: CustomColors().main,
        ),
      body: ListView(
        children: <Widget>[
          ...teachers.map((a){rating = a.currentRating; var t = a.teacherShortName; if(a.teacherShortName == "") t = a.teacherName; return InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TeachersTeacher(a)));},
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors().shadow,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text("$t", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0, color: CustomColors().main), textAlign: TextAlign.left,),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(

                            child: Text("$rating", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                        ),
                        Container(
                            width: 30.0,
                            child: IconButton(
                              icon: Icon(rating >= 1 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                            )
                        ),
                        Container(
                            width: 30.0,
                            child: IconButton(
                              icon: Icon(rating >= 2 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                            )
                        ),
                        Container(
                            width: 30.0,
                            child: IconButton(
                              icon: Icon(rating >= 3 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                            )
                        ),
                        Container(
                            width: 30.0,
                            child: IconButton(
                              icon: Icon(rating >= 4 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                            )
                        ),
                        Container(
                            width: 30.0,
                            child: IconButton(
                              icon: Icon(rating >= 5 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );}),
        ],
      )
    );
  }
}