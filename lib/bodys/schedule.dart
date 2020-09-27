import 'package:flutter/material.dart';

import 'package:kpidb/bodys/parts/wholeDay.dart';

import '../data/lesson.dart';
import '../data/lessons.dart';
import 'parts/upButton.dart';
import 'parts/weekButton.dart';
import 'parts/rkeys.dart';

import 'dart:async';
import 'dart:convert';
import 'groupControl.dart';
import '../data/customColors.dart';

import '../services/DatabaseService.dart';


class Schedule extends StatefulWidget {
  String body;
  var exGroup;
  var teacher;
  Schedule(this.body, this.exGroup, this.teacher);

  @override
  _Schedule createState() => _Schedule(body, exGroup, teacher);
}

class _Schedule extends State<Schedule> {
  var teacher;
  _Schedule(this.group, this.exGroup, this.teacher){
    keys = [
      dataKey1,
      dataKey2,
      dataKey3,
      dataKey4,
      dataKey5,
      dataKey6
    ];
  }

  final GlobalKey dataKey1 = new GlobalKey();
  final GlobalKey dataKey2 = new GlobalKey();
  final GlobalKey dataKey3 = new GlobalKey();
  final GlobalKey dataKey4 = new GlobalKey();
  final GlobalKey dataKey5 = new GlobalKey();
  final GlobalKey dataKey6 = new GlobalKey();
  Future<List<Lesson>> lessons;

  var exGroup;
  bool isFirst = true;
  bool cost = true;
  int indexList = 0;

  List<GlobalKey> keys;
  String week = "ПЕРШИЙ ТИЖДЕНЬ";
  String group;

