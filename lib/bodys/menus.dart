import 'package:flutter/material.dart';
import 'schedule.dart';
import 'home.dart';
import 'top.dart';
import 'groupControl.dart';
import '../materialParts/bottomWidget.dart';
import '../data/lesson.dart';
import '../data/teacher.dart';
import '../services/DatabaseService.dart';
import '../data/customColors.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
class Menus extends StatefulWidget {
  String group;
  Menus(this.group, this.fn);
  final void Function() fn;

  @override
  _Menus createState() => _Menus(this.group, this.fn);
}

class _Menus extends State<Menus> {
  String group;
  final void Function() fn;
  _Menus(this.group, this.fn);
  PageController _c;
  List<List<Lesson>> groupedLessons1 = new List<List<Lesson>>();
  List<List<Lesson>> groupedLessons2 = new List<List<Lesson>>();
  List<List<List<Lesson>>> exGroup = new List<List<List<Lesson>>>();
  List<Lesson> less;
  List<Teacher> teachers = new List<Teacher>();
  List<String> classrooms = new List<String>();
  var _page = 0;



  void ind(int ind){
    this._c.animateToPage(ind,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
    _page = ind;
    setState(() {

    });
  }

  Future fetch() async{
    if(less == null){
      var response = await http.get('https://api.rozklad.org.ua/v2/groups/${this.group}/lessons');
      if (response.statusCode == 200) {
        var sc = json.decode(response.body);
        var r = sc["data"] as List;
        less = r.map<Lesson>((json) => Lesson.fromJson(json)).toList();
        var firstDayName = less[0].dayName;
        List<Lesson> temp = new List<Lesson>();
        var t;
        for(var i = 0; i < less.length; i++){


          if(less[i].lessonWeek == "1"){

            if(less[i].dayName != firstDayName){
              firstDayName = less[i].dayName;
              groupedLessons1.add(temp);
              temp = new List<Lesson>();
              temp.clear();
            }

            if(less[i].dayName == firstDayName){
              temp.add(less[i]);
            }

            if(less[i+1].lessonWeek == "2"){
              firstDayName = less[i+1].dayName;
              groupedLessons1.add(temp);
              temp = new List<Lesson>();
              temp.clear();
            }
          }
          else if(less[i].lessonWeek == "2"){
            if(less[i].dayName != firstDayName){
              firstDayName = less[i].dayName;
              groupedLessons2.add(temp);
              temp = new List<Lesson>();
              temp.clear();
            }
            if(less[i].dayName == firstDayName){
              temp.add(less[i]);
            }
            if(i + 1 == less.length){
              groupedLessons2.add(temp);
              temp = new List<Lesson>();
              temp.clear();
            }
          }
        }
        exGroup.add(groupedLessons1);
        exGroup.add(groupedLessons2);
        return exGroup;
      }
      else {
        throw Exception('Failed to load post');
      }
    }
    return less;


  }

  Future fetchEx() async{
    var t = false;
    var rr;
    for(var e in exGroup){
      for(var ll in e){
        for(var l in ll){
          for(var cl in classrooms){
            if(cl == l.lessonRoom)
              t = true;
          }
          if(t != true){
            rr = await DatabaseService().kpidbCollection.collection("classrooms").document(l.lessonRoom).get();
            if(rr.data == null){
              await DatabaseService().kpidbCollection.collection("classrooms").document(l.lessonRoom).setData({
                "current_rating": "0",
                "ratings": [],
                "comments": [],
                "android_ids": [],
                "classroom_name": l.lessonRoom,
              });
            }
            classrooms.add(l.lessonRoom);
          }
          t = false;
        }
      }
    }
  }

  Future fetchTeacher() async{
    var response2 = await http.get('https://api.rozklad.org.ua/v2/groups/${this.group}/teachers');
    if (response2.statusCode == 200) {
      var sc = json.decode(response2.body);
      var r = sc["data"] as List;
      teachers = r.map<Teacher>((json) => Teacher.fromJson(json)).toList();
      var rr;
      for(var t in teachers){
               rr = await DatabaseService().kpidbCollection.collection("teachers").document("${t.teacherId}").get();
               if(rr.data == null){
                 await DatabaseService().kpidbCollection.collection("teachers").document("${t.teacherId}").setData({
                   "current_rating": "0",
                   "ratings": [],
                   "comments": [],
                   "android_ids": [],
                   "teacher_full_name": t.teacherFullName,
                   "teacher_name": t.teacherName,
                   "teacher_short_name": t.teacherShortName,
                   "teacher_id": t.teacherId,
                 });
               }
               else{
                 t.ratings = rr.data["ratings"];
                 t.comments = rr.data["comments"];
                 t.ids = rr.data["android_ids"];
                 if(rr.data["current_rating"] is double)
                   t.currentRating = double.parse(rr.data["current_rating"].toStringAsFixed(2));
                 else
                   t.currentRating = double.parse(rr.data["current_rating"].toString());
               }

              }

      }
  }


  List<Widget> bodys;
  var trr = false;
  @override
  void initState() {
    var d = fetch();
    d.then((a){ trr = true; fetchEx(); setState(() {

    });});
    var f = fetchTeacher();
    f.then((a){});
    _c = new PageController(
      initialPage: _page,
    );

    super.initState();
  }



  @override
  Widget build(BuildContext context){
      bodys = <Widget>[
        Home(ind, teachers, classrooms),
        Schedule(group, exGroup, teachers),
        Top(teachers, classrooms)
      ];
      return  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset('assets/images/logo_white.png'),
              ),
              centerTitle: true,
              backgroundColor: CustomColors().main,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: (){fn();},
                )
              ],
            ),
            body: new PageView(
              controller: _c,
              onPageChanged: (newPage){
                setState(() {
                  this._page = newPage;
                });
              },
              children: <Widget>[
                bodys[0],
                if(trr == true)
                  bodys[1],
                if(trr == false)
                  Container(),
                bodys[2],
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _page,
              onTap: (index) {
                this._c.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
                _page = index;

              },
              type: BottomNavigationBarType.fixed,
              iconSize: 32.0,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              selectedItemColor: CustomColors().text1,
              unselectedItemColor: Colors.blueGrey[700],
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 36.0),
                    title: Text("home")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today),
                    title: Text("ddd")
                ),
                //BottomNavigationBarItem(
                //    icon: Icon(Icons.insert_emoticon),
                //    title: Text("ddd")
                //),
                BottomNavigationBarItem(
                    icon: Icon(Icons.equalizer),
                    title: Text("ddd")
                )
              ],
            )
        ),
      );
  }
}
