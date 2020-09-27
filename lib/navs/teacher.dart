import 'package:flutter/material.dart';
import '../services/DatabaseService.dart';
import 'teacherW.dart';
import 'comment.dart';
import '../data/customColors.dart';

import '../data/globals.dart' as globals;

class Teacher extends StatefulWidget {
  var teachers;
  var lesson;
  Teacher(this.teachers, this.lesson);

  @override
  _Teacher createState() => _Teacher(this.teachers, this.lesson);
}



class _Teacher extends State<Teacher> {
  var teachers;
  var lesson;
  var t;
  var comments;
  var len;
  var str;

  _Teacher(this.teachers, this.lesson);

  var isCommented = false;
  Future deleteComment() async {

    var res = await DatabaseService().kpidbCollection.collection("teachers").document("${t.teacherId}").get();

      List<String> ids = new List<String>();
      List<String> str = new List<String>();
      List<double> dbl = new List<double>();
      int i = 0;
      int stop = 0;
      int k = 0;
      double sum = 0;
      for(var rr in res.data["android_ids"]){
        if(rr != globals.androidIndex){
          ids.add(rr);
        }
        else{
          stop = i;
          k = 1;
        }
        i++;
      }
      i = 0;
      for(var rr in res.data["comments"]){
        print(2);
        if(stop != i){
          str.add(rr);
        }
        i++;
      }
      i = 0;
    for(var rr in res.data["ratings"]){
      print(1);
      if(stop != i){
        dbl.add(rr);
        sum = sum + rr;
      }
      i++;
    }
    i = i - k;
      if(i>0)
        sum = sum / i;
      await DatabaseService().kpidbCollection.collection("teachers").document("${t.teacherId}").updateData({
        "ratings": dbl,
        "comments": str,
        "android_ids": ids,
        "current_rating": sum,
      });
      isCommented = false;
      fetchTeacher();
  }

  Future fetchTeacher() async{
    var teacherDB = await DatabaseService().kpidbCollection.collection("teachers").document("${t.teacherId}").get();
    print(teacherDB.data["current_rating"]);
    t.ratings = teacherDB.data["ratings"];
    t.comments = teacherDB.data["comments"];
    t.ids = teacherDB.data["android_ids"];
    for(var tt in t.ids){
      if(tt == globals.androidIndex)
        isCommented = true;
    }
    if(teacherDB.data["current_rating"] is double)
      t.currentRating = double.parse(teacherDB.data["current_rating"].toStringAsFixed(2));
    else
      t.currentRating = double.parse(teacherDB.data["current_rating"].toString());
    int i = 0;
    t.commentsRatings = <double, String>{};
    t.ratings = t.ratings.reversed.toList();
    len = i;
    setState(() {
    });
    }

  @override
  void initState() {
    super.initState();
    for(var techr in teachers){
      if(techr.teacherShortName == lesson.teacherName){
        t = techr;
      }
    }
    if(t == null)
      Navigator.pop(context);
      fetchTeacher();
    print("opp");

  }

  @override
  Widget build(BuildContext context) {
    int i = -1;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset('assets/images/logo_white.png'),
        ),
        centerTitle: true,
        backgroundColor: CustomColors().main,
      ),
      body: Container(
        color: CustomColors().bg,
        child: SizedBox.expand(
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    margin: const EdgeInsets.fromLTRB(0, 60.0, 0, 20.0),
                    padding: const EdgeInsets.fromLTRB(0, 23.0, 0, 23.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                      color: CustomColors().text5,
                    ),
                    child: Text("${t.teacherName[0].toUpperCase()}", style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: CustomColors().text4), textAlign: TextAlign.center),
                  ),
                  Container(
                    child: Text("${t.teacherName}", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87)),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                    child: InkWell(
                      onTap: (){if(isCommented == false) Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return TeacherW(t.teacherId);
                          })).then((value){fetchTeacher();});},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(

                              child: Text("${t.currentRating}", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                          ),
                          Container(
                              width: 30.0,
                              child: IconButton(
                                icon: Icon(t.currentRating >= 1 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                              )
                          ),
                          Container(
                              width: 30.0,
                              child: IconButton(
                                icon: Icon(t.currentRating >= 2 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                              )
                          ),
                          Container(
                              width: 30.0,
                              child: IconButton(
                                icon: Icon(t.currentRating >= 3 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                              )
                          ),
                          Container(
                              width: 30.0,
                              child: IconButton(
                                icon: Icon(t.currentRating >= 4 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                              )
                          ),
                          Container(
                              width: 30.0,
                              child: IconButton(
                                icon: Icon(t.currentRating >= 5 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                              )
                          ),
                        ],
                      ),
                    )
                  ),
                  if(isCommented == false)
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: FlatButton(
                        //onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherW()));},
                        onPressed: (){Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return TeacherW(t.teacherId);
                            })).then((value){fetchTeacher();});},
                        color: CustomColors().text3,
                        textColor: CustomColors().text2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Text("Оцінити викладача", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: CustomColors().text2),),
                      ),
                    ),
                  if(isCommented == true)
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: FlatButton(
                        //onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherW()));},
                        onPressed: (){deleteComment().then((a){setState(() {
                        });});},
                        color: CustomColors().accent,
                        textColor: CustomColors().text2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Text("Видалити коментар", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: CustomColors().text2),),
                      ),
                    ),
                  if(t.comments != null)
                    ...t.comments.reversed.map((a){i++; i = i; return Comment(t.ratings[i], a);}),
                  Container(
                    margin: EdgeInsets.only(top: 35.0),
                  )

                ],
              ),
            ],
          )
        )
      ),
    );
  }
}