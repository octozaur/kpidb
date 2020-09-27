import 'package:flutter/material.dart';
import 'teacherW.dart';

class Subject extends StatefulWidget {

  @override
  _Subject createState() => _Subject();
}

class _Subject extends State<Subject> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KPIdb'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[],
      ),
      body: Container(
          color: const Color(0xfff7f4ff),
          child: SizedBox.expand(
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(40.0, 60.0, 40.0, 20.0),
                        padding: const EdgeInsets.fromLTRB(40.0, 23.0, 40.0, 23.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[700],
                        ),
                        child: Text("Бази даних-2", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(

                                child: Text("4.5", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                            ),
                            Container(
                                width: 30.0,
                                child: IconButton(
                                  icon: Icon(Icons.star, color: Colors.yellow[600], size: 30.0,),
                                )
                            ),
                            Container(
                                width: 30.0,
                                child: IconButton(
                                  icon: Icon(Icons.star, color: Colors.yellow[600], size: 30.0,),
                                )
                            ),
                            Container(
                                width: 30.0,
                                child: IconButton(
                                  icon: Icon(Icons.star, color: Colors.yellow[600], size: 30.0,),
                                )
                            ),
                            Container(
                                width: 30.0,
                                child: IconButton(
                                  icon: Icon(Icons.star, color: Colors.yellow[600], size: 30.0,),
                                )
                            ),
                            Container(
                                width: 30.0,
                                child: IconButton(
                                  icon: Icon(Icons.star, color: Colors.yellow[600], size: 30.0,),
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: FlatButton(
                          //onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherW()));},
                          onPressed: (){Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) {
                                //return TeacherW();
                              }));},
                          color: Colors.deepPurple[600],
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)
                          ),
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Text("Оцінити викладача", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Divider(
                                height: 40.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Container(

                                      child: Text("4.5", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                              child: Text("Давно выяснено, что при оценке дизайна и композиции заполнение шаблона, а также реальное распределение букв и пробелов в абзацах", style: TextStyle(fontSize: 16.0),),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Divider(
                                height: 40.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Container(

                                      child: Text("4.5", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                              child: Text("Давно выяснено, что при оценке дизайна и композиции заполнение шаблона, а также реальное распределение букв и пробелов в абзацах", style: TextStyle(fontSize: 16.0),),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Divider(
                                height: 40.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Container(

                                      child: Text("4.5", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                  Container(
                                      width: 25.0,
                                      child: IconButton(
                                        icon: Icon(Icons.star, color: Colors.yellow[600], size: 25.0,),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                              child: Text("Давно выяснено, что при оценке дизайна и композиции заполнение шаблона, а также реальное распределение букв и пробелов в абзацах", style: TextStyle(fontSize: 16.0),),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Divider(
                          height: 50.0,
                          color: Colors.blueGrey,
                        ),
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