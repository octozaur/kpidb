import 'package:flutter/material.dart';
import 'classroomW.dart';
import '../services/DatabaseService.dart';
import 'comment.dart';


import '../data/globals.dart' as globals;
import '../data/customColors.dart';

class Classroom extends StatefulWidget {
  var lessonRoom = "";
  Classroom(this.lessonRoom);

  @override
  _Classroom createState() => _Classroom(lessonRoom);
}

class _Classroom extends State<Classroom> {
  var comments;
  var ids;
  var ratings;
  var currentRating = 0.0;
  var lessonRoom = "";

  _Classroom(this.lessonRoom);

  var isCommented = false;
  Future deleteComment() async {
    var res = await DatabaseService().kpidbCollection.collection("classrooms").document("$lessonRoom").get();
    List<String> ids = new List<String>();
    List<String> str = new List<String>();
    List<double> dbl = new List<double>();
    int i = 0;
    double sum = 0;
    for(var rr in res["android_ids"]){
      if(rr != globals.androidIndex){
        ids.add(rr);
        str.add(res["coments"][i]);
        dbl.add(res["ratings"][i]);
        sum = sum + res["ratings"][i];
      }
      i++;
      print("$rr sssssssssssssssss");
    }
    if(i>0)
      sum = sum / i;
    await DatabaseService().kpidbCollection.collection("classrooms").document("$lessonRoom").updateData({
      "ratings": dbl,
      "comments": str,
      "android_ids": ids,
      "current_rating": sum,
    });
    isCommented = false;
    fetchTeacher();
  }


  Future fetchTeacher() async{
    var classroomDB = await DatabaseService().kpidbCollection.collection("classrooms").document("$lessonRoom").get();
    comments = classroomDB.data["comments"].reversed.toList();
    ratings = classroomDB.data["ratings"].reversed.toList();
    ids = classroomDB.data["android_ids"].reversed.toList();
    for(var tt in ids){
      if(tt == globals.androidIndex)
        isCommented = true;
    }
    if(classroomDB.data["current_rating"] is double)
      currentRating = double.parse(classroomDB.data["current_rating"].toStringAsFixed(2));
    else
      currentRating = double.parse(classroomDB.data["current_rating"].toString());

    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
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
                        margin: const EdgeInsets.fromLTRB(0, 60.0, 0, 20.0),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: CustomColors().text1,
                        ),
                        child: Text("$lessonRoom", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: CustomColors().text2), textAlign: TextAlign.center),
                      ),

                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                        child: InkWell(
                          onTap: (){if(isCommented == false)Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) {
                                return ClassroomW(lessonRoom);
                              })).then((value){fetchTeacher();});},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(

                                  child: Text("${currentRating}", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(currentRating >= 1 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                                  )
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(currentRating >= 2 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                                  )
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(currentRating >= 3 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                                  )
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(currentRating >= 4 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
                                  )
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(currentRating >= 5 ? Icons.star : Icons.star_border, color: CustomColors().star, size: 30.0,),
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
                                  return ClassroomW(lessonRoom);
                                })).then((value){fetchTeacher();});},
                            color: CustomColors().text3,
                            textColor: CustomColors().text2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            child: Text("Оцінити аудіторію", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: CustomColors().text2),),
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
                      if(comments != null)
                        ...comments.map((a){i++; return Comment(ratings[i], a);}),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      ),

                    ],
                  ),
                ],
              )
          )
      ),
    );
  }
}