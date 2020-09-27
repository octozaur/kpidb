import 'package:flutter/material.dart';
import 'package:kpidb/bodys/lists/teachersTeacher.dart';
import '../../data/customColors.dart';

import '../../services/DatabaseService.dart';
import '../../navs/classroom.dart';
import '../../data/lesson.dart';

class TopClassrooms extends StatefulWidget {

  @override
  _TopClassrooms createState() => _TopClassrooms();
}

class _TopClassrooms extends State<TopClassrooms> {
  var classroomNames = new List<String>();
  var ratings = new List<double>();
  double rating = 0;
  var str;
  var limit = 5;

  Future fetch() async{
    var db = await DatabaseService().kpidbCollection.collection("classrooms").orderBy("current_rating").limit(limit).getDocuments();

    db.documents.forEach((doc){

      if(doc.data["current_rating"] is double){
        ratings.add(double.parse(doc.data["current_rating"].toStringAsFixed(2)));

      }
      else{
        ratings.add(double.parse(doc.data["current_rating"].toString()));

      }
      classroomNames.add(doc.data["classroom_name"]);
    });
    classroomNames = classroomNames.reversed.toList();
    ratings = ratings.reversed.toList();
  }
  var t = false;
  @override
  void initState() {
    super.initState();
    var f = fetch();
    f.then((d){t = true; setState(() {
    });});
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
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.0, top: 20.0, bottom: 12.0),

                child: Text("Топ $limit аудіторій:", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black87),),
              ),
              if(t == true)
                ...classroomNames.map((a){i++; str = a; return InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Classroom(a)));},
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x1A330099),
                          blurRadius: 10.0, // has the effect of softening the shadow
                          spreadRadius: 5.0, // has the effect of extending the shadow
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text("$str", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.deepPurple[900]), textAlign: TextAlign.left,),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(

                                  child: Text("${ratings[i]}", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black87),)
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(ratings[i] >= 1 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 30.0,),
                                  )
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(ratings[i] >= 2 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 30.0,),
                                  )
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(ratings[i] >= 3 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 30.0,),
                                  )
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(ratings[i] >= 4 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 30.0,),
                                  )
                              ),
                              Container(
                                  width: 30.0,
                                  child: IconButton(
                                    icon: Icon(ratings[i] >= 5 ? Icons.star : Icons.star_border, color: Colors.yellow[600], size: 30.0,),
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
      ),
    );
  }
}