  void weekCh(){
    if(isFirst == true)
    {
      isFirst = false;
      indexList = 1;
      week = "ДРУГИЙ ТИЖДЕНЬ";
    }
    else if(isFirst == false){
      isFirst = true;
      indexList = 0;
      week = "ПЕРШИЙ ТИЖДЕНЬ";
    }
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                decoration: BoxDecoration(color: CustomColors().bg),
                child: Stack(

                  children: <Widget>[

                    Container(
                      margin: const EdgeInsets.fromLTRB(30.0, 0, 10.0, 0),
                      child: VerticalDivider(
                        width: 20.0,
                        color: CustomColors().text1,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
                      child: ListView(
                        children: <Widget>[
                            ...exGroup[indexList].map((a)=>WholeDay(a, keys, teacher)),
                        ],
                      ),
                    ),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors().shadow,
                            blurRadius: 10.0, // has the effect of softening the shadow
                            spreadRadius: 5.0, // has the effect of extending the shadow
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[
                          InkWell(
                            onTap: (){ weekCh();},
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(20.0, 0, 3.0, 0),
                              padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                              height: 35.0,
                              width: MediaQuery.of(context).size.width*0.22,
                              decoration: BoxDecoration(
                                color: CustomColors().bg,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50.0)
                                ),
                              ),
                              child: Text(
                                week, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12.0, color: CustomColors().main, height: 1.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text("Зараз: Перший тиждень", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: CustomColors().main),),
                          )
                          //InkWell(
                          //                            onTap: ()=> Scrollable.ensureVisible(keys[0].currentContext),
                          //                            child: Container(
                          //                              margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
                          //                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          //                              height: 35.0,
                          //                              width: MediaQuery.of(context).size.width*0.115,
                          //                              decoration: BoxDecoration(
                          //                                color: CustomColors().bg,
                          //                                borderRadius: BorderRadius.all(
                          //                                    Radius.circular(50.0)
                          //                                ),
                          //                              ),
                          //                              child: Text(
                          //                                "ПН", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: CustomColors().main, height: 1.0),
                          //                                textAlign: TextAlign.center,
                          //                              ),
                          //                            ),
                          //                          ),
                          //                          InkWell(
                          //                            onTap: ()=> Scrollable.ensureVisible(keys[1].currentContext),
                          //                            child: Container(
                          //                              margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
                          //                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          //                              height: 35.0,
                          //                              width: MediaQuery.of(context).size.width*0.115,
                          //                              decoration: BoxDecoration(
                          //                                color: CustomColors().bg,
                          //                                borderRadius: BorderRadius.all(
                          //                                    Radius.circular(50.0)
                          //                                ),
                          //                              ),
                          //                              child: Text(
                          //                                "ВТ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: CustomColors().main, height: 1.0),
                          //                                textAlign: TextAlign.center,
                          //                              ),
                          //                            ),
                          //                          ),
                          //                          InkWell(
                          //                            onTap: ()=> Scrollable.ensureVisible(keys[2].currentContext),
                          //                            child: Container(
                          //                              margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
                          //                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          //                              height: 35.0,
                          //                              width: MediaQuery.of(context).size.width*0.115,
                          //                              decoration: BoxDecoration(
                          //                                color: CustomColors().bg,
                          //                                borderRadius: BorderRadius.all(
                          //                                    Radius.circular(50.0)
                          //                                ),
                          //                              ),
                          //                              child: Text(
                          //                                "СР", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: CustomColors().main, height: 1.0),
                          //                                textAlign: TextAlign.center,
                          //                              ),
                          //                            ),
                          //                          ),
                          //                          InkWell(
                          //                            //onTap: ()=> Scrollable.ensureVisible(keys[3].currentContext),
                          //                            onTap: (){DatabaseService().delete();},
                          //                            child: Container(
                          //                              margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
                          //                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          //                              height: 35.0,
                          //                              width: MediaQuery.of(context).size.width*0.115,
                          //                              decoration: BoxDecoration(
                          //                                color: CustomColors().bg,
                          //                                borderRadius: BorderRadius.all(
                          //                                    Radius.circular(50.0)
                          //                                ),
                          //                              ),
                          //                              child: Text(
                          //                                "ЧТ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: CustomColors().main, height: 1.0),
                          //                                textAlign: TextAlign.center,
                          //                              ),
                          //                            ),
                          //                          ),
                          //                          InkWell(
                          //                            //onTap: ()=> Scrollable.ensureVisible(keys[4].currentContext),
                          //                            //onTap: (){print(DatabaseService().fetch());},
                          //                            child: Container(
                          //                              margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
                          //                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          //                              height: 35.0,
                          //                              width: MediaQuery.of(context).size.width*0.115,
                          //                              decoration: BoxDecoration(
                          //                                color: CustomColors().bg,
                          //                                borderRadius: BorderRadius.all(
                          //                                    Radius.circular(50.0)
                          //                                ),
                          //                              ),
                          //                              child: Text(
                          //                                "ПТ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: CustomColors().main, height: 1.0),
                          //                                textAlign: TextAlign.center,
                          //                              ),
                          //                            ),
                          //                          ),
                          //                          InkWell(
                          //                            //onTap: ()=> Scrollable.ensureVisible(keys[5].currentContext),
                          //                            onTap: (){DatabaseService().updateProfessors(21131, "Nananame", "Newesame", [4,6,7], ["dfdfm", "sfwed"], 5.6);},
                          //                            child: Container(
                          //                              margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
                          //                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          //                              height: 35.0,
                          //                              width: MediaQuery.of(context).size.width*0.115,
                          //                              decoration: BoxDecoration(
                          //                                color: CustomColors().bg,
                          //                                borderRadius: BorderRadius.all(
                          //                                    Radius.circular(50.0)
                          //                                ),
                          //                              ),
                          //                              child: Text(
                          //                                "СБ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: CustomColors().main, height: 1.0),
                          //                                textAlign: TextAlign.center,
                          //                              ),
                          //                            ),
                          //                          ),
                        ],
                      ),
                    ),

                  ],
                )
            )
    );
  }
